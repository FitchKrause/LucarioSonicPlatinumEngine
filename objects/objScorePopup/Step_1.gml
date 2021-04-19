/// @description  Timer

if (timer)
{
    timer -= 1 * global.tempo;
    
    if (not timer)
    {
        instance_destroy();
    }
}

