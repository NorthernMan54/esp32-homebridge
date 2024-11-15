#ifndef HAPDEVICE_H
#define HAPDEVICE_H

#include <Arduino.h>
#include <HTTPClient.h>
#include <WiFiClient.h>
#include <ArduinoJson.h>
#include <functional>

class HAPDevice
{
public:
  // Constructor
  HAPDevice();

  // Accessor methods to get device info
  String getInstanceName();
  String getUUID();
  String getDisplayName();
  uint16_t getAID();
  uint16_t getIID();

  void addDevices(ArduinoJson::DynamicJsonDocument tiles);
  // Function to trigger the event manually if needed
  void sendEvent(String message);

  // Setter for event callback
  void setEventCallback(void (*callback)(String));

  // Method to get characteristic
  String getCharacteristic();

  // Method to get characteristic
  bool regEvents();

private:
  String instanceName;
  String uuid;
  String displayName;
  uint16_t aid;
  uint16_t iid;
  HTTPClient http;
  void (*eventCallback)(String) = nullptr;
  // String _getCharacteristic(String instance, uint16_t aid, uint16_t iid);
  WiFiClient client;
};

#endif // HAPDEVICE_H