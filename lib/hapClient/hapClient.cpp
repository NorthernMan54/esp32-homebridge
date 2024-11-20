#include <ArduinoJson.hpp>
#include <TickTwo.h>
#include "hapClient.h"
#include "hapCache.h"
#include <../controller/controller.h>

#include <WiFi.h>
#include <homeKitDeviceController.h>
#include "../../src/main.h"
#include <ui.h>

extern int accessoryCount;
extern hbAccessory *accessories[];

// #define logSection(section) log_i("************* %s **************", section);

void hapClientRefresh();
TickTwo hapClientRefreshTick(hapClientRefresh, 0); // Run once on startup

lv_obj_t *mainSreen;

void hapClientSetup()
{
  hapCacheSetup();
  hapClientRefreshTick.start();
  // mainSreen = uiMainScreen();
}

void hapClientLoop()
{
  hapCacheLoop();
  if (WiFi.status() == WL_CONNECTED)
  {
    hapClientRefreshTick.update();
    for (int i = 0; i < accessoryCount; i++)
    {
      if (accessories[i]->hapDevice != nullptr) {
      accessories[i]->hapDevice->loop();
      }
    }
  }
}

void hapClientRefresh()
{
  logSection("UI Get Config");
  auto config = hapClientGetConfig();
  log_i("Config: %s", config.as<String>().c_str());
  addDevices(config);
  hapClientRefreshTick.interval(15 * 60 * 1000 * 1000); // Refresh every 15 minutes
}

/**
 * @brief
 *
 * @return ArduinoJson::DynamicJsonDocument
 */
ArduinoJson::DynamicJsonDocument hapClientGetConfig()
{
  ArduinoJson::DynamicJsonDocument doc(1024);
  ArduinoJson::JsonArray arr = doc.to<ArduinoJson::JsonArray>();

  ArduinoJson::JsonObject obj1 = arr.createNestedObject();
  obj1["instanceName"] = "Heisenberg-4534";
  obj1["uuid"] = "25";
  obj1["displayName"] = "Yamaha Power";
  obj1["aid"] = 7;
  obj1["iid"] = 10;

  ArduinoJson::JsonObject obj2 = arr.createNestedObject();
  obj2["instanceName"] = "Tasmota-CC79";
  obj2["uuid"] = "43";
  obj2["displayName"] = "West Bedroom";
  obj2["aid"] = 75;
  obj2["iid"] = 10;

  ArduinoJson::JsonObject obj3 = arr.createNestedObject();
  obj3["instanceName"] = "Tasmota-CC79";
  obj3["uuid"] = "43";
  obj3["displayName"] = "East Bedroom";
  obj3["aid"] = 11;
  obj3["iid"] = 10;

  ArduinoJson::JsonObject obj4 = arr.createNestedObject();
  obj4["instanceName"] = "Tasmota-CC79";
  obj4["uuid"] = "43";
  obj4["displayName"] = "Front Hall";
  obj4["aid"] = 14;
  obj4["iid"] = 10;
  return doc;
}