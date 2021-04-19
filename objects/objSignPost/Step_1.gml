/// @description  Animation

if (animation_running)
{
    if (animation_speed <> 0)
    {
        // Execute
        if (script_exists(animation_script))
        {
            script_execute(animation_script, floor(animation_tick));
        }
        
        // Count tick
        animation_tick += animation_speed * global.tempo;
    }
}

if (animation_reset)
{
    animation_reset = false;
    animation_tick = 0;
}

