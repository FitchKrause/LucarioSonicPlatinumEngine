/// @description  Break objects

// Monitor
var monitor = collision_ellipse(x - sprite_xoffset, y - sprite_yoffset, x + sprite_xoffset, y + sprite_yoffset, objMonitor, false, true);
if (monitor <> noone)
{
    with instance_create_depth(monitor.x, monitor.y + (monitor.image_yscale * 2), 0, objMonitorIcon)
    {
        if (monitor.icon == MONITOR_RANDOM)  { monitor.icon = irandom_range(MONITOR_EXTRALIFE, (MONITOR_RANDOM - 1)); }
        if (monitor.icon < MONITOR_EGGMAN) { sprite_index = sprMonitorIconCharacter; image_index = (other.player_id.character_id - 1); } else { sprite_index = sprMonitorIcon; image_index = (monitor.icon - 1); }
        
        item = monitor.icon;
        player_id = other.player_id.id;
    }
    
    audio_play_stereo(sndPop, monitor.x, monitor.y, false, 0);
    instance_destroy(monitor);
}