#ifndef UI_CLIENT_H
#define UI_CLIENT_H
#include <ArduinoJson.hpp>
#include "homeKitDeviceController.h" // Correct the path


void uiClientSetup();

void uiClientLoop();

ArduinoJson::DynamicJsonDocument uiClientGetConfig();

struct Accessory
{
  String instanceName;
  String uuid;
  String displayName;
  uint16_t aid;
  uint16_t iid;
  HomeKitDeviceController *controller;
};

#endif