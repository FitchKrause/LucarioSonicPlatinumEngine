/// @description  Timer

if (timer)
{
    timer -= 1 * global.tempo;
    if (not timer)
    {
        depth = -2;
        vspeed = -5 * global.tempo;
        gravity = (0.21875) * global.tempo;
    }
}

