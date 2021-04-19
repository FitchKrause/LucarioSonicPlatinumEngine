/// @description  Falling

if not (place_meeting(x, y + 1, objColliderHard))
{
    yspeed += (0.2 * global.tempo);
    y += (yspeed * global.tempo);
}
else
{
    yspeed = 0;
    while (place_meeting(x, y, objColliderHard))
    {
        y -= (1 * global.tempo);
    }
}

