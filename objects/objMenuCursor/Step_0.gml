/// @description moving and Input

// Input
if (step_script == noone)
{
    if (input_check_pressed(0, INPUT_LEFT))
    {
        if (not moving and (xx_id > 0))
        {
            xx_target = xx - xx_target;
            xx_id -= 1;
            moving = true;
            
            audio_play_normal(sndBeep, false, 0);
        }
    }
    else if (input_check_pressed(0, INPUT_RIGHT))
    {
        if (not moving and (xx_id < xx_limit_id))
        {
            xx_target = xx + xx_target;
            xx_id += 1;
            moving = true;
            
            audio_play_normal(sndBeep, false, 0);
        }
    }
    else if (input_check_pressed(0, INPUT_UP))
    {
        if (not moving and (yy_id > 0))
        {
            yy_target = yy - yy_target;
            yy_id -= 1;
            moving = true;
            
            audio_play_normal(sndBeep, false, 0);
        }
    }
    else if (input_check_pressed(0, INPUT_DOWN))
    {
        if (not moving and (yy_id < yy_limit_id))
        {
            yy_target = yy + yy_target;
            yy_id += 1;
            moving = true;
            
            audio_play_normal(sndBeep, false, 0);
        }
    }
    
    // Move
    if (moving == true)
    {
        if (xx_target > xx)
        {
            xx += move_speed;
        }
        else if (xx_target < xx)
        {
            xx -= move_speed;
        }
        else if (yy_target > yy)
        {
            yy += move_speed;
        }
        else if (yy_target < yy)
        {
            yy -= move_speed;
        }
        else
        {
            moving = false;
        }
    }
}
else
{
    if (script_exists(step_script)) 
    {
        script_execute(step_script);
    }
}


