#include <ArduinoJson.hpp>
#include <hapDevices.h>

HAPDevice hapDevices;

void displaySetup()
{
}

void displayLoop()
{
  hapDevices.loop();
}

void displaySetConfig(ArduinoJson::DynamicJsonDocument tiles)
{
  hapDevices.addDevices(tiles);
}
