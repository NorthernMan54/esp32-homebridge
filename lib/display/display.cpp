#include <ArduinoJson.hpp>
#include <hapDevices.h>

HAPDevice hapDevices;

void displaySetup()
{
}

void displayLoop()
{
}

void displaySetConfig(ArduinoJson::DynamicJsonDocument tiles)
{
  hapDevices.addDevices(tiles);
}
