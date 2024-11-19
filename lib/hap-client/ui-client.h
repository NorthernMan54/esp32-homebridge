#ifndef UI_CLIENT_H
#define UI_CLIENT_H

#include "homeKitDeviceController.h" // Correct the path
#include <ArduinoJson.hpp>



void uiClientSetup();

void uiClientLoop();

ArduinoJson::DynamicJsonDocument uiClientGetConfig();

struct Accessory
{
  String uuid;
  String displayName;
  HomeKitDeviceController *controller;
};

#endif