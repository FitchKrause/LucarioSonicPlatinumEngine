/// @description  Physics

if place_meeting(x, y + 1, objColliderHard) and (yspeed >= 0)
{
    yspeed = 0;
    xspeed = 0;
    while place_meeting(x, y, objColliderHard) { y -= 1; }
}
else if not place_meeting(x, y + 1, objColliderHard) or not (yspeed >= 0)
{
    x += xspeed;
    yspeed += 0.2;
    y += min(yspeed, 16);
}

