/// @description  Propeties

if (xspeed <> 0) { x += (xspeed * global.tempo); } // X-Speed
if (yspeed <> 0) { y += (yspeed * global.tempo); } // Y-SPeed
if (framerate <> 0) { image_index = (objScreen.image_index div abs(framerate)); } // Framerate
if (sprite_index > -1) { if (sprite_width <> 0) { x = x mod (sprite_width + separation_x); } if (sprite_height <> 0) { y = y mod (sprite_height + separation_y); } } // Transformation