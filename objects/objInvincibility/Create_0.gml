/// @description  Initialize

image_speed = 0;
event_inherited();

// properties
spacing = 2;
angle = 0;
angle2 = 0;
flip = false;

// initialize
for (var i = 0; i < 4; i += 1)  { px[i] = floor(x); py[i] = floor(y); }