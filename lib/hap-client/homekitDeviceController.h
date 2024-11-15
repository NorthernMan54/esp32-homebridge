#ifndef HOMEKITDEVICECONTROLLER_H
#define HOMEKITDEVICECONTROLLER_H

#include <Arduino.h>
#include <ESPAsyncWebServer.h>
#include <AsyncTCP.h>
// #include <PsychicHttp.h>
#include <functional>

// Define a callback type for received data events
typedef std::function<void(const char *data)> DataReceivedCallback;

class HomeKitDeviceController
{
public:
  HomeKitDeviceController(String instance, uint16_t accessoryAID, uint16_t accessoryIID);
  ~HomeKitDeviceController();

  String setCharacteristic(const char *value);
  String setCharacteristic(uint16_t value);
  String getCharacteristic();                           // Gets a characteristic value
  void setEventCallback(DataReceivedCallback callback); // Registers a callback for received data

private:
  AsyncClient client;
  String instance;
  uint16_t aid; // Accessory ID
  uint16_t iid; // Instance ID

  DataReceivedCallback eventCallback; // Holds the callback function
  void onConnect(void *r, AsyncClient *c);

  void sendData(const char *data);
  //  void onConnect(void *arg, AsyncClient *client);
  //  void onDataReceived(void *arg, AsyncClient *client, void *data, size_t len);
  //  void onDisconnect(void *arg, AsyncClient *client);
  //  void onError(void *arg, AsyncClient *client, int8_t error);
};

#endif
