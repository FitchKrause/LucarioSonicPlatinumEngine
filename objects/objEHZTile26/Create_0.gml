/// @description  Initialize

event_inherited();

flat_surface = false;
surface_angle = ANGLEFLAG_ALL;
angle_sides = ANGLEDIR_TOP|ANGLEDIR_RIGHT;
climb_direction = DIRECTION_LEFT;
if (image_xscale == -1) { climb_direction = DIRECTION_RIGHT; angle_sides = ANGLEDIR_TOP|ANGLEDIR_BOTTOM|ANGLEDIR_LEFT; }

