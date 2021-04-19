/// @description  State machine

switch (state)
{
    // Normal
    case 0:
    {
        // Image index
        image_index = objScreen.image_index div 8;
        
        // Detect magnetism
        with objPlayer
        {
            if (shield_type <> SHIELD_LIGHTNING) { break; }
            if (point_distance(x, y, other.x, other.y) > 64) { break; }
            with other
            {
                player_id = other.id;
                state = 1;
                deletion_method = 0;
            }
            break;
        }
        
        break;
    }
    
    // Magnetized
    case 1:
    {
        // If null
        if (player_id == noone)
        {
            deletion_method = 2;
            timer = 256;
            state = 2;
            
            animation_speed = 0.5;
            gravity = (0.09375) * global.tempo;
            break;
        }
        
        // If the player don't exists
        else if not instance_exists(player_id)
        {
            deletion_method = 2;
            timer = 256;
            state = 2;
            
            animation_speed = 0.5;
            gravity = (0.09375) * global.tempo;
            break;
        }
        
        // The player dosen't have the lightning shield
        else if (player_id.shield_type <> SHIELD_LIGHTNING)
        {
            deletion_method = 2;
            timer = 256;
            state = 2;
            
            animation_speed = 0.5;
            gravity = (0.09375) * global.tempo;
            break;
        }
        
        // Update image index
        image_index = objScreen.image_index div 8;
        
        // Update magnetism
        var sx = sign(player_id.x - x);
        var sy = sign(player_id.y - y);
        hspeed += sx * (0.12 + (0.36 * (sign(hspeed) <> sx))) * global.tempo;
        vspeed += sy * (0.12 + (0.36 * (sign(vspeed) <> sy))) * global.tempo;
        speed = median(speed, -32, 32) * global.tempo;
        break;
    }
    
    // Dropped
    case 2:
    {
        // Timer
        if timer { timer -= 1 * global.tempo; }
        
        // Slow down
        animation += (1 * animation_speed) * global.tempo;
        animation_speed -= 0.002 * global.tempo
        image_index = floor(animation);

        // Flashing
        if (timer < 64) { visible = not visible; }
        
        // Destroy
        if not timer { instance_destroy(); break; }
        
        // Handle bouncing

        // get vectors relative to gravity direction
        var relative_hspeed = lengthdir_x(speed, (direction - gravity_direction) - 90);
        var relative_vspeed = lengthdir_y(speed, (direction - gravity_direction) - 90);
        
        // move outside of collision
        if place_meeting(x, y, objColliderHard)
        {
            x -= lengthdir_x(1, direction) * global.tempo;
            
            y -= lengthdir_y(1, direction) * global.tempo;
        }
        
        // check which direction we collided
        if (relative_hspeed > 0) and collision_ray_vertical(17, 0, gravity_angle(), objColliderHard) { relative_hspeed *= -0.75; }
        if (relative_hspeed < 0) and collision_ray_vertical(-17, 0, gravity_angle(), objColliderHard) { relative_hspeed *= -0.75; }
        if (relative_vspeed > 0) and collision_ray(0, 17, gravity_angle(), objColliderHard) { relative_vspeed *= -0.75; }
        if (relative_vspeed < 0) and collision_ray(0, -17, gravity_angle(), objColliderHard) { relative_vspeed *= -0.75; }
        
        // redirect using new vector
        gravity = (0.09375) * global.tempo;
        speed = point_distance(0, 0, relative_hspeed, relative_vspeed) * global.tempo;
        direction = point_direction(0, 0, relative_hspeed, relative_vspeed) + gravity_angle();
        break;
    }
}