Processing lvgl-esp32-4848S040CIY1 (board: esp32-4848S040CIY1; platform: espressif32@6.8.1; framework: arduino)
----------------------------------------------------------------------------------------------------------------------------------------------
Verbose mode can be enabled via `-v, --verbose` option
CONFIGURATION: https://docs.platformio.org/page/boards/espressif32/esp32-4848S040CIY1.html
PLATFORM: Espressif 32 (6.8.1) > esp32-4848S040CIY1
HARDWARE: ESP32S3 240MHz, 320KB RAM, 16MB Flash
DEBUG: Current (cmsis-dap) External (cmsis-dap, esp-bridge, esp-builtin, esp-prog, iot-bus-jtag, jlink, minimodule, olimex-arm-usb-ocd, olimex-arm-usb-ocd-h, olimex-arm-usb-tiny-h, olimex-jtag-tiny, tumpa)
PACKAGES: 
 - framework-arduinoespressif32 @ 3.20017.0 (2.0.17) 
 - tool-esptoolpy @ 1.40501.0 (4.5.1) 
 - toolchain-riscv32-esp @ 8.4.0+2021r2-patch5 
 - toolchain-xtensa-esp32s3 @ 8.4.0+2021r2-patch5
Converting main.ino
LDF: Library Dependency Finder -> https://bit.ly/configure-pio-ldf
LDF Modes: Finder ~ chain, Compatibility ~ soft
Found 65 compatible libraries
Scanning dependencies...
Dependency Graph
|-- WiFiManager @ 2.0.14-beta+sha.9f5981e
|-- CircularBuffer @ 1.4.0
|-- PubSubClient @ 2.8.0
|-- ArduinoJson @ 6.18.3
|-- TickTwo @ 4.4.0
|-- ArduinoLog @ 1.1.1
|-- DallasTemperature @ 3.11.0
|-- CRC @ 1.0.3
|-- ESP Async WebServer @ 1.2.4+sha.67de9cd
|-- base64 @ 1.4.0+sha.574949c
|-- TelnetStream @ 1.3.0
|-- esp32_smartdisplay @ 3.0.0
|-- bridge
|-- findSpa
|-- mqttModule
|-- restartReason
|-- localRS485Communication
|-- spaRemoteCommunication
|-- spaEpaper
|-- spaLvgl
|-- spaMessage
|-- spaUtilities
|-- spaWebServer
|-- wifiModule
Building in debug mode
Warning! We have just detected `upload_port` as IP address or host name of ESP device. `upload_protocol` is switched to `espota`.
Please specify `upload_protocol = espota` in `platformio.ini` project configuration file.
Compiling .pio/build/lvgl-esp32-4848S040CIY1/src/main.ino.cpp.o
Building .pio/build/lvgl-esp32-4848S040CIY1/bootloader.bin
Generating partitions .pio/build/lvgl-esp32-4848S040CIY1/partitions.bin
esptool.py v4.5.1
Creating esp32s3 image...
Merged 1 ELF section
Successfully created esp32s3 image.
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libee8/WiFi/WiFi.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libee8/WiFi/WiFiAP.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libee8/WiFi/WiFiClient.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libee8/WiFi/WiFiGeneric.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libee8/WiFi/WiFiMulti.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libee8/WiFi/WiFiSTA.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libee8/WiFi/WiFiScan.cpp.o
In file included from /Users/sgracey/Code/esp32_balboa_spa/src/main.ino:2:
.pio/libdeps/lvgl-esp32-4848S040CIY1/WiFiManager/WiFiManager.h:55:2: warning: #warning "WM_NOTEMP" [-Wcpp]
 #warning "WM_NOTEMP"
  ^~~~~~~
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libee8/WiFi/WiFiServer.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libee8/WiFi/WiFiUdp.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib25f/DNSServer/DNSServer.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib56d/ESPmDNS/ESPmDNS.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib312/Update/HttpsOTAUpdate.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib312/Update/Updater.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib4df/FS/FS.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib4df/FS/vfs_api.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2bb/WebServer/Parsing.cpp.o
Archiving .pio/build/lvgl-esp32-4848S040CIY1/lib25f/libDNSServer.a
Archiving .pio/build/lvgl-esp32-4848S040CIY1/libee8/libWiFi.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2bb/WebServer/WebServer.cpp.o
Indexing .pio/build/lvgl-esp32-4848S040CIY1/lib25f/libDNSServer.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/libee8/libWiFi.a
Archiving .pio/build/lvgl-esp32-4848S040CIY1/lib56d/libESPmDNS.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2bb/WebServer/detail/mimetable.cpp.o
Indexing .pio/build/lvgl-esp32-4848S040CIY1/lib56d/libESPmDNS.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib357/WiFiManager/WiFiManager.cpp.o
Archiving .pio/build/lvgl-esp32-4848S040CIY1/lib312/libUpdate.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/lib312/libUpdate.a
In file included from .pio/libdeps/lvgl-esp32-4848S040CIY1/WiFiManager/WiFiManager.cpp:13:
.pio/libdeps/lvgl-esp32-4848S040CIY1/WiFiManager/WiFiManager.h:55:2: warning: #warning "WM_NOTEMP" [-Wcpp]
 #warning "WM_NOTEMP"
  ^~~~~~~
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe88/PubSubClient/PubSubClient.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib5a7/TickTwo/TickTwo.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib952/ArduinoLog/ArduinoLog.cpp.o
Archiving .pio/build/lvgl-esp32-4848S040CIY1/lib4df/libFS.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/lib4df/libFS.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib84b/OneWire/OneWire.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libda4/DallasTemperature/DallasTemperature.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib66c/CRC/CRC.cpp.o
Archiving .pio/build/lvgl-esp32-4848S040CIY1/lib5a7/libTickTwo.a
Archiving .pio/build/lvgl-esp32-4848S040CIY1/libe88/libPubSubClient.a
Archiving .pio/build/lvgl-esp32-4848S040CIY1/lib2bb/libWebServer.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/lib5a7/libTickTwo.a
Archiving .pio/build/lvgl-esp32-4848S040CIY1/lib952/libArduinoLog.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/libe88/libPubSubClient.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/lib2bb/libWebServer.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/lib952/libArduinoLog.a
.pio/libdeps/lvgl-esp32-4848S040CIY1/OneWire/OneWire.cpp:599:22: warning: extra tokens at end of #undef directive
 #  undef noInterrupts() {portMUX_TYPE mux = portMUX_INITIALIZER_UNLOCKED;portENTER_CRITICAL(&mux)
                      ^
.pio/libdeps/lvgl-esp32-4848S040CIY1/OneWire/OneWire.cpp:600:20: warning: extra tokens at end of #undef directive
 #  undef interrupts() portEXIT_CRITICAL(&mux);}
                    ^
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib66c/CRC/CRC12.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib66c/CRC/CRC16.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib66c/CRC/CRC32.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib66c/CRC/CRC64.cpp.o
Archiving .pio/build/lvgl-esp32-4848S040CIY1/lib84b/libOneWire.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/lib84b/libOneWire.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib66c/CRC/CRC8.cpp.o
Archiving .pio/build/lvgl-esp32-4848S040CIY1/libda4/libDallasTemperature.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib66c/CRC/CrcFastReverse.cpp.o
Indexing .pio/build/lvgl-esp32-4848S040CIY1/libda4/libDallasTemperature.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib66c/CRC/FastCRC32.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib659/AsyncTCP/AsyncTCP.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib777/ESP Async WebServer/AsyncEventSource.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib777/ESP Async WebServer/AsyncWebSocket.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib777/ESP Async WebServer/SPIFFSEditor.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib777/ESP Async WebServer/WebAuthentication.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib777/ESP Async WebServer/WebHandlers.cpp.o
Archiving .pio/build/lvgl-esp32-4848S040CIY1/lib66c/libCRC.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/lib66c/libCRC.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib777/ESP Async WebServer/WebRequest.cpp.o
Archiving .pio/build/lvgl-esp32-4848S040CIY1/lib357/libWiFiManager.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/lib357/libWiFiManager.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib777/ESP Async WebServer/WebResponses.cpp.o
Archiving .pio/build/lvgl-esp32-4848S040CIY1/lib659/libAsyncTCP.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/lib659/libAsyncTCP.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib777/ESP Async WebServer/WebServer.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib9bd/NetApiHelpers/MACAddress.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libeba/TelnetStream/TelnetPrint.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libeba/TelnetStream/TelnetStream.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2f9/LittleFS/LittleFS.cpp.o
Archiving .pio/build/lvgl-esp32-4848S040CIY1/lib9bd/libNetApiHelpers.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/lib9bd/libNetApiHelpers.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libd30/SPI/SPI.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/core/lv_group.c.o
Archiving .pio/build/lvgl-esp32-4848S040CIY1/libeba/libTelnetStream.a
Archiving .pio/build/lvgl-esp32-4848S040CIY1/lib777/libESP Async WebServer.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/libeba/libTelnetStream.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/core/lv_obj.c.o
Indexing .pio/build/lvgl-esp32-4848S040CIY1/lib777/libESP Async WebServer.a
Archiving .pio/build/lvgl-esp32-4848S040CIY1/lib2f9/libLittleFS.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/core/lv_obj_class.c.o
Indexing .pio/build/lvgl-esp32-4848S040CIY1/lib2f9/libLittleFS.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/core/lv_obj_draw.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/core/lv_obj_event.c.o
Archiving .pio/build/lvgl-esp32-4848S040CIY1/libd30/libSPI.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/core/lv_obj_id_builtin.c.o
Indexing .pio/build/lvgl-esp32-4848S040CIY1/libd30/libSPI.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/core/lv_obj_pos.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/core/lv_obj_property.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/core/lv_obj_scroll.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/core/lv_obj_style.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/core/lv_obj_style_gen.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/core/lv_obj_tree.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/core/lv_refr.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/display/lv_display.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/lv_draw.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/lv_draw_arc.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/lv_draw_buf.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/lv_draw_image.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/lv_draw_label.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/lv_draw_line.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/lv_draw_mask.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/lv_draw_rect.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/lv_draw_triangle.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/lv_draw_vector.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/lv_image_decoder.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/nxp/pxp/lv_draw_buf_pxp.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/nxp/pxp/lv_draw_pxp.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/nxp/pxp/lv_draw_pxp_fill.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/nxp/pxp/lv_draw_pxp_img.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/nxp/pxp/lv_draw_pxp_layer.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/nxp/pxp/lv_pxp_cfg.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/nxp/pxp/lv_pxp_osa.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/nxp/pxp/lv_pxp_utils.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/nxp/vglite/lv_draw_buf_vglite.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/nxp/vglite/lv_draw_vglite.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/nxp/vglite/lv_draw_vglite_arc.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/nxp/vglite/lv_draw_vglite_border.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/nxp/vglite/lv_draw_vglite_fill.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/nxp/vglite/lv_draw_vglite_img.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/nxp/vglite/lv_draw_vglite_label.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/nxp/vglite/lv_draw_vglite_layer.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/nxp/vglite/lv_draw_vglite_line.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/nxp/vglite/lv_draw_vglite_triangle.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/nxp/vglite/lv_vglite_buf.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/nxp/vglite/lv_vglite_matrix.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/nxp/vglite/lv_vglite_path.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/nxp/vglite/lv_vglite_utils.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/renesas/dave2d/lv_draw_dave2d.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/renesas/dave2d/lv_draw_dave2d_arc.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/renesas/dave2d/lv_draw_dave2d_border.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/renesas/dave2d/lv_draw_dave2d_fill.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/renesas/dave2d/lv_draw_dave2d_image.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/renesas/dave2d/lv_draw_dave2d_label.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/renesas/dave2d/lv_draw_dave2d_line.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/renesas/dave2d/lv_draw_dave2d_triangle.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/renesas/dave2d/lv_draw_dave2d_utils.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/sdl/lv_draw_sdl.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/sw/blend/helium/lv_blend_helium.S.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/sw/blend/lv_draw_sw_blend.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/sw/blend/lv_draw_sw_blend_to_al88.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/sw/blend/lv_draw_sw_blend_to_argb8888.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/sw/blend/lv_draw_sw_blend_to_i1.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/sw/blend/lv_draw_sw_blend_to_l8.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/sw/blend/lv_draw_sw_blend_to_rgb565.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/sw/blend/lv_draw_sw_blend_to_rgb888.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/sw/blend/neon/lv_blend_neon.S.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/sw/lv_draw_sw.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/sw/lv_draw_sw_arc.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/sw/lv_draw_sw_border.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/sw/lv_draw_sw_box_shadow.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/sw/lv_draw_sw_fill.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/sw/lv_draw_sw_gradient.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/sw/lv_draw_sw_img.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/sw/lv_draw_sw_letter.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/sw/lv_draw_sw_line.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/sw/lv_draw_sw_mask.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/sw/lv_draw_sw_mask_rect.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/sw/lv_draw_sw_transform.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/sw/lv_draw_sw_triangle.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/sw/lv_draw_sw_vector.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/vg_lite/lv_draw_buf_vg_lite.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/vg_lite/lv_draw_vg_lite.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/vg_lite/lv_draw_vg_lite_arc.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/vg_lite/lv_draw_vg_lite_border.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/vg_lite/lv_draw_vg_lite_box_shadow.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/vg_lite/lv_draw_vg_lite_fill.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/vg_lite/lv_draw_vg_lite_img.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/vg_lite/lv_draw_vg_lite_label.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/vg_lite/lv_draw_vg_lite_layer.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/vg_lite/lv_draw_vg_lite_line.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/vg_lite/lv_draw_vg_lite_mask_rect.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/vg_lite/lv_draw_vg_lite_triangle.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/vg_lite/lv_draw_vg_lite_vector.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/vg_lite/lv_vg_lite_decoder.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/vg_lite/lv_vg_lite_grad.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/vg_lite/lv_vg_lite_math.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/vg_lite/lv_vg_lite_path.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/vg_lite/lv_vg_lite_pending.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/vg_lite/lv_vg_lite_stroke.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/draw/vg_lite/lv_vg_lite_utils.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/display/drm/lv_linux_drm.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/display/fb/lv_linux_fbdev.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/display/ili9341/lv_ili9341.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/display/lcd/lv_lcd_generic_mipi.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/display/renesas_glcdc/lv_renesas_glcdc.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/display/st7735/lv_st7735.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/display/st7789/lv_st7789.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/display/st7796/lv_st7796.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/display/tft_espi/lv_tft_espi.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/evdev/lv_evdev.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/glfw/lv_glfw_window.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/glfw/lv_opengles_debug.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/glfw/lv_opengles_driver.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/glfw/lv_opengles_texture.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/libinput/lv_libinput.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/libinput/lv_xkb.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/nuttx/lv_nuttx_cache.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/nuttx/lv_nuttx_entry.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/nuttx/lv_nuttx_fbdev.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/nuttx/lv_nuttx_image_cache.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/nuttx/lv_nuttx_lcd.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/nuttx/lv_nuttx_libuv.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/nuttx/lv_nuttx_profiler.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/nuttx/lv_nuttx_touchscreen.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/qnx/lv_qnx.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/sdl/lv_sdl_keyboard.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/sdl/lv_sdl_mouse.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/sdl/lv_sdl_mousewheel.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/sdl/lv_sdl_window.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/wayland/lv_wayland.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/wayland/lv_wayland_smm.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/windows/lv_windows_context.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/windows/lv_windows_display.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/windows/lv_windows_input.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/x11/lv_x11_display.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/drivers/x11/lv_x11_input.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_binfont_loader.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_dejavu_16_persian_hebrew.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_fmt_txt.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_montserrat_10.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_montserrat_12.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_montserrat_14.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_montserrat_16.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_montserrat_18.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_montserrat_20.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_montserrat_22.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_montserrat_24.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_montserrat_26.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_montserrat_28.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_montserrat_28_compressed.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_montserrat_30.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_montserrat_32.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_montserrat_34.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_montserrat_36.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_montserrat_38.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_montserrat_40.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_montserrat_42.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_montserrat_44.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_montserrat_46.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_montserrat_48.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_montserrat_8.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_simsun_14_cjk.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_simsun_16_cjk.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_unscii_16.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/font/lv_font_unscii_8.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/indev/lv_indev.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/indev/lv_indev_scroll.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/layouts/flex/lv_flex.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/layouts/grid/lv_grid.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/layouts/lv_layout.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/barcode/code128.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/barcode/lv_barcode.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/bin_decoder/lv_bin_decoder.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/bmp/lv_bmp.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/ffmpeg/lv_ffmpeg.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/freetype/lv_freetype.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/freetype/lv_freetype_glyph.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/freetype/lv_freetype_image.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/freetype/lv_freetype_outline.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/freetype/lv_ftsystem.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/fsdrv/lv_fs_arduino_esp_littlefs.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/fsdrv/lv_fs_arduino_sd.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/fsdrv/lv_fs_cbfs.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/fsdrv/lv_fs_fatfs.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/fsdrv/lv_fs_littlefs.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/fsdrv/lv_fs_memfs.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/fsdrv/lv_fs_posix.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/fsdrv/lv_fs_stdio.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/fsdrv/lv_fs_win32.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/gif/gifdec.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/gif/lv_gif.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/libjpeg_turbo/lv_libjpeg_turbo.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/libpng/lv_libpng.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/lodepng/lodepng.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/lodepng/lv_lodepng.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/lz4/lz4.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/qrcode/lv_qrcode.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/qrcode/qrcodegen.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/rle/lv_rle.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/rlottie/lv_rlottie.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgAccessor.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgAnimation.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgCanvas.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgCapi.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgCompressor.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgFill.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgGlCanvas.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgInitializer.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgLines.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgLoader.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgLottieAnimation.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgLottieBuilder.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgLottieExpressions.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgLottieInterpolator.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgLottieLoader.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgLottieModel.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgLottieParser.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgLottieParserHandler.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgMath.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgPaint.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgPicture.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgRawLoader.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgRender.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgSaver.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgScene.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgShape.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgStr.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgSvgCssStyle.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgSvgLoader.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgSvgPath.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgSvgSceneBuilder.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgSvgUtil.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgSwCanvas.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgSwFill.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgSwImage.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgSwMath.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgSwMemPool.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgSwRaster.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgSwRenderer.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgSwRle.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgSwShape.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgSwStroke.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgTaskScheduler.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgText.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgWgCanvas.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/thorvg/tvgXmlParser.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/tiny_ttf/lv_tiny_ttf.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/tjpgd/lv_tjpgd.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/libs/tjpgd/tjpgd.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/lv_init.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/cache/lv_cache.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/cache/lv_cache_entry.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/cache/lv_cache_lru_rb.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/cache/lv_image_cache.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/cache/lv_image_header_cache.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/lv_anim.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/lv_anim_timeline.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/lv_area.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/lv_array.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/lv_async.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/lv_bidi.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/lv_color.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/lv_color_op.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/lv_event.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/lv_fs.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/lv_ll.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/lv_log.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/lv_lru.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/lv_math.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/lv_matrix.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/lv_palette.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/lv_profiler_builtin.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/lv_rb.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/lv_style.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/lv_style_gen.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/lv_templ.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/lv_text.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/lv_text_ap.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/lv_timer.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/misc/lv_utils.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/osal/lv_cmsis_rtos2.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/osal/lv_freertos.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/osal/lv_mqx.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/osal/lv_os.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/osal/lv_os_none.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/osal/lv_pthread.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/osal/lv_rtthread.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/osal/lv_windows.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/others/file_explorer/lv_file_explorer.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/others/fragment/lv_fragment.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/others/fragment/lv_fragment_manager.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/others/gridnav/lv_gridnav.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/others/ime/lv_ime_pinyin.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/others/imgfont/lv_imgfont.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/others/monkey/lv_monkey.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/others/observer/lv_observer.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/others/snapshot/lv_snapshot.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/others/sysmon/lv_sysmon.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/others/vg_lite_tvg/vg_lite_matrix.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/others/vg_lite_tvg/vg_lite_tvg.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/stdlib/builtin/lv_mem_core_builtin.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/stdlib/builtin/lv_sprintf_builtin.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/stdlib/builtin/lv_string_builtin.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/stdlib/builtin/lv_tlsf.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/stdlib/clib/lv_mem_core_clib.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/stdlib/clib/lv_sprintf_clib.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/stdlib/clib/lv_string_clib.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/stdlib/lv_mem.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/stdlib/micropython/lv_mem_core_micropython.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/stdlib/rtthread/lv_mem_core_rtthread.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/stdlib/rtthread/lv_sprintf_rtthread.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/stdlib/rtthread/lv_string_rtthread.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/themes/default/lv_theme_default.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/themes/lv_theme.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/themes/mono/lv_theme_mono.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/themes/simple/lv_theme_simple.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/tick/lv_tick.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/animimage/lv_animimage.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/arc/lv_arc.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/bar/lv_bar.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/button/lv_button.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/buttonmatrix/lv_buttonmatrix.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/calendar/lv_calendar.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/calendar/lv_calendar_chinese.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/calendar/lv_calendar_header_arrow.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/calendar/lv_calendar_header_dropdown.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/canvas/lv_canvas.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/chart/lv_chart.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/checkbox/lv_checkbox.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/dropdown/lv_dropdown.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/image/lv_image.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/imagebutton/lv_imagebutton.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/keyboard/lv_keyboard.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/label/lv_label.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/led/lv_led.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/line/lv_line.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/list/lv_list.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/lottie/lv_lottie.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/menu/lv_menu.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/msgbox/lv_msgbox.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/objx_templ/lv_objx_templ.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/property/lv_dropdown_properties.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/property/lv_image_properties.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/property/lv_keyboard_properties.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/property/lv_label_properties.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/property/lv_obj_properties.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/property/lv_roller_properties.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/property/lv_style_properties.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/property/lv_textarea_properties.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/roller/lv_roller.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/scale/lv_scale.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/slider/lv_slider.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/span/lv_span.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/spinbox/lv_spinbox.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/spinner/lv_spinner.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/switch/lv_switch.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/table/lv_table.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/tabview/lv_tabview.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/textarea/lv_textarea.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/tileview/lv_tileview.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/lvgl/widgets/win/lv_win.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe82/esp32-smartdisplay/esp32_smartdisplay.c.o
Archiving .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/liblvgl.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe82/esp32-smartdisplay/esp_io_expander.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe82/esp32-smartdisplay/esp_lcd_panel_io_3wire_spi.c.o
/Users/sgracey/Code/esp32-smartdisplay/src/esp_io_expander.c:30:20: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
 static char *TAG = "io_expander";
                    ^~~~~~~~~~~~~
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe82/esp32-smartdisplay/esp_lcd_touch.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe82/esp32-smartdisplay/esp_panel_.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe82/esp32-smartdisplay/esp_panel_axs15231b.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe82/esp32-smartdisplay/esp_panel_gc9a01.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe82/esp32-smartdisplay/esp_panel_ili9341.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe82/esp32-smartdisplay/esp_panel_st7701.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe82/esp32-smartdisplay/esp_panel_st7796.c.o
Indexing .pio/build/lvgl-esp32-4848S040CIY1/lib2cc/liblvgl.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe82/esp32-smartdisplay/esp_touch_cst816s.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe82/esp32-smartdisplay/esp_touch_gt911.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe82/esp32-smartdisplay/esp_touch_xpt2046.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe82/esp32-smartdisplay/lvgl_panel_axs15231b_qspi.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe82/esp32-smartdisplay/lvgl_panel_gc9a01_spi.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe82/esp32-smartdisplay/lvgl_panel_ili9341_spi.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe82/esp32-smartdisplay/lvgl_panel_st7262_par.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe82/esp32-smartdisplay/lvgl_panel_st7701_par.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe82/esp32-smartdisplay/lvgl_panel_st7789_i80.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe82/esp32-smartdisplay/lvgl_panel_st7789_spi.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe82/esp32-smartdisplay/lvgl_panel_st7796_spi.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe82/esp32-smartdisplay/lvgl_touch_cst816s_i2c.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe82/esp32-smartdisplay/lvgl_touch_gt911_i2c.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe82/esp32-smartdisplay/lvgl_touch_xpt2046_spi.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libda2/spaUtilities/spaUtilities.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib7df/Analytics/Analytics.cpp.o
Archiving .pio/build/lvgl-esp32-4848S040CIY1/libe82/libesp32-smartdisplay.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/libe82/libesp32-smartdisplay.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib0eb/restartReason/restartReason.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/liba17/localRS485Communication/rs485.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib9c7/ArduinoOTA/ArduinoOTA.cpp.o
Archiving .pio/build/lvgl-esp32-4848S040CIY1/libda2/libspaUtilities.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/libda2/libspaUtilities.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib171/spaRemoteCommunication/spaCommunication.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib495/wifiModule/wifiModule.cpp.o
Archiving .pio/build/lvgl-esp32-4848S040CIY1/lib0eb/librestartReason.a
Archiving .pio/build/lvgl-esp32-4848S040CIY1/lib7df/libAnalytics.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/lib0eb/librestartReason.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/lib7df/libAnalytics.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib127/mqttModule/mqttModule.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib7b8/spaMessage/cacheRead.cpp.o
Archiving .pio/build/lvgl-esp32-4848S040CIY1/liba17/liblocalRS485Communication.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib7b8/spaMessage/spaMessage.cpp.o
In file included from lib/wifiModule/wifiModule.cpp:3:
.pio/libdeps/lvgl-esp32-4848S040CIY1/WiFiManager/WiFiManager.h:55:2: warning: #warning "WM_NOTEMP" [-Wcpp]
 #warning "WM_NOTEMP"
  ^~~~~~~
Indexing .pio/build/lvgl-esp32-4848S040CIY1/liba17/liblocalRS485Communication.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib7b8/spaMessage/spaMqttMessage.cpp.o
Archiving .pio/build/lvgl-esp32-4848S040CIY1/lib9c7/libArduinoOTA.a
Archiving .pio/build/lvgl-esp32-4848S040CIY1/lib171/libspaRemoteCommunication.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/lib9c7/libArduinoOTA.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/lib171/libspaRemoteCommunication.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib94e/bridge/bridge.cpp.o
Archiving .pio/build/lvgl-esp32-4848S040CIY1/lib495/libwifiModule.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/lib495/libwifiModule.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libda5/findSpa/findSpa.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe9f/spaEpaper/epd47.cpp.o
Archiving .pio/build/lvgl-esp32-4848S040CIY1/lib127/libmqttModule.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/lib127/libmqttModule.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe9f/spaEpaper/spaEpaper.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libe9f/spaEpaper/to_jpg.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/screenShot/lv_100ask_screenshot.c.o
Archiving .pio/build/lvgl-esp32-4848S040CIY1/lib94e/libbridge.a
Archiving .pio/build/lvgl-esp32-4848S040CIY1/libda5/libfindSpa.a
Archiving .pio/build/lvgl-esp32-4848S040CIY1/lib7b8/libspaMessage.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/lib94e/libbridge.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/libda5/libfindSpa.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/screenShot/save_as_bmp.c.o
Indexing .pio/build/lvgl-esp32-4848S040CIY1/lib7b8/libspaMessage.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/screenShot/save_as_png.c.o
Archiving .pio/build/lvgl-esp32-4848S040CIY1/libe9f/libspaEpaper.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/libe9f/libspaEpaper.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/spaLvgl.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/spaUI/uiSpaButtons.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/spaUI/uiSpaThermostat.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/components/ui_comp.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/components/ui_comp_hook.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/components/ui_comp_uifilter.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/components/ui_comp_uilight.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/components/ui_comp_uipump.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/fonts/ui_font_Montserrat_Bold_14.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/fonts/ui_font_Montserrat_Bold_16.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/fonts/ui_font_Montserrat_Bold_18.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/fonts/ui_font_Open_Sans_12.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/fonts/ui_font_Open_Sans_14.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/fonts/ui_font_Open_Sans_16.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/fonts/ui_font_Open_Sans_18.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/fonts/ui_font_Open_Sans_20.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/fonts/ui_font_Open_Sans_24.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/fonts/ui_font_Open_Sans_26.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/fonts/ui_font_Open_Sans_Bold_12.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/fonts/ui_font_Open_Sans_Bold_14.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/fonts/ui_font_Open_Sans_Bold_16.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/fonts/ui_font_Open_Sans_Bold_18.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/fonts/ui_font_Open_Sans_Bold_20.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/fonts/ui_font_Open_Sans_Bold_24.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/fonts/ui_font_Open_Sans_Bold_26.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/images/ui_img_filteron_png.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/images/ui_img_hightemp_png.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/images/ui_img_lightoff_png.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/images/ui_img_lighton_png.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/images/ui_img_uipumphigh_png.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/images/ui_img_uipumplow_png.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/images/ui_img_uipumpoff_png.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/images/ui_temporary_image.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/screens/ui_Loading_Screen.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/screens/ui_Spa_Screen.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/screens/ui_adjustThermostatScreen.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/screens/ui_settingsAndAbout.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/ui.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/ui_events.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/ui_helpers.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/ui_theme_manager.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libed2/spaLvgl/sqlUI/ui_themes.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/libcce/tinyXml2/tinyxml2.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/lib630/spaWebServer/spaWebServer.cpp.o
Archiving .pio/build/lvgl-esp32-4848S040CIY1/libed2/libspaLvgl.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/libed2/libspaLvgl.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/Esp.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/FirmwareMSC.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/FunctionalInterrupt.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/HWCDC.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/HardwareSerial.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/IPAddress.cpp.o
Archiving .pio/build/lvgl-esp32-4848S040CIY1/libcce/libtinyXml2.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/libcce/libtinyXml2.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/IPv6Address.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/MD5Builder.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/Print.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/Stream.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/StreamString.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/Tone.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/USB.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/USBCDC.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/USBMSC.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/WMath.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/WString.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/base64.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/cbuf.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/esp32-hal-adc.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/esp32-hal-bt.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/esp32-hal-cpu.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/esp32-hal-dac.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/esp32-hal-gpio.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/esp32-hal-i2c-slave.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/esp32-hal-i2c.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/esp32-hal-ledc.c.o
Archiving .pio/build/lvgl-esp32-4848S040CIY1/lib630/libspaWebServer.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/esp32-hal-matrix.c.o
Indexing .pio/build/lvgl-esp32-4848S040CIY1/lib630/libspaWebServer.a
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/esp32-hal-misc.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/esp32-hal-psram.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/esp32-hal-rgb-led.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/esp32-hal-rmt.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/esp32-hal-sigmadelta.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/esp32-hal-spi.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/esp32-hal-time.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/esp32-hal-timer.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/esp32-hal-tinyusb.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/esp32-hal-touch.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/esp32-hal-uart.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/firmware_msc_fat.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/libb64/cdecode.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/libb64/cencode.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/main.cpp.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/stdlib_noniso.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/wiring_pulse.c.o
Compiling .pio/build/lvgl-esp32-4848S040CIY1/FrameworkArduino/wiring_shift.c.o
Archiving .pio/build/lvgl-esp32-4848S040CIY1/libFrameworkArduino.a
Indexing .pio/build/lvgl-esp32-4848S040CIY1/libFrameworkArduino.a
Linking .pio/build/lvgl-esp32-4848S040CIY1/firmware.elf
Retrieving maximum program size .pio/build/lvgl-esp32-4848S040CIY1/firmware.elf
Checking size .pio/build/lvgl-esp32-4848S040CIY1/firmware.elf
Advanced Memory Usage is available via "PlatformIO Home > Project Inspect"
RAM:   [==        ]  16.6% (used 54316 bytes from 327680 bytes)
Flash: [==        ]  24.4% (used 1601601 bytes from 6553600 bytes)
Building .pio/build/lvgl-esp32-4848S040CIY1/firmware.bin
esptool.py v4.5.1
Creating esp32s3 image...
Merged 2 ELF sections
Successfully created esp32s3 image.
======================================================================== [SUCCESS] Took 29.94 seconds ========================================================================

Environment              Status    Duration
-----------------------  --------  ------------
lvgl-esp32-4848S040CIY1  SUCCESS   00:00:29.936
======================================================================== 1 succeeded in 00:00:29.936 ========================================================================
 *  Terminal will be reused by tasks, press any key to close it. 
