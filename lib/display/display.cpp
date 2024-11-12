#include <ArduinoJson.hpp>
#include <hapDevice.h>

void displaySetup()
{
}

void displayLoop()
{
}

void displaySetConfig(ArduinoJson::DynamicJsonDocument tiles)
{
  for (ArduinoJson::JsonObject tile : tiles.as<ArduinoJson::JsonArray>())
  {
    String instanceName = tile["instanceName"].as<String>();
    String uuid = tile["uuid"].as<String>();
    String displayName = tile["displayName"].as<String>();
    uint16_t aid = tile["aid"].as<uint16_t>();
    uint16_t iid = tile["iid"].as<uint16_t>();
    log_i("Instance Name: %s, UUID: %s, Display Name: %s, AID: %d, IID: %d", instanceName.c_str(), uuid.c_str(), displayName.c_str(), aid, iid);

    // Create a new Smart Home Device
    HAPDevice unit(tile);
    log_i("Instance: %s, status: %s", displayName.c_str(), unit.getCharacteristic().c_str());
  }
}
