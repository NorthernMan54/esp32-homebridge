#ifndef UI_CLIENT_H
#define UI_CLIENT_H
#include <ArduinoJson.hpp>

void uiClientSetup();

void uiClientLoop();

ArduinoJson::DynamicJsonDocument uiClientGetConfig();


#endif