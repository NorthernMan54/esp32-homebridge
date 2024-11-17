// display.h
#ifndef DISPLAY_H
#define DISPLAY_H

#include <lvgl.h>

#ifdef __cplusplus
extern "C"
{
#endif

  // Fully define the ButtonDisplay struct
  typedef struct
  {
    lv_obj_t *buttons[12]; // Array to hold button objects
    int width, height;
    int rows, cols;
    int button_width;
    int button_height;
  } ButtonDisplay;

  ButtonDisplay *ButtonDisplay_create(int width, int height, int rows, int cols, int, int);
  void ButtonDisplay_begin(ButtonDisplay *display);
  void ButtonDisplay_destroy(ButtonDisplay *display);
  void displayLoop();

  LV_IMG_DECLARE(homebridge_color_round);
  LV_IMG_DECLARE(fan_off);
  LV_IMG_DECLARE(lightbulb);
  LV_IMG_DECLARE(flatten);
  LV_IMG_DECLARE(ui_img_lightoff_png);
  LV_IMG_DECLARE(lightOff);

#ifdef __cplusplus
}
#endif

#endif // DISPLAY_H
