#include <ArduinoJson.hpp>
#include <TickTwo.h>
#include "ui-client.h"
#include "display.h"

#include <WiFi.h>
#include <homeKitDeviceController.h>
#include "../../src/main.h"

// #define logSection(section) log_i("************* %s **************", section);

const int MAX_ACCESSORIES = 32;
Accessory *accessories[MAX_ACCESSORIES] = {nullptr};
int accessoryCount = 0;

void configRefresh();
TickTwo configRefreshTick(configRefresh, 0); // Run once on startup

void uiClientSetup()
{
  configRefreshTick.start();
}

void uiClientLoop()
{
  if (WiFi.status() == WL_CONNECTED)
  {
    configRefreshTick.update();
    for (int i = 0; i < accessoryCount; i++)
    {
      accessories[i]->controller->loop();
    }
  }
}

void dataReceivedHandler(const char *data, Accessory *accessory)
{
  log_i("Event Callback: Data received from accessory (%s): \n%s",
        accessory->displayName.c_str(), data);
}

void addDevices(ArduinoJson::DynamicJsonDocument tiles)
{
  for (ArduinoJson::JsonObject tile : tiles.as<ArduinoJson::JsonArray>())
  {
    String instanceName = tile["instanceName"].as<String>();
    String uuid = tile["uuid"].as<String>();
    String displayName = tile["displayName"].as<String>();
    uint16_t aid = tile["aid"].as<uint16_t>();
    uint16_t iid = tile["iid"].as<uint16_t>();

    log_i("Instance Name: %s, UUID: %s, Display Name: %s, AID: %d, IID: %d", instanceName.c_str(), uuid.c_str(), displayName.c_str(), aid, iid);

    if (accessoryCount < MAX_ACCESSORIES)
    {
      accessories[accessoryCount] = new Accessory();
      accessories[accessoryCount]->uuid = uuid;
      accessories[accessoryCount]->displayName = displayName;
      accessories[accessoryCount]->controller = new HomeKitDeviceController(instanceName, aid, iid);

      // Pass the Accessory as context to the callback
      accessories[accessoryCount]->controller->setEventCallback(dataReceivedHandler, accessories[accessoryCount]);

      accessoryCount++;
    }

    ButtonDisplay_create(DISPLAY_WIDTH, DISPLAY_HEIGHT, 2, 2, 130, 100);
  }
}

void configRefresh()
{
  logSection("UI Get Config");
  auto config = uiClientGetConfig();
  log_i("Config: %s", config.as<String>().c_str());
  addDevices(config);
  configRefreshTick.interval(15 * 60 * 1000 * 1000); // Refresh every 15 minutes
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