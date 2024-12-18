#include <Arduino.h>
#include "main.h"

#include <WiFi.h>
#include <TickTwo.h>

// local libraries

#include <wifiModule.h>
#include <restartReason.h>
#include <hapClient.h>
#include <controller.h>
#include <homekitDeviceController.h>
// #include <display.h>

#ifdef LVGL_ENABLED
#include <ui.h>
#ifdef LVGL_ARDUINO_GFX
#include <Arduino_gfx.h>
#include <Arduino_GFX_Library.h>
#endif
// #include <esp32_smartdisplay.h>
// #include <ui/ui.h>
#endif

String buildDefinitionString = "";
#define addBuildDefinition(name) buildDefinitionString += #name " ";

/**
 * @brief Refresh the config from the Homebridge UI Server
 *
 */

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
#ifdef LVGL_ARDUINO_GFX
  addBuildDefinition("LVGL_ARDUINO_GFX");
#endif
  log_i("Build Definitions: %s", buildDefinitionString.c_str());

  logSection("WiFi Setup");
  wifiModuleSetup();
  log_i("ESP Information %s", PIOENV);
  logSection("hapClient Setup");
  hapClientSetup();
  logSection("Display Setup");
#ifdef LVGL_ENABLED
  log_i("Initializing Smart Display");
#ifdef LVGL_ARDUINO_GFX
  arduinoGFXSetup();
#endif

  // __attribute__((unused)) auto disp = lv_disp_get_default();
  ui_init(); // This is the UI setup function generated by SquareLine Studio

  // Update the ticker
  lv_tick_inc(0);

  // Update the UI
  lv_timer_handler();
  arduinoGFXLoop();
#endif
  logSection("Controller Setup");
  controllerSetup();
  logSection("Setup Complete");
}

#ifdef LVGL_ENABLED
ulong next_millis;
auto lv_last_tick = millis();
#endif

void loop()
{

  wifiModuleLoop();
  hapClientLoop();

#ifdef LVGL_ENABLED
  auto const now = millis();

  // Update the ticker
  lv_tick_inc(now - lv_last_tick);
  lv_last_tick = now;
  // Update the UI
  lv_timer_handler();
  arduinoGFXLoop();
#endif
  controllerLoop();
}
