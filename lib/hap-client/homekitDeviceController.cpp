#include "homeKitDeviceController.h"
#include <ArduinoJson.hpp>
#include <HTTPClient.h>
#include <TickTwo.h>
#include "hapCache.h"
#include <WiFi.h>

// local function declarations
String registerMessage(String host, uint16_t aid, uint16_t iid);
String registerPayload(uint16_t aid, uint16_t iid);

// Callback for data available
/*
  Status Code: 20
  Headers:
  EVENT/1.0 200 OK
  Content-Type: application/hap+json
  Content-Length: 50
  Body:
  {"characteristics":[{"aid":7,"iid":10,"value":0}]}
*/
String processHttpResponse(String host, const char *data, size_t len)
{
  log_i("Processing HTTP response from: %s", host.c_str());
  String response(data, len);

  // Split headers and body
  int headerEndIndex = response.indexOf("\r\n\r\n");
  String headers = response.substring(0, headerEndIndex);
  String body = response.substring(headerEndIndex + 4);

  // Parse the status line (e.g., "HTTP/1.1 204 No Content")
  int statusLineEnd = headers.indexOf("\r\n");
  String statusLine = headers.substring(0, statusLineEnd);

  // Check HTTP status code
  int statusCode = statusLine.substring(10, 13).toInt();
  Serial.printf("Status Code: %d\n", statusCode);

  if (statusCode == 204)
  {
    Serial.println("No content in response.");
  }

  // Print headers
  Serial.println("Headers:");
  Serial.println(headers);

  // Print body, if present
  if (!body.isEmpty())
  {
    Serial.println("Body:");
    Serial.println(body);
  }
  if (statusCode == 200)
  {
    // Parse the JSON body
    ArduinoJson::DynamicJsonDocument doc(1024);
    ArduinoJson::deserializeJson(doc, body);
    ArduinoJson::JsonArray characteristics = doc["characteristics"];
    for (ArduinoJson::JsonObject characteristic : characteristics)
    {
      uint16_t aid = characteristic["aid"];
      uint16_t iid = characteristic["iid"];
      String value = characteristic["value"];
      log_i("Characteristic: %d.%d = %s", aid, iid, value.c_str());
      return value;
    }
  }
}

HomeKitDeviceController::HomeKitDeviceController(String instance, uint16_t accessoryAID, uint16_t accessoryIID)
    : instance(instance), aid(accessoryAID), iid(accessoryIID), eventCallback(nullptr), homekitDeviceTick([this]()
                                                                                                          { reconnect(); }, 0)
{

  client.onData(dataAvailable);
  
  client.onDisconnect([this](void *r, AsyncClient *c)
                      { onDisconnect(r, c); });

  client.onConnect([this](void *r, AsyncClient *c)
                   { onConnect(r, c); });

  client.onTimeout([](void *r, AsyncClient *c, uint32_t time)
                   { Serial.printf("[Comm]: Timeout from Spaa\n"); });

  client.onError([](void *r, AsyncClient *c, int8_t error)
                 { Serial.printf("[Comm]: Connected to Spa %d\n", error); });

  homekitDeviceTick.start();
}

void HomeKitDeviceController::loop()
{
  homekitDeviceTick.update();
}

void HomeKitDeviceController::reconnect()
{
  HapService service;
  if (hapCache.find(instance) != hapCache.end())
  {
    service = hapCache[instance];
    Serial.printf("Cached Service - Name: %s, IP: %s, Port: %d\n",
                  service.name.c_str(),
                  service.ip.toString().c_str(),
                  service.port);
  }
  else
  {
    log_e("Connecting to %s failed, address not available", instance.c_str());
    hapCacheRefresh();
    return;
  }
  if (!client.connected())
  {
    log_i("Connecting to %s:%d", service.ip.toString().c_str(), service.port);
    client.connect(service.ip, service.port);
  }
  else
  {
    homekitDeviceTick.interval(30 * 1000); // Run every 30 seconds
  }
}

void HomeKitDeviceController::onConnect(void *r, AsyncClient *c)
{
  String host = c->remoteIP().toString() + ":" + String(c->remotePort());
  log_i("[HK]: Connected to HK Device %s", host.c_str());
  String message = registerMessage(host, aid, iid);
  client.add(message.c_str(), message.length());
  client.send();
}

void HomeKitDeviceController::dataAvailable(void *r, AsyncClient *c, void *buf, size_t len)
{
  // Serial.printf("[HK]: Data Available %s, %d\n", String((char *)buf).substring(0, len).c_str(), len);
  String host = c->remoteIP().toString() + ":" + String(c->remotePort());
  String value = processHttpResponse(host, (const char *)buf, len);
  if( value.length() > 0) {
    if (eventCallback)
    {
      eventCallback(value.c_str());
    }
  }
}

void HomeKitDeviceController::onConnect(void *r, AsyncClient *c)
{
  String host = c->remoteIP().toString() + ":" + String(c->remotePort());
  log_i("[HK]: Connected to HK Device %s", host.c_str());
  String message = registerMessage(host, aid, iid);
  client.add(message.c_str(), message.length());
  client.send();
}

void HomeKitDeviceController::dataAvailableWrapper(void *r, AsyncClient *c, void *buf, size_t len)
{
  HomeKitDeviceController* controller = static_cast<HomeKitDeviceController*>(r);
  controller->dataAvailable(r, c, buf, len);
}

void HomeKitDeviceController::onDisconnect(void *r, AsyncClient *c)
{
  String host = c->remoteIP().toString() + ":" + String(c->remotePort());
  log_i("[HK]: Disconnected from HK Device %s", instance.c_str());
}

HomeKitDeviceController::~HomeKitDeviceController()
{
  //  if (client) {
  //      client->close();
  //      delete client;
  //  }
}

/**
 * @brief Set the Characteristic object
 * @param value as String
 * @return String
 */
String HomeKitDeviceController::setCharacteristic(const char *value)
{
  HapService service;
  if (hapCache.find(instance) != hapCache.end())
  {
    service = hapCache[instance];
    Serial.printf("Cached Service - Name: %s, IP: %s, Port: %d\n",
                  service.name.c_str(),
                  service.ip.toString().c_str(),
                  service.port);
  }
  else
  {
    return "Service not found";
  }
  HTTPClient http;
  http.addHeader("Content-Type", "Application/json");
  http.addHeader("Authorization", "031-45-154");

  // '{"characteristics":[{"aid":25,"iid":9,"value":false},{"aid":23,"iid":9,"value":false},{"aid":24,"iid":9,"value":false}]}'

  ArduinoJson::DynamicJsonDocument doc(1024);
  ArduinoJson::JsonArray arr = doc.to<ArduinoJson::JsonArray>();
  ArduinoJson::JsonObject obj = arr.createNestedObject();
  obj["aid"] = aid;
  obj["iid"] = iid;
  obj["value"] = value;

  String endpoint = "/characteristics?id=" + String(aid) + "." + String(iid) + "&value=" + value;
  String url = "http://" + service.ip.toString() + ":" + String(service.port) + endpoint;
  http.begin(url); // Start HTTP connection to resolved IP

  String payload;
  serializeJson(doc, payload);
  int httpCode = http.PUT(payload);
  String response = http.getString();
  log_i("HTTP GET: %d", httpCode);
  log_i("Payload: %s", response.c_str());
  return response;
}

String HomeKitDeviceController::setCharacteristic(uint16_t value)
{
  HapService service;
  if (hapCache.find(instance) != hapCache.end())
  {
    service = hapCache[instance];
    Serial.printf("Cached Service - Name: %s, IP: %s, Port: %d\n",
                  service.name.c_str(),
                  service.ip.toString().c_str(),
                  service.port);
  }
  else
  {
    return "Service not found";
  }
  HTTPClient http;
  http.addHeader("Content-Type", "Application/json");
  http.addHeader("Authorization", "031-45-154");

  // '{"characteristics":[{"aid":25,"iid":9,"value":false},{"aid":23,"iid":9,"value":false},{"aid":24,"iid":9,"value":false}]}'

  ArduinoJson::DynamicJsonDocument doc(1024);
  ArduinoJson::JsonArray arr = doc.to<ArduinoJson::JsonArray>();
  ArduinoJson::JsonObject obj = arr.createNestedObject();
  obj["aid"] = aid;
  obj["iid"] = iid;
  obj["value"] = value;

  String endpoint = "/characteristics?id=" + String(aid) + "." + String(iid) + "&value=" + value;
  String url = "http://" + service.ip.toString() + ":" + String(service.port) + endpoint;
  http.begin(url); // Start HTTP connection to resolved IP

  String payload;
  serializeJson(doc, payload);
  int httpCode = http.PUT(payload);
  String response = http.getString();
  log_i("HTTP GET: %d", httpCode);
  log_i("Payload: %s", response.c_str());
  return response;
}

/**
 * @brief Get the Characteristic object
 *
 * @return String
 */
String HomeKitDeviceController::getCharacteristic()
{
  HapService service;
  if (hapCache.find(instance) != hapCache.end())
  {
    service = hapCache[instance];
    Serial.printf("Cached Service - Name: %s, IP: %s, Port: %d\n",
                  service.name.c_str(),
                  service.ip.toString().c_str(),
                  service.port);
  }
  else
  {
    return "Service not found";
  }

  HapService homebridge = hapCache[instance];
  HTTPClient http;
  http.addHeader("Content-Type", "Application/json");
  http.addHeader("Authorization", "031-45-154");

  String endpoint = "/characteristics?id=" + String(aid) + "." + String(iid);
  String url = "http://" + service.ip.toString() + ":" + String(service.port) + endpoint;
  http.begin(url); // Start HTTP connection to resolved IP

  int httpCode = http.GET();
  String payload = http.getString();
  log_i("HTTP GET: %d", httpCode);
  log_i("Payload: %s", payload.c_str());
  return payload;
}

// Registers a callback to be invoked when data is received
void HomeKitDeviceController::setEventCallback(DataReceivedCallback callback)
{
  eventCallback = callback;
}


String registerMessage(String host, uint16_t aid, uint16_t iid)
{
  String payload = registerPayload(aid, iid);
  int contentLength = payload.length();
  String headers = "PUT /characteristics HTTP/1.1\r\n";
  headers += "Host: " + String(host) + "\r\n";
  headers += "Content-Type: application/json\r\n";
  headers += "Authorization: 031-45-154\r\n";
  headers += "HAP-Version: 1.0\r\n";
  headers += "connection: keep-alive\r\n";
  headers += "Content-Length: " + String(contentLength) + "\r\n";
  headers += "\r\n";
  log_i("Event Message: \n%s%s\n", headers.c_str(), +payload.c_str());
  return headers + payload + "\r\n";
}

String registerPayload(uint16_t aid, uint16_t iid)
{
  ArduinoJson::DynamicJsonDocument doc(1024);
  // ArduinoJson::JsonArray arr = doc.to<ArduinoJson::JsonArray>();

  ArduinoJson::JsonObject obj = doc.createNestedArray("characteristics").createNestedObject();
  obj["aid"] = aid;
  obj["iid"] = iid;
  obj["ev"] = true;

  String payload;
  serializeJson(doc, payload);
  return payload;
}