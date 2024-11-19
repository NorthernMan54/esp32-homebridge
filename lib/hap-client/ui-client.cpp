#include <ArduinoJson.hpp>
#include <TickTwo.h>
#include "ui-client.h"
#include "display.h"

#include <WiFi.h>
#include <homeKitDeviceController.h>
#include "../../src/main.h"
#include <ui.h>

// #define logSection(section) log_i("************* %s **************", section);

const int MAX_ACCESSORIES = 32;
Accessory *accessories[MAX_ACCESSORIES] = {nullptr};
int accessoryCount = 0;

void configRefresh();
TickTwo configRefreshTick(configRefresh, 0); // Run once on startup

lv_obj_t *mainSreen;

void uiClientSetup()
{
  configRefreshTick.start();
  // mainSreen = uiMainScreen();
}

bool firstBoot = true;

void uiClientLoop()
{
  if (WiFi.status() == WL_CONNECTED)
  {
    if (firstBoot)
    {
      firstBoot = false;
      lv_disp_load_scr(ui_mainScreen);
    };
    configRefreshTick.update();
    for (int i = 0; i < accessoryCount; i++)
    {
      accessories[i]->controller->loop();
    }
  }
}

void update_status(lv_obj_t *parent, const char *new_text)
{
  lv_obj_t *container = lv_obj_get_child(parent, 3);
  uint32_t child_count = lv_obj_get_child_cnt(container); // Get the number of children
  bool skipFirst = true;
  log_i("Child count: %s, %d", new_text, child_count);
  for (uint32_t i = 0; i < child_count; i++)
  {
    lv_obj_t *child = lv_obj_get_child(container, i); // Get the child by index
    if (lv_obj_check_type(child, &lv_label_class))
    {
      if (skipFirst)
      {
        skipFirst = false;
        continue;
      }
      log_i("Updating label text", new_text);
      lv_label_set_text(child, new_text); // Update the label text
      break;                              // Update the first label found (optional)
    }
  }
}

void dataReceivedHandler(const char *data, Accessory *accessory)
{
  log_i("Event Callback: Data received from accessory (%s): \n%s",
        accessory->displayName.c_str(), data);

  ArduinoJson::StaticJsonDocument<256> doc; // Adjust size as needed

  // Parse the JSON string
  auto error = ArduinoJson::deserializeJson(doc, data);

  if (error)
  {
    Serial.print("Deserialization failed: ");
    Serial.println(error.c_str());
    return;
  }

  // Access the JSON array
  auto characteristics = doc["characteristics"].as<ArduinoJson::JsonArray>();

  if (!characteristics.isNull())
  {
    // Access the first object in the array
    auto characteristic = characteristics[0];

    // Extract values
    int aid = characteristic["aid"];
    int iid = characteristic["iid"];
    int value = characteristic["value"];

    // Print extracted values
    Serial.println("Extracted values:");
    Serial.print("aid: ");
    Serial.println(aid);
    Serial.print("iid: ");
    Serial.println(iid);
    Serial.print("value: ");
    Serial.println(value);
    update_status(accessory->button, (value ? "On" : "Off"));
  }
  else
  {
    Serial.println("Characteristics array not found.");
  }

  // update_status(accessories[accessoryCount]->button, data);
  // lv_label_set_text(accessory->button->statusLabel, data);
}

void update_label_text(lv_obj_t *parent, const char *new_text)
{
  lv_obj_t *container = lv_obj_get_child(parent, 3);
  uint32_t child_count = lv_obj_get_child_cnt(container); // Get the number of children
  log_i("Child count: %s, %d", new_text, child_count);
  for (uint32_t i = 0; i < child_count; i++)
  {
    lv_obj_t *child = lv_obj_get_child(container, i); // Get the child by index
    if (lv_obj_check_type(child, &lv_label_class))
    {
      log_i("Updating label text", new_text);
      lv_label_set_text(child, new_text); // Update the label text
      break;                              // Update the first label found (optional)
    }
  }
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
      accessories[accessoryCount]->button = ui_hkButtonContainer_create(ui_mainScreen);

      log_i("Accessory %s: children: %d", displayName.c_str(), lv_obj_get_child_cnt(accessories[accessoryCount]->button));
      // lv_obj_t * child = ui_comp_get_child(accessories[accessoryCount]->button, UI_COMP_HKBUTTONCONTAINER_CONTAINER2_HKDISPLAYNAME);
      update_label_text(accessories[accessoryCount]->button, displayName.c_str());

      String data = accessories[accessoryCount]->controller->getCharacteristic();
      dataReceivedHandler(data.c_str(), accessories[accessoryCount]);

      accessoryCount++;
    }
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