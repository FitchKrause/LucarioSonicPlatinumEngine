/// @description  Bounce on landing
if (action)
{
    if (player_id.floor_tag)
    {
        action = false;
        
        animation_script = player_animation_shield_bubble_action;
        animation_speed = 1;
        animation_running = true;
        animation_reset = true;
        
        with player_id
        {
            player_in_air();
            state = player_is_falling;
            spinning = true;
            jumping = false;
            jump_action = false;
            yspeed = -7.5;
            
            animation_new = "spin";
            animation_speed = (1 / max(5 - abs(xspeed), 1));
            image_angle = 0;
            
            audio_play_emitter(audio_emitter, sndShieldBubbleAction, false, 0);
        }
    }
}

