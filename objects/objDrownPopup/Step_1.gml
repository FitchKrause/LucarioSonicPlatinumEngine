/// @description  Timers

if timer[0]
{
    timer[0] -= 1;
    if not timer[0] { timer[1] = 48; }
}

if timer[1]
{
    timer[1] -= 1;
    if not timer[1] { instance_destroy(); }
}