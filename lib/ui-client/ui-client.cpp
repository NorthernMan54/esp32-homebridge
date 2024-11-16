#include <ArduinoJson.hpp>

void uiClientSetup()
{
}

void uiClientLoop()
{
}

/*
[{
  instanceName: "Tasmota-CC79",
  uuid: "43",
  displayName: "West Bedroom",
  aid: 75,
  iid: 10
}]
*/
/**
 * @brief
 *
 * @return ArduinoJson::DynamicJsonDocument
 */
ArduinoJson::DynamicJsonDocument uiClientGetConfig()
{
  ArduinoJson::DynamicJsonDocument doc(1024);
  ArduinoJson::JsonArray arr = doc.to<ArduinoJson::JsonArray>();

  ArduinoJson::JsonObject obj1 = arr.createNestedObject();
  obj1["instanceName"] = "Heisenberg-4534";
  obj1["uuid"] = "25";
  obj1["displayName"] = "Yamaha Power";
  obj1["aid"] = 7;
  obj1["iid"] = 10;

  ArduinoJson::JsonObject obj = arr.createNestedObject();
  obj["instanceName"] = "Tasmota-CC79";
  obj["uuid"] = "43";
  obj["displayName"] = "West Bedroom";
  obj["aid"] = 75;
  obj["iid"] = 10;
  return doc;
}