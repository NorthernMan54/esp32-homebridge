#include "wifiModule.h"
#include <WiFi.h>
#include <WiFiManager.h>
#include <ArduinoOTA.h>
#include <esp_task_wdt.h>
#ifdef TELNET_LOG
#include <TelnetStream.h>
#endif
#include <time.h>

#include <restartReason.h>

WiFiManager wifiManager;
char gatewayName[20];

void wifiModuleSetup()
{
  // String s = Network.macAddress();
  String s = WiFi.macAddress();
  sprintf(gatewayName, "spa-%.2s%.2s%.2s%.2s%.2s%.2s", s.c_str(),
          s.c_str() + 3, s.c_str() + 6, s.c_str() + 9, s.c_str() + 12,
          s.c_str() + 15);

  WiFi.setTxPower(WIFI_POWER_19_5dBm); // this sets wifi to highest power
  WiFi.setHostname(gatewayName);
  ArduinoOTA.setHostname(gatewayName);
  log_i("Gateway Name: %s", WiFi.getHostname());
  log_i("[WiFi]: OTA Hostname: %s", ArduinoOTA.getHostname().c_str());
}

void wifiModuleLoop()
{
  if (WiFi.status() != WL_CONNECTED)
  {
    wifiConnect();
  }
  else
  {
    ArduinoOTA.handle();
#ifdef TELNET_LOG
    switch (TelnetStream.read())
    {
    case 'C':
      TelnetStream.println("bye bye");
      TelnetStream.flush();
      TelnetStream.stop();
      break;
    }
#endif
  }
}

/* Functions */

void wifiConnect()
{
  log_i("[WiFi]: Connecting to %s", WIFI_SSID);
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  unsigned long timeout = millis() + WIFI_CONNECT_TIMEOUT;

  while (WiFi.status() != WL_CONNECTED && millis() < timeout)
  {
    yield();
  }
  if (WiFi.status() != WL_CONNECTED)
  {
    log_e("[WiFi]: Connect failed to %s", WIFI_SSID);
  }
  else
  {
    configTime(gmtOffset_sec, daylightOffset_sec, "pool.ntp.org");
    log_i("[WiFi]: Connected, IP Address: %s", WiFi.localIP().toString().c_str());
    log_i("[WiFi]: Time: %s", getStringTime().c_str());
    otaSetup();
#ifdef TELNET_LOG
    log_i("[WiFi]: Switching to telnet %p", WiFi.localIP());
    TelnetStream.begin();
    Log.begin(LOG_LEVEL, &TelnetStream);
#endif
  }
}

String getStringTime()
{
  struct tm timeinfo;
  if (!getLocalTime(&timeinfo))
  {
    log_e("[WiFi]: Obtaining Time failed");
    return String("Failed to obtain time");
  }
  char timeCharArray[64];
  strftime(timeCharArray, sizeof(timeCharArray), "%Y-%m-%d %H:%M:%S", &timeinfo);

  return String(timeCharArray);
}

void otaSetup()
{

  ArduinoOTA.begin();
  ArduinoOTA.onStart(notifyOfUpdateStarted);
  ArduinoOTA.onEnd(notifyOfUpdateEnded);
  ArduinoOTA.onProgress([](unsigned int progress, unsigned int total)
                        { log_i("[WiFi]: OTA Progress: %u%%\r", (progress / (total / 100))); 
                          esp_task_wdt_reset(); });
  ArduinoOTA.onError([](ota_error_t error)
                     {
    if (error == OTA_AUTH_ERROR)
      log_e("[WiFi]: OTA Auth Filed");
    else if (error == OTA_BEGIN_ERROR)
      log_e("[WiFi]: Begin Failed");
    else if (error == OTA_CONNECT_ERROR)
      log_e("[WiFi]: OTA Connect Failed");
    else if (error == OTA_RECEIVE_ERROR)
      log_e("[WiFi]: OTA Receive Failed");
    else if (error == OTA_END_ERROR)
      log_e("[WiFi]: OTA End Failed"); });
  log_i("[WiFi]: Arduino OTA Enabled");
}

void notifyOfUpdateStarted()
{
  log_i("[WiFi]: Arduino OTA Update Start");
  // spaCommunicationEnd();
}

void notifyOfUpdateEnded()
{
  log_i("[WiFi]: Arduino OTA Update Complete");
  setLastRestartReason("OTA Update");
}