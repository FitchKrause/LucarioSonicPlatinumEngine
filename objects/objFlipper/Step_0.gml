/// @description  Control player
with player_id
{
    // debug mode
    if (state == player_is_debugging)
    {
        other.player_id = noone;
        toggleflags &= ~(PLAYERSTATE_NOSTATE);
        
        return false;
    }

    // ground motion
    xspeed = (0.5 * other.image_xscale);
    
    // update position
    if not player_move_floor()
    {
        other.player_id = noone;
        toggleflags &= ~(PLAYERSTATE_NOSTATE);

        return false;
    }
    
    // falling
    if not floor_tag
    {
        other.player_id = noone;
        toggleflags &= ~(PLAYERSTATE_NOSTATE);
        
        return player_is_falling(-1);
    }
    if (other.image_xscale == 1)
    {
        if (bbox_left > other.bbox_right)
        {
            other.player_id = noone;
            toggleflags &= ~(PLAYERSTATE_NOSTATE);
            
            return player_is_falling(-1);
        }
    }
    else
    {
        if (bbox_right < other.bbox_left)
        {
            other.player_id = noone;
            toggleflags &= ~(PLAYERSTATE_NOSTATE);
            
            return player_is_falling(-1);
        }
    }
    // release control if not on flipper
    if (floor_id <> other.id)
    {
        other.player_id = noone;
        toggleflags &= ~(PLAYERSTATE_NOSTATE);
        
        return player_is_rolling(-1);
    }

    // fling upward
    if (input_pressed & INPUT_ACTION)
    {
        // states and flags
        state = player_is_falling;
        spinning = false;
        jump_action = true;

        // movement and collision
        xspeed = (x - other.x) * 0.15;
        yspeed = -14;

        // set air state
        player_in_air();

        // release control and animate
        other.animation_running = true;
        other.animation_tick = 0;
        other.player_id = noone;
        toggleflags &= ~(PLAYERSTATE_NOSTATE);
        
        audio_play_stereo(sndFlipper, x, y, false, 0);
    }
}

