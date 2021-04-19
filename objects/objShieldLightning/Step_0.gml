/// @description  Destroy in underwater

if (not player_id.invincibility)
{
    if (player_id.underwater)
    {
        instance_destroy();
        player_id.shield = noone;
        player_id.shield_type = SHIELD_NONE;
        
        var water = collision_point(floor(player_id.xprevious), floor(player_id.yprevious), objWater, false, true)
        if (water)
        {
            water.flash = true;
        }
    }
}

