/// @description  Handle bouncing

var object = collision_point(x, y, objColliderHard, true, true);
if (object)
{
    // ignore capsules
    if (object.object_index == objCapsule) or (object.object_index == objSwitch) exit;
    
    // get vectors relative to gravity direction
    var relative_hspeed = lengthdir_x(speed, (direction - gravity_direction) - 90);
    var relative_vspeed = lengthdir_y(speed, (direction - gravity_direction) - 90);
    
    // reverse and reduce speed on impact
    relative_vspeed = -5 * global.tempo;
    
    // initialize horizontal speed
    if (relative_hspeed == 0)
    {
        image_xscale = choose(1, -1);
        relative_hspeed = (image_xscale * 3) * global.tempo;
        
        // Animation system
        animation_script = object_animation_smallanimal;
        animation_tick = -1;
        animation_speed = 0.4;
        animation_running = true;
        animation_reset = false;
    }
    
    // redirect using new vector
    gravity = (0.21875) * global.tempo;
    speed = point_distance(0, 0, relative_hspeed, relative_vspeed) * global.tempo;
    direction = point_direction(0, 0, relative_hspeed, relative_vspeed) + gravity_angle();
}

