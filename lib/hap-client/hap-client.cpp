#include <ESPmDNS.h>
#include <WiFi.h>
#include <HTTPClient.h>

void connectToHapServer(const char *host);

void hapClientSetup()
{
}

void hapClientLoop()
{
  connectToHapServer("Tasmota-CC79");
}
// maintain a connection to the HAP server
// West bedroom - Tasmota-CC79.local. - AID=75, IID=10

void connectToHapServer(const char *host)
{
  String s = WiFi.macAddress();

  if (!MDNS.begin(s.c_str()))
  {
    log_e("Error starting mDNS %s", s.c_str());
    return;
  }
  log_i("mDNS started");
  // Resolve the .local address
  IPAddress svrIP;
  for (byte i = 0; i < 5; i++)
  {
    svrIP = MDNS.queryHost(host);
    if (svrIP.toString() != "0.0.0.0")
      break;
    Serial.println("ReTrying to resolve mDNS");
    delay(1000);
  }
  // IPAddress serverIP = MDNS.IP(0); // Get the first IP found
  log_i("Resolved IP address: %s -> %s", host, svrIP.toString().c_str());
  // curl -v -X GET --header "Content-Type:Application/json" --header "authorization: 031-45-154" http://127.0.0.1:51826/characteristics?id=24.9,22.9,25.9,23.9
  // 192.168.1.11:39255
  HTTPClient http;
  http.addHeader("Content-Type", "Application/json");
  http.addHeader("Authorization", "031-45-154");
  http.begin("http://Tasmota-CC79.local:39255/characteristics?id=75.10");
  // http.begin("http://Tasmota-CC79.local:39255/accessories");
  int httpCode = http.GET();
  String payload = http.getString();
  log_i("HTTP GET: %d", httpCode);
  log_i("Payload: %s", payload.c_str());
  // if (hapClient.connect("Tasmota-CC79.local", 51827))
  // {
  //   log_i("Connected to HAP Server");
  // }
  // else
  // {
  //   log_i("Failed to connect to HAP Server");
  // }
  // hapClient.stop();
  // delay(1000);
}
