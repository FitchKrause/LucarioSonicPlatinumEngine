/// @description  Logic

image_index = objScreen.image_index div 16;
if not visible { if timer { timer -= 1; if not timer { mask_index = noone; visible = true; } } }