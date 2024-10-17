#include <Arduino.h>

#include <esp32_smartdisplay.h>
#include <ui/ui.h>



void setup()
{
#ifdef ARDUINO_USB_CDC_ON_BOOT
  delay(5000);
#endif
  Serial.begin(115200);
  Serial.setDebugOutput(true);


  log_i("Board: %s", BOARD_NAME);
  log_i("CPU: %s rev%d, CPU Freq: %d Mhz, %d core(s)", ESP.getChipModel(), ESP.getChipRevision(), getCpuFrequencyMhz(), ESP.getChipCores());
  log_i("Free heap: %d bytes", ESP.getFreeHeap());
  log_i("Free PSRAM: %d bytes", ESP.getPsramSize());
  log_i("SDK version: %s", ESP.getSdkVersion());

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
}

ulong next_millis;
auto lv_last_tick = millis();

void loop()
{
  auto const now = millis();

  // Update the ticker
  lv_tick_inc(now - lv_last_tick);
  lv_last_tick = now;
  // Update the UI
  lv_timer_handler();
}
