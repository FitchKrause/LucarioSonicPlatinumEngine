/// @description Logic

// Animation
if (animation_script == player_animation_shield_fire_action) and player_id.floor_tag
{
    with shield_backlayer { visible = true; }
    animation_script = player_animation_shield_fire;
    animation_speed = 1;
    animation_running = true;
    animation_reset = true;
}

/// Collision for break objects
if (animation_script == player_animation_shield_fire_action)
{
    // Monitor
    var monitorObject = collision_ellipse(x - sprite_xoffset, y - sprite_yoffset, x + sprite_xoffset, y + sprite_yoffset, objMonitor, false, true);
    if (monitorObject <> noone)
    {
	    with instance_create_depth(monitorObject.x, monitorObject.y + (monitorObject.image_yscale * 2), 0, objMonitorIcon)
	    {
	        if (monitorObject.icon == MONITOR_RANDOM) 
	        {
	            monitorObject.icon = irandom_range(MONITOR_EXTRALIFE, (MONITOR_RANDOM - 1));
	        }
        
	        if (monitorObject.icon < MONITOR_EGGMAN) 
	        {
	            sprite_index = sprMonitorIconCharacter;
	            image_index = (other.player_id.character_id - 1);
	        }
	        else
	        {
	            sprite_index = sprMonitorIcon;
	            image_index = (monitorObject.icon - 1);
	        }
        
	        item = monitorObject.icon;
	        player_id = other.player_id.id;
	    }
	    audio_play_stereo(sndPop, monitorObject.x, monitorObject.y, false, 0);
    }
}

// Destroy in underwater
if not player_id.invincibility
{
    if player_id.underwater
    {
        instance_destroy();
        player_id.shield = noone;
        player_id.shield_type = SHIELD_NONE;
    }
}

