/// @description Initialize
event_inherited();

image_alpha = 0;
image_speed = 0;

// General
tiled = 0;
framerate = 0;

// Offset
xoffset = 0;
yoffset = 0;

// Elements
left = 0;
top = 0;
width = 0;
height = 0;

// Relative position
relative_x = 1;
relative_y = 1;

// Absolute position
absolute_x = 0;
absolute_y = 0;

// Separation
separation_x = 0;
separation_y = 0;

// Layer
frontside = false;
depth = frontside ? -9999 : 9999;