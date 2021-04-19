/// @functions parallax_create(mode, frontside, sprite, framerate, left, top, width, height, xspeed, yspeed, relative_x, relative_y, absolute_x, absolute_y, separation_x, separation_y);
/// @description Creates a new parallax with the given properties.
/// @param mode
/// @param frontside
/// @param sprite
/// @param framerate
/// @param left
/// @param top
/// @param width
/// @param height
/// @param xspeed
/// @param yspeed
/// @param relative_x
/// @param relative_y
/// @param absolute_x
/// @param absolute_y
/// @param separation_x
/// @param separation_y
function parallax_create()
{
	/*
	Creates a new parallax with the given properties.

	> mode: 0 is a static image, 1 is tiled horizontally, 2 is tiled vertically, 3 tiled in both directions.
	> frontside: false is bottom render, true is top render.
	> sprite: Sprite index to use.
	> image_speed: Desired frame rate. Lower number is faster, and higher numbers is slower.
	> left, top, width, height: Portion of the sprite to use.
	> xspeed, yspeed: Movement speed of the sprite.
	> relative_x, relative_y: Ratio between the sprite's coordinates and the view's; a value of 0 freezes the sprite in place,
	                          while a value of 1 moves the sprite 1:1 with the view. Values inbetween interpolate.
	> absolute_x, absolute_y: Base x and y coordinates to place the sprite at.
	> separation_x, separation_y: Amount of space in pixels between each tiled sprite image.

	< return value: instance id of the parallax or noone if something went wrong.
	*/
	
	with instance_create_depth(0, 0, 1024, objParallax)
	{
	    // General
	    tiled = argument[0];
	    frontside = argument[1];

	    // Sprite
	    sprite_index = argument[2];
	    framerate = argument[3];
    
	    // Positions
	    left = argument[4];
	    top = argument[5];
	    width = argument[6];
	    height = argument[7];
   
	    // Speed
	    xspeed = argument[8];
	    yspeed = argument[9];
 
	    // Relative position
	    relative_x = argument[10];
	    relative_y = argument[11];
    
	    // Absolute position
	    absolute_x = argument[12];
	    absolute_y = argument[13];
    
	    // Separation
	    separation_x = argument[14];
	    separation_y = argument[15];
    
	    // Done
	    return id;
	}
	return noone;
}