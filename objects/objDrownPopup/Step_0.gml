/// @description  Speed Movement

if not (sprite_index == sprDrownPopup)
{
    x += xspeed * global.tempo;
    y += yspeed * global.tempo;
}

if (frame_speed > 0)
{
    // Xspeed and offset
    xspeed = sine[offset] * 0.25;
    offset = (offset + 3) mod 360;
}

