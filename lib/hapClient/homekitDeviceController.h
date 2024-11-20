#ifndef HOMEKITDEVICECONTROLLER_H
#define HOMEKITDEVICECONTROLLER_H

#include <Arduino.h>
#include <AsyncTCP.h>
#include <TickTwo.h>
#include <functional>

// Forward declaration of Accessory struct
struct hbAccessory;

class HomeKitDeviceController
{
public:
  HomeKitDeviceController(String instance, uint16_t accessoryAID, uint16_t accessoryIID);
  ~HomeKitDeviceController();

  String setCharacteristic(const char *value);
  String setCharacteristic(uint16_t value);
  String getCharacteristic(); // Gets a characteristic value
  void setEventCallback(void (*callback)(const char *, hbAccessory *), hbAccessory *accessory);

  void loop();

private:
  hbAccessory *contextAccessory; // Store the context
  AsyncClient client;
  String instance;
  IPAddress ip;

  uint16_t aid;              // Accessory ID
  uint16_t iid;              // Instance ID
  TickTwo homekitDeviceTick; // Timer for periodic events

  void dataAvailable(void *r, AsyncClient *c, void *buf, size_t len);
  void (*eventCallback)(const char *, hbAccessory *);
  void reconnect();
  void onConnect(void *r, AsyncClient *c);
  void onDisconnect(void *r, AsyncClient *c);

  void sendData(const char *data);
};

#endif // HOMEKITDEVICECONTROLLER_H