/// @description  Movement

// Apply speed
/*posx += xspeed * global.tempo;
posy += yspeed * global.tempo;
movex = posx - x;
movey = posy - y;*/
x += floor(xspeed) * global.tempo;
y += floor(yspeed) * global.tempo;

// Detect
direction_instance = instance_position(x, y, objModifierDirection);
if (direction_instance <> noone)
{
    // Move right
	xspeed += ((xspeed_max * sine[direction_instance.image_angle]) / 15); //min(xspeed + (xspeed_max / 15), lengthdir_x(xspeed_max, direction_instance.image_angle));
	
    /*if (lengthdir_x(xspeed_max, direction_instance.image_angle) > xspeed)
    {
        xspeed = min(xspeed + (xspeed_max / 15), lengthdir_x(xspeed_max, direction_instance.image_angle));
    }
    
    // Move left
    if (lengthdir_x(xspeed_max, direction_instance.image_angle) < xspeed)
    {
        xspeed = max(xspeed - (xspeed_max / 15), lengthdir_x(xspeed_max, direction_instance.image_angle));
    }
    
    // Move down
    if (lengthdir_y(yspeed_max, direction_instance.image_angle) > yspeed)
    {
        yspeed = min(yspeed + (yspeed_max / 15), lengthdir_y(yspeed_max, direction_instance.image_angle));
    }
    
    // Move up
    if (lengthdir_y(yspeed_max, direction_instance.image_angle) < yspeed)
    {
        yspeed = max(yspeed - (yspeed_max / 15), lengthdir_y(yspeed_max, direction_instance.image_angle));
    }*/
}