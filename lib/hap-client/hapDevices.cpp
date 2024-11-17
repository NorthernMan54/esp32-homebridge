#include <Arduino.h>
#include <ArduinoJson.hpp>
#include <HTTPClient.h>
#include <WiFiClient.h>
#include <functional> // For std::function
#include <map>
#include <WiFi.h>
#include <hapCache.h>

#include "hapDevices.h"
#include <homeKitDeviceController.h>

const int MAX_ACCESSORIES = 32;
HomeKitDeviceController *accessories[MAX_ACCESSORIES] = {nullptr};
int accessoryCount = 0;

void dataReceivedHandler(const char *data)
{
  log_i("Event Callback: Data received from accessory: \n%s", data);  
}

// Initialize accessories and set the event callback
//  addAccessory("192.168.1.100", 5000, 1, 101);
//  addAccessory("192.168.1.101", 5000, 2, 102);

// Constructor definition

void HAPDevice::addDevices(ArduinoJson::DynamicJsonDocument tiles)
{
  for (ArduinoJson::JsonObject tile : tiles.as<ArduinoJson::JsonArray>())
  {
    String instanceName = tile["instanceName"].as<String>();
    String uuid = tile["uuid"].as<String>();
    String displayName = tile["displayName"].as<String>();
    uint16_t aid = tile["aid"].as<uint16_t>();
    uint16_t iid = tile["iid"].as<uint16_t>();

    log_i("Instance Name: %s, UUID: %s, Display Name: %s, AID: %d, IID: %d", instanceName.c_str(), uuid.c_str(), displayName.c_str(), aid, iid);

    if (accessoryCount < MAX_ACCESSORIES)
    {
      accessories[accessoryCount] = new HomeKitDeviceController(instanceName, aid, iid);
      accessories[accessoryCount]->setEventCallback(dataReceivedHandler); // Register event callback
      // accessories[accessoryCount]->connect();
      accessoryCount++;
    }
  }
}

void HAPDevice::loop()
{
  for (int i = 0; i < accessoryCount; i++)
  {
    accessories[i]->loop();
  }
}
HAPDevice::HAPDevice()
{
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
    log_i("Sending event: %s", message.c_str());
    eventCallback(message);
  }
}

// Setter for event callback
void HAPDevice::setEventCallback(void (*callback)(String))
{
  eventCallback = callback;
}

/**
 * @brief Return the current status of the device
 *
 * @return String
 */
String HAPDevice::getCharacteristic()
{
  // return _getCharacteristic(instanceName, aid, iid);
}

bool HAPDevice::regEvents()
{

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
}
