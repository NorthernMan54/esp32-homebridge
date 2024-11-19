// This file was generated by SquareLine Studio
// SquareLine Studio version: SquareLine Studio 1.4.2
// LVGL version: 9.1.0
// Project name: JC3248W535CIY

#include "../ui.h"

void ui_bootScreen_screen_init(void)
{
ui_bootScreen = lv_obj_create(NULL);
lv_obj_remove_flag( ui_bootScreen, LV_OBJ_FLAG_SCROLLABLE );    /// Flags
lv_obj_set_style_bg_color(ui_bootScreen, lv_color_hex(0x080101), LV_PART_MAIN | LV_STATE_DEFAULT );
lv_obj_set_style_bg_opa(ui_bootScreen, 255, LV_PART_MAIN| LV_STATE_DEFAULT);

ui_Image1 = lv_image_create(ui_bootScreen);
lv_image_set_src(ui_Image1, &ui_img_homebridge_color_round_png);
lv_obj_set_width( ui_Image1, LV_SIZE_CONTENT);  /// 320
lv_obj_set_height( ui_Image1, LV_SIZE_CONTENT);   /// 320
lv_obj_set_align( ui_Image1, LV_ALIGN_CENTER );
lv_obj_add_flag( ui_Image1, LV_OBJ_FLAG_CLICKABLE );   /// Flags
lv_obj_remove_flag( ui_Image1, LV_OBJ_FLAG_SCROLLABLE );    /// Flags

}