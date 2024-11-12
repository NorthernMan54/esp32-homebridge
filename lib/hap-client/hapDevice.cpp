#include <Arduino.h>
#include <ArduinoJson.hpp>
#include <HTTPClient.h>
#include <functional> // For std::function
#include <map>
#include <WiFi.h>
#include <hapCache.h>

#include "hapDevice.h"

// Constructor definition
HAPDevice::HAPDevice(ArduinoJson::DynamicJsonDocument doc)
{
  instanceName = doc["instanceName"].as<String>();
  uuid = doc["uuid"].as<String>();
  displayName = doc["displayName"].as<String>();
  aid = doc["aid"].as<uint16_t>();
  iid = doc["iid"].as<uint16_t>();
}

// Accessor methods to get device info
String HAPDevice::getInstanceName()
{
  return instanceName;
}

String HAPDevice::getUUID()
{
  return uuid;
}

String HAPDevice::getDisplayName()
{
  return displayName;
}

uint16_t HAPDevice::getAID()
{
  return aid;
}

uint16_t HAPDevice::getIID()
{
  return iid;
}

// Function to trigger the event manually if needed
void HAPDevice::sendEvent(String message)
{
  if (eventCallback)
  {
    eventCallback(message);
  }
}

// Setter for event callback
void HAPDevice::setEventCallback(void (*callback)(String))
{
  eventCallback = callback;
}

String _getCharacteristic(String instance, uint16_t aid, uint16_t iid);

// Method to get characteristic
String HAPDevice::getCharacteristic()
{
  return _getCharacteristic(instanceName, aid, iid);
}

/**
 * @brief Get the Characteristic object
 *
 * @param instance
 * @param aid
 * @param iid
 * @return String
 */
String _getCharacteristic(String instance, uint16_t aid, uint16_t iid)
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

/**
 * @brief Set the Characteristic object
 *
 * @param instance
 * @param aid
 * @param iid
 * @param value as String
 * @return String
 */
String setCharacteristic(String instance, uint16_t aid, uint16_t iid, String value)
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
 * @brief Set the Characteristic object
 *
 * @param instance name
 * @param aid
 * @param iid
 * @param value
 * @return String
 */
String setCharacteristic(String instance, uint16_t aid, uint16_t iid, uint16_t value)
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
