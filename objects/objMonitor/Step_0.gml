/// @description  Floor hitting


// vertical limit only
if (abs(vspeed) > 0)
{
    while place_meeting(x, y, objColliderHard)
    {
        y -= sign(vspeed) * global.tempo;
    }
}

// stop falling
if (place_meeting(x, y + image_yscale, objColliderHard))
{
    vspeed = 0;
    gravity = 0;
    floor_hit = true;
}

// move outside of collision
if place_meeting(x, y, objColliderHard) and not (place_free(x, y - 30))
{
    y -= 1 * global.tempo;
    floor_hit = true;
}

// levitating
if not (place_meeting(x, y + 1, objColliderHard)) and (jump_hit) and (floor_hit)
{
    vspeed = 2;
    gravity = 0.21875;
    //gravity_direction = gravity_direction;
    //direction = gravity_direction + 180;
    floor_hit = false;
}

// moving platforms
hit_floor = collision_box(15, 15, false, objColliderHard);
if instance_exists(hit_floor) and (jump_hit)
{
    if not (hit_floor.sprite_index == sprMonitor)
    {
        if (hit_floor.hspeed <> 0) x += hit_floor.hspeed;
        else if (hit_floor.x - hit_floor.xprevious != 0) x += (hit_floor.x - hit_floor.xprevious);
        
        if (hit_floor.vspeed <> 0) y += hit_floor.vspeed;
        else if (hit_floor.y - hit_floor.yprevious != 0) y += (hit_floor.y - hit_floor.yprevious);
    }
    else
    {
        hit_floor = noone;
    }
}

// release floor data
else
{
    hit_floor = noone;
}

