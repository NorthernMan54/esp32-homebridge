// This file was generated by SquareLine Studio
// SquareLine Studio version: SquareLine Studio 1.4.2
// LVGL version: 9.1.0
// Project name: JC3248W535CIY

#ifndef _JC3248W535CIY_UI_H
#define _JC3248W535CIY_UI_H

#ifdef __cplusplus
extern "C" {
#endif

#if defined __has_include
  #if __has_include("lvgl.h")
    #include "lvgl.h"
  #elif __has_include("lvgl/lvgl.h")
    #include "lvgl/lvgl.h"
  #else
    #include "lvgl.h"
  #endif
#else
  #include "lvgl.h"
#endif

#include "ui_helpers.h"
#include "components/ui_comp.h"
#include "components/ui_comp_hook.h"
#include "ui_events.h"
#include "ui_theme_manager.h"
#include "ui_themes.h"

// SCREEN: ui_bootScreen
void ui_bootScreen_screen_init(void);
extern lv_obj_t *ui_bootScreen;
extern lv_obj_t *ui_Image1;
// SCREEN: ui_mainScreen
void ui_mainScreen_screen_init(void);
extern lv_obj_t *ui_mainScreen;
extern lv_obj_t *ui____initial_actions0;

LV_IMG_DECLARE( ui_img_homebridge_color_round_png);   // assets/homebridge_color_round.png
LV_IMG_DECLARE( ui_img_lightoff_png);   // assets/LightOff.png
LV_IMG_DECLARE( ui_img_lightbulb_png);   // assets/lightbulb.png




void ui_init(void);

#ifdef __cplusplus
} /*extern "C"*/
#endif

#endif