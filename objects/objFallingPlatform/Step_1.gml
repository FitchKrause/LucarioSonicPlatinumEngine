/// @description  Logic state

switch (state)
{
    // Idle
    case 0: 
    { 
        if place_meeting(x, y - 10, objPlayer) and (objPlayer.floor_id == id)
        {
            timer = timer_max;
            state = 1;
        }
        break;
    }
    
    // Fall
    case 1:
    {
        if (timer <= 0)
        {
            yspeed += gravity_speed;
            y += yspeed;
            
            mask_index = sprMaskNull;
			if (y >= (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) + (sprite_yoffset + 10))
            {
                visible = false;
                yspeed = 0;
                state = 2;
            }
        }
        timer -= 1;
    }
    
    // Reappear
    case 2:
    {
		if (abs(x - ((camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2))) > camera_get_view_width(view_camera[0]))
        {
            visible = true;
            y = ystart;
            mask_index = noone;
            state = 0;
        }
    }
}


