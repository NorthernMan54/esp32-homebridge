#include "homeKitDeviceController.h"
#include <ArduinoJson.hpp>
#include <HTTPClient.h>
#include "hapCache.h"
#include <WiFi.h>

// local function declarations
String registerMessage(uint16_t aid, uint16_t iid);
String registerPayload(uint16_t aid, uint16_t iid);

// Callback for data available

void dataAvailable(void *r, AsyncClient *c, void *buf, size_t len)
{
  Serial.printf("[HK]: Data Available %s, %d\n", String((char *)buf).substring(0, len).c_str(), len);
};

HomeKitDeviceController::HomeKitDeviceController(String instance, uint16_t accessoryAID, uint16_t accessoryIID)
    : instance(instance), aid(accessoryAID), iid(accessoryIID), eventCallback(nullptr)
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
    return;
  }

  client.connect(service.ip, service.port);

  client.onData(dataAvailable);
  client.onDisconnect([](void *r, AsyncClient *c)
                      { Serial.printf("[Comm]: Disconnected from Spa\n"); });

  client.onConnect([this](void *r, AsyncClient *c)
                   { onConnect(r, c); });

  client.onTimeout([](void *r, AsyncClient *c, uint32_t time)
                   { Serial.printf("[Comm]: Timeout from Spaa\n"); });

  client.onError([](void *r, AsyncClient *c, int8_t error)
                 { Serial.printf("[Comm]: Connected to Spa %d\n", error); });
}

void HomeKitDeviceController::onConnect(void *r, AsyncClient *c)
{
  Serial.printf("[HK]: Connected to HK Device %s\n", c->remoteIP().toString().c_str());
  String message = registerMessage(aid, iid);
  client.add(message.c_str(), message.length());
  client.send();
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

void HomeKitDeviceController::sendData(const char *data)
{
  //  if (client->connected()) {
  //      client->write(data);
  //  } else {
  //      Serial.println("Not connected, unable to send data");
  //  }
}

String registerMessage(uint16_t aid, uint16_t iid)
{
  String payload = registerPayload(aid, iid);
  int contentLength = payload.length();
  String headers = "PUT /characteristics HTTP/1.1\r\n";
  headers += "Content-Type: application/hap+json\r\n";
  headers += "Authorization: 031-45-154\r\n";
  headers += "HAP-Version: 1.0\r\n";
  headers += "Content-Length: " + String(contentLength) + "\r\n";
  headers += "\r\n";
  log_i("Event Message: \n%s%s\n", headers.c_str(), +payload.c_str());
  return headers + payload + "\r\n";
}

String registerPayload(uint16_t aid, uint16_t iid)
{
  ArduinoJson::DynamicJsonDocument doc(1024);
  //ArduinoJson::JsonArray arr = doc.to<ArduinoJson::JsonArray>();

  ArduinoJson::JsonObject obj = doc.createNestedArray("characteristics").createNestedObject();
  obj["aid"] = aid;
  obj["iid"] = iid;
  obj["ev"] = true;

  String payload;
  serializeJson(doc, payload);
  return payload;
}
