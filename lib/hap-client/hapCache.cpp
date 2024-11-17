#include <ESPmDNS.h>
#include <WiFi.h>
#include <HTTPClient.h>
#include <map>
#include <TickTwo.h>
#include <ArduinoJson.hpp>
#include "hapCache.h"

void hapServicesRefresh();

// Define an in-memory cache using a map (or use a vector for simpler needs)
std::map<String, HapService> hapCache;

TickTwo hapServicesTick(hapServicesRefresh, 0); // Run once on startup

void hapServicesRefresh()
{
  if (WiFi.status() == WL_CONNECTED)
  {

    int n = MDNS.queryService("_hap", "tcp");
    if (n == 0)
    {
      Serial.println("No _hap services found");
      return;
    }

    // Loop through discovered services and add them to the cache
    for (int i = 0; i < n; ++i)
    {
      String serviceName = MDNS.hostname(i);
      IPAddress serviceIP = MDNS.IP(i);
      uint16_t servicePort = MDNS.port(i);

      HapService service = {
          serviceName,
          serviceIP,
          servicePort,
          millis() // Store the timestamp if needed for expiry logic
      };

      // Add or update the service in the cache
      hapCache[serviceName] = service;
      //  Serial.printf("Service added to cache: %s @ %s:%d\n",
      //                serviceName.c_str(),
      //                serviceIP.toString().c_str(),
      //                servicePort);
    }
    hapServicesTick.interval(15 * 60 * 1000); // Refresh every 15 minutes
  }
  else
  {
    hapServicesTick.interval(30 * 1000); // Refresh every 30 seconds if not connected
  }
}

void hapCacheSetup()
{
  hapServicesTick.start(); // start the ticker.
}

void hapCacheLoop()
{
  hapServicesTick.update();
}

void hapCacheRefresh()
{
  hapServicesRefresh();
}
