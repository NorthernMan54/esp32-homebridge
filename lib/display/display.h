#ifndef DISPLAY_H
#define DISPLAY_H
#include <ArduinoJson.hpp>

void displaySetup();

void displayLoop();

void displaySetConfig(ArduinoJson::DynamicJsonDocument config);

#endif