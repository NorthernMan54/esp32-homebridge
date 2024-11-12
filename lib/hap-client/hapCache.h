#ifndef HAP_CACHE_H
#define HAP_CACHE_H
#include <Arduino.h>
#include <map>


// Define the structure for each _hap service
struct HapService
{
  String name;
  IPAddress ip;
  uint16_t port;
  uint64_t lastSeen; // Timestamp for cache expiry if needed
};
// Define an in-memory cache using a map (or use a vector for simpler needs)
extern std::map<String, HapService> hapCache;

void hapCacheSetup();
void hapCacheLoop();

#endif