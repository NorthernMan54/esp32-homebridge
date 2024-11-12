#ifndef HAPDEVICE_H
#define HAPDEVICE_H

#include <Arduino.h>
#include <HTTPClient.h>
#include <ArduinoJson.h>
#include <functional>


class HAPDevice {
public:
    // Constructor
     HAPDevice(ArduinoJson::DynamicJsonDocument doc);

    // Accessor methods to get device info
    String getInstanceName();
    String getUUID();
    String getDisplayName();
    uint16_t getAID();
    uint16_t getIID();

    // Function to trigger the event manually if needed
    void sendEvent(String message);

    // Setter for event callback
    void setEventCallback(void (*callback)(String));

    // Method to get characteristic
    String getCharacteristic();

private:
    String instanceName;
    String uuid;
    String displayName;
    uint16_t aid;
    uint16_t iid;
    HTTPClient http;
    void (*eventCallback)(String) = nullptr;
};

#endif // HAPDEVICE_H