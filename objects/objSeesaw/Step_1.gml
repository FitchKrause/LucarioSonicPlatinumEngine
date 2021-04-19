/// @description  Thinker

switch (side)
{
    case -1:
    {
        var object = collision_rectangle(bbox_left - 2, y - 30, x - 10, y, objSeesawBall, false, true);
        if (object <> noone)
        {
            if ((object_left <> object) and (sign(object.yspeed) == 0))
            {
                object_left = object;
                object_left.x = x - 32;
                if (object_right <> noone)
                {
                    object_right.yspeed = neg(heigth / max((bbox_right - (object_right.x)) / 16, 1)) * 20;
                    object_right.xspeed = 0;
                    object_right.floor_id = noone;
                    object_right.state = player_is_falling;
                    object_right.animation_new = "rise";
                    object_right = noone;
                    audio_play_normal(sndSpring, false, 0);
                }
            }
        }
        else
        {
            object_left = noone;
        }
        break;
    }
    
    case 1:
    {
        var object = collision_rectangle(x + 10, y - 30, bbox_right, y, objSeesawBall, false, true);
        if (object <> noone)
        {
            if ((object_right <> object) and (sign(object.yspeed) == 0))
            {
                object_right = object;
                object_right.x = x + 32;
                if (object_left <> noone)
                {
                    object_left.yspeed = neg(height / max(((object_left.x) - bbox_left) / 16, 1)) * 20;
                    object_left.xspeed = 0;
                    object_left.floor_id = noone;
                    object_left.state = player_is_falling;
                    object_left.animation_new = "rise";
                    object_left = noone;
                    audio_play_normal(sndSpring, false, 0);
                }
            }
        }
        else
        {
            object_right = noone;
        }
        break;
    }
}

if ((object_right == noone) or (object_right.object_index == objPlayer))
{
    object = collision_rectangle(x + 10, y - 40, bbox_right, y, objPlayer, true, true);
    if ((object <> noone) and (object <> object_right) and (object <> object_left))
    {
        if (object.floor_id == id)
        {
            object_right = object;
            if (object_left <> noone)
            {
                height = -10;
                side = 1;
                object_left.yspeed = height;
                object_left.xspeed = 64 / ((abs(height) * 2) / 0.2);
                object_left = noone;                  
            }
        }
    }
    else if (object == noone) { object_right = noone; }
    else { object.angle = 0; } 
}

if ((object_left == noone) or (object_left.object_index == objPlayer))
{
    object = collision_rectangle(bbox_left - 2, y - 40, x - 10, y, objPlayer, true, true);
    if ((object <> noone) and (object <> object_left) and (object <> object_right))
    {
        if (object.floor_id == id)
        {
            object_left = object;
            if (object_right <> noone)
            {
                height = -10;
                side = -1;
                object_right.yspeed = height;
                object_right.xspeed = 64 / ((height * 2) / 0.2);
                object_right = noone;
            }
        }
    }
    else if (object == noone) { object_left = noone; }
}

if ((object_left <> noone) and (object_right == noone) and (image_index > 0))
{
    image_index -= 0.2; 
    with (object_left) { repeat(7) { if not place_meeting(x, y + 1, other.id) { y += 1; } } }
}
else if ((object_left == noone) and (object_right == noone))
{
    if (image_index < 1) { image_index += 0.2; }
    if (image_index > 1) { image_index -= 0.2; }
}
else if ((object_left == noone) and (object_right <> noone) and (image_index < 2))
{
    image_index += 0.2; 
    with (object_right) { repeat(7) { if not place_meeting(x, y + 1, other.id) { y += 1; } } }
}

