// display.cpp
#include "display.h"
#include <lvgl.h>
#include <stdlib.h> // For malloc
#include <stdio.h>
#include <ui.h>

/**
 * @brief Create screen to display while booting
 *
 * @param screen
 * @return lv_obj_t*
 */
lv_obj_t *uiBootScreen()
{
    static lv_style_t styleBoot;
    lv_style_init(&styleBoot);
    lv_style_set_bg_color(&styleBoot, lv_color_hex(0x000000));
    lv_style_set_bg_image_src(&styleBoot, &homebridge_color_round);

    lv_obj_t *screen = lv_obj_create(lv_screen_active());
    lv_obj_set_size(screen, DISPLAY_WIDTH, DISPLAY_HEIGHT);
    lv_obj_center(screen);
    lv_obj_add_style(screen, &styleBoot, 0);

    return screen;
}

lv_obj_t *uiMainScreen()
{
    static lv_style_t style;
    lv_style_init(&style);
    lv_style_set_flex_flow(&style, LV_FLEX_FLOW_ROW_WRAP);
    lv_style_set_flex_main_place(&style, LV_FLEX_ALIGN_SPACE_EVENLY);
    lv_style_set_layout(&style, LV_LAYOUT_FLEX);
    lv_style_set_bg_color(&style, lv_color_hex(0x000000));
    lv_style_set_bg_image_src(&style, &homebridge_color_round);

    lv_obj_t *screen = lv_obj_create(lv_screen_active());
    lv_obj_set_size(screen, DISPLAY_WIDTH, DISPLAY_HEIGHT);
    lv_obj_center(screen);
    lv_obj_add_style(screen, &style, 0);

    return screen;
}

#define BUTTON_WIDTH 130
#define BUTTON_HEIGHT 100

uiHKButton *uiHKButton_create(lv_obj_t *parent, const char *name, const char *status, const char *icon)
{
    uiHKButton *button = (uiHKButton *)malloc(sizeof(uiHKButton));
    button->button = lv_obj_create(parent);

    lv_obj_set_flex_align(button->button, LV_FLEX_ALIGN_CENTER, LV_FLEX_ALIGN_CENTER, LV_FLEX_ALIGN_CENTER);
    lv_obj_set_size(button->button, BUTTON_WIDTH, BUTTON_HEIGHT);
    lv_obj_add_flag(button->button, LV_OBJ_FLAG_CHECKABLE);

    button->imageButton = lv_img_create(button->button); // Create button
    lv_image_set_src(button->imageButton, &ui_img_lightoff_png);
    lv_obj_set_style_img_recolor(button->imageButton, lv_color_hex(0xFFFFFF), 0);
    lv_obj_set_style_img_recolor_opa(button->imageButton, LV_OPA_COVER, 0);
    lv_obj_set_size(button->imageButton, 60, BUTTON_HEIGHT - 30);

    lv_obj_t *nameContainer = lv_obj_create(button->button);
    lv_obj_set_size(nameContainer, BUTTON_WIDTH - 80, BUTTON_HEIGHT - 30);
    lv_obj_set_flex_flow(nameContainer, LV_FLEX_FLOW_COLUMN);
    lv_obj_set_flex_align(nameContainer, LV_FLEX_ALIGN_CENTER, LV_FLEX_ALIGN_CENTER, LV_FLEX_ALIGN_CENTER);

    lv_obj_t *label = lv_label_create(nameContainer);
    lv_label_set_text_fmt(label, "%s", name);
    lv_obj_align(label, LV_ALIGN_BOTTOM_LEFT, 0, 0);
    button->statusLabel = lv_label_create(nameContainer);
    lv_label_set_text(button->statusLabel, status);
    lv_obj_align(button->statusLabel, LV_ALIGN_BOTTOM_LEFT, 0, 0);

    return button;
}

ButtonDisplay *ButtonDisplay_create(int width, int height, int rows, int cols, int button_width, int button_height)
{
    ButtonDisplay *display = (ButtonDisplay *)malloc(sizeof(ButtonDisplay));
    display->width = width;
    display->height = height;
    display->rows = rows;
    display->cols = cols;
    display->button_width = button_width;
    display->button_height = button_height;

    static lv_style_t style;
    lv_style_init(&style);
    lv_style_set_flex_flow(&style, LV_FLEX_FLOW_ROW_WRAP);
    lv_style_set_flex_main_place(&style, LV_FLEX_ALIGN_SPACE_EVENLY);
    lv_style_set_layout(&style, LV_LAYOUT_FLEX);
    lv_style_set_bg_color(&style, lv_color_hex(0x212121));
    lv_style_set_bg_image_src(&style, &homebridge_color_round);

    static lv_style_t buttonStyle;
    lv_style_init(&buttonStyle);
    // lv_style_set_flex_flow(&buttonStyle, LV_FLEX_FLOW_ROW_WRAP);
    lv_style_set_flex_main_place(&buttonStyle, LV_FLEX_ALIGN_SPACE_EVENLY);
    lv_style_set_layout(&buttonStyle, LV_LAYOUT_FLEX);
    lv_style_set_bg_color(&buttonStyle, lv_color_hex(0xf57c00));
    lv_style_set_border_width(&buttonStyle, 0);
    lv_style_set_bg_opa(&buttonStyle, LV_OPA_COVER);
    lv_style_set_pad_all(&buttonStyle, 5);
    // lv_style_set_bg_image_src(&buttonStyle, &homebridge_color_round);

    lv_obj_t *screen = lv_obj_create(lv_screen_active());
    lv_obj_set_size(screen, width, height);
    lv_obj_center(screen);
    lv_obj_add_style(screen, &style, 0);

    // Create buttons
    for (int i = 0; i < rows * cols; ++i)
    {
        display->buttons[i] = lv_obj_create(screen);
        lv_obj_set_flex_align(display->buttons[i], LV_FLEX_ALIGN_CENTER, LV_FLEX_ALIGN_CENTER, LV_FLEX_ALIGN_CENTER);
        lv_obj_add_style(display->buttons[i], &buttonStyle, 0);
        lv_obj_set_size(display->buttons[i], button_width, button_height);
        lv_obj_add_flag(display->buttons[i], LV_OBJ_FLAG_CHECKABLE);
        // lv_obj_set_style_bg_opa(display->buttons[i], LV_OPA_TRANSP, 0);

        lv_obj_t *imageButton = lv_img_create(display->buttons[i]); // Create button
        lv_image_set_src(imageButton, &ui_img_lightoff_png);
        lv_obj_set_style_img_recolor(imageButton, lv_color_hex(0xFFFFFF), 0);
        lv_obj_set_style_img_recolor_opa(imageButton, LV_OPA_COVER, 0);
        lv_obj_set_size(imageButton, 60, button_height - 30);
        // lv_obj_set_style_pad_left(imageButton, 10, 0);
        // lv_obj_set_size(imageButton, 32, 32);
        // lv_obj_set_style_img_recolor(imageButton, lv_color_hex(0xFFFFFF), 0);
        // lv_obj_set_style_img_recolor_opa(imageButton, LV_OPA_COVER, 50);

        // lv_obj_set_style_bg_color(imageButton, lv_color_hex(0xf57c00), LV_PART_MAIN | LV_STATE_DEFAULT);
        lv_obj_t *nameContainer = lv_obj_create(display->buttons[i]);
        lv_obj_set_size(nameContainer, button_width - 80, button_height - 30);
        lv_obj_add_style(nameContainer, &buttonStyle, 0);
        lv_obj_set_flex_flow(nameContainer, LV_FLEX_FLOW_COLUMN);
        lv_obj_set_flex_align(nameContainer, LV_FLEX_ALIGN_CENTER, LV_FLEX_ALIGN_CENTER, LV_FLEX_ALIGN_CENTER);

        lv_obj_t *label = lv_label_create(nameContainer);
        lv_label_set_text_fmt(label, "Lamp %" LV_PRIu32, i);
        lv_obj_align(label, LV_ALIGN_BOTTOM_LEFT, 0, 0);
        lv_obj_t *status = lv_label_create(nameContainer);
        lv_label_set_text(status, "Off");
        lv_obj_align(status, LV_ALIGN_BOTTOM_LEFT, 0, 0);
    }
    return display;
}

void ButtonDisplay_begin(ButtonDisplay *display)
{
    // Initialize button display (e.g., set styles)
    for (int i = 0; i < display->rows * display->cols; ++i)
    {
        lv_obj_set_style_bg_color(display->buttons[i], lv_color_hex(0xf57c00), LV_PART_MAIN | LV_STATE_DEFAULT);
    }
}

void ButtonDisplay_destroy(ButtonDisplay *display)
{
    // Cleanup: delete buttons
    for (int i = 0; i < display->rows * display->cols; ++i)
    {
        lv_obj_del(display->buttons[i]);
    }
    free(display);
}
