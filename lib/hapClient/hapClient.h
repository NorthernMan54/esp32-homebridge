#ifndef HAP_CLIENT_H
#define HAP_CLIENT_H

#include "homeKitDeviceController.h" // Correct the path
#include <ArduinoJson.hpp>
#include <controller.h>
#include "lvgl.h" 

void hapClientSetup();

void hapClientLoop();

ArduinoJson::DynamicJsonDocument hapClientGetConfig();

#endif