/// @description  Fall
x += xspeed;
y += yspeed;
if (gravity_enabled) { yspeed += 0.21875; }

if (y > (ystart + 512))
{
    instance_destroy();
}

