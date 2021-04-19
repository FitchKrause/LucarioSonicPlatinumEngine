/// @description  Timers

// Offset
if (offset)
{
    offset -= 1;
    if (not offset)
    {
        timer = timer_normal;
    }
}

// Timer
if (timer)
{
    timer -= 1;
    
    if (not timer)
    {
        event_user(0);
    }
}

