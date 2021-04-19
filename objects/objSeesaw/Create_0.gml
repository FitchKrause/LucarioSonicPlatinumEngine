/// @description  Initialize

event_inherited();
image_speed = 0;

object_left = noone;
object_right = noone;
heigth = -5;
//heigth_max = -16;

side = 0;
if collision_rectangle(bbox_left, y - 30, x - 10, y, objSeesawBall, true, true) { side = -1; }
else if collision_rectangle(x + 10, y - 30, bbox_right, y, objSeesawBall, true, true) { side = 1; }

