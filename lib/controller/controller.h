#ifndef CONTROLLER_H
#define CONTROLLER_H

#include "homeKitDeviceController.h" // Correct the path
#include <ArduinoJson.hpp>
#include "lvgl.h"

void controllerSetup();

void controllerLoop(); 

void addDevices(ArduinoJson::DynamicJsonDocument tiles);

/**
 * @brief Holder for an accessory, links the accessory to the controller and the UI button
 * 
 */
struct hbAccessory
{
  String uuid;                          // UUID / type of the accessory
  String displayName;                   // Display name of the accessory
  HomeKitDeviceController *hapDevice;  // The controller for the accessory
  lv_obj_t *button;                     //// The UI button for the accessory
};

#endif