#include <Arduino.h>
#include "main.h"

#include <WiFi.h>
#include <TickTwo.h>

// local libraries

#include <wifiModule.h>
#include <restartReason.h>
#include <hapCache.h>
#include <ui-client.h>
#include <homekitDeviceController.h>
#include <display.h>

#ifdef LVGL_ENABLED
#include <esp32_smartdisplay.h>
#include <ui/ui.h>
#endif

void configRefresh();
TickTwo configRefreshTick(configRefresh, 0); // Run once on startup

String buildDefinitionString = "";
#define addBuildDefinition(name) buildDefinitionString += #name " ";

/**
 * @brief Refresh the config from the Homebridge UI Server
 * 
 */
void configRefresh()
{
  logSection("hapClient Get Config");
  auto config = uiClientGetConfig();
  log_i("Config: %s", config.as<String>().c_str());
  displaySetConfig(config);
  configRefreshTick.interval(15 * 60 * 1000 * 1000); // Refresh every 15 minutes
}

void setup()
{
#ifdef ARDUINO_USB_CDC_ON_BOOT
  delay(5000);
#endif
  Serial.begin(115200);
  Serial.setDebugOutput(true);
  logSection(PIOENV);
  log_i("Board: %s", BOARD_NAME);
  log_i("CPU: %s rev%d, CPU Freq: %d Mhz, %d core(s)", ESP.getChipModel(), ESP.getChipRevision(), getCpuFrequencyMhz(), ESP.getChipCores());
  log_i("Free heap: %d bytes", ESP.getFreeHeap());
  log_i("Free PSRAM: %d bytes", ESP.getPsramSize());
  log_i("SDK version: %s", ESP.getSdkVersion());
  log_i("Restart Reason: %s", getLastRestartReason().c_str());
#ifdef LVGL_ENABLED
  addBuildDefinition("LVGL_ENABLED");
#endif

  log_i("Build Definitions: %s", buildDefinitionString.c_str());
  logSection("WiFi Setup");
  wifiModuleSetup();
  log_i("ESP Information %s", PIOENV);
  logSection("hapClient Setup");
  hapCacheSetup();
  configRefreshTick.start();
#ifdef LVGL_ENABLED
  log_i("Initializing Smart Display");
  smartdisplay_init();
  log_i("LV_USE_LOG %d", LV_USE_LOG);
#ifdef LV_USE_LOG
  log_i("LV_LOG_LEVEL %d", LV_LOG_LEVEL);
  log_i("LV_LOG_PRINTF %d", LV_LOG_PRINTF);
#endif

  __attribute__((unused)) auto disp = lv_disp_get_default();
  // lv_disp_set_rotation(disp, LV_DISP_ROT_90);
  // lv_disp_set_rotation(disp, LV_DISP_ROT_180);
  // lv_disp_set_rotation(disp, LV_DISP_ROT_270);
  log_i("ui_init");
  ui_init();
// To use third party libraries, enable the define in lv_conf.h: #define LV_USE_QRCODE 1
#endif
}

#ifdef LVGL_ENABLED
ulong next_millis;
auto lv_last_tick = millis();
#endif

void loop()
{
  wifiModuleLoop();
  hapCacheLoop();
  if (WiFi.status() == WL_CONNECTED)
  {
    configRefreshTick.update();
  }
  displayLoop();

#ifdef LVGL_ENABLED
  auto const now = millis();

  // Update the ticker
  lv_tick_inc(now - lv_last_tick);
  lv_last_tick = now;
  // Update the UI
  lv_timer_handler();
#endif
}
