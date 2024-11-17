#ifndef HOMEKITDEVICECONTROLLER_H
#define HOMEKITDEVICECONTROLLER_H

#include <Arduino.h> // Correct the path

#include <AsyncTCP.h>
#include <TickTwo.h>
#include <functional>
#include <ui-client.h>

// Define a callback type for received data events
typedef std::function<void(const char *data)> DataReceivedCallback;

class HomeKitDeviceController
{
public:
  HomeKitDeviceController(String instance, uint16_t accessoryAID, uint16_t accessoryIID);
  ~HomeKitDeviceController();

  String setCharacteristic(const char *value);
  String setCharacteristic(uint16_t value);
  String getCharacteristic(); // Gets a characteristic value
  void setEventCallback(DataReceivedCallback callback); // Registers a callback for received data

  void loop();

private:
  AsyncClient client;
  String instance;
  IPAddress ip;

  uint16_t aid; // Accessory ID
  uint16_t iid; // Instance ID
  TickTwo homekitDeviceTick; // Timer for periodic events

  DataReceivedCallback eventCallback; // Holds the callback function
  void reconnect();
  void onConnect(void *r, AsyncClient *c);
  void onDisconnect(void *r, AsyncClient *c);

  void sendData(const char *data);
};

#endif
