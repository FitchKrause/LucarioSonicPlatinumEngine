/// @description  player_is_falling(step)
/// @param step
function player_is_falling(argument0) {
	switch argument0
	{
	case -2: // starting (jump)
	    // animate
	    animation_new = "spin";
	    animation_speed = (1 / max(6 - abs(xspeed), 1));
	    image_angle = 0;
    
	    // states and flags
	    state = player_is_falling;
	    spinning = true;
	    jumping = true;
	    jump_action = true;
	    dropdash_action = false;
	    spindashing = false;
	    peelouting = false;
	    floating = false;
	    dropdasing = false;
    
	    // movement and collision
	    var ground_speed = xspeed;
	    xspeed = (cosine[relative_angle] * ground_speed) - (sine[relative_angle] * jump_constant);
	    yspeed = -(sine[relative_angle] * ground_speed) - (cosine[relative_angle] * jump_constant);

	    // set air state
	    player_in_air();
	    uncurl = 0;
    
	    // sound
	    audio_play_emitter(audio_emitter, sndJump, false, 0);
	    break;

	case -1: // starting
	    // animate
	    if (animation_current == "brake") or (animation_current == "push") or (animation_new == "brake") or (animation_new == "push")
	    {
	        if ((character_id == CHARACTER_TAILS) or (character_id == CHARACTER_SONIC)) and (abs(xspeed) >= (base_speed_cap + 2)) { animation_new = "sprint"; }
	        else if (abs(xspeed) >= base_speed_cap)  { animation_new = "run";  }
	        else { animation_new = "walk"; animation_speed = 1 / max(10 - abs(xspeed), 1); }
	    }
	    if objData.falling_animations { animation_new = "fall"; }

	    // states and flags
	    state = player_is_falling;
	    jumping = false;
	    jump_action = false;
	    dropdash_action = false;
	    dropdasing = false;
	    dropdash_charge = 0;
	    if not ((animation_current == "spin") and (animation_new == "spin")) { spinning = false; }
    
	    // calculate movement
	    var newx = cosine[relative_angle] * xspeed;
	    var newy = -sine[relative_angle] * xspeed;
	    if instance_exists(floor_id) { if (floor_id.surface_angle & ANGLEFLAG_COLLISION) and not (floor_id.surface_angle & ANGLEFLAG_LAUNCH) { newx = xspeed; newy = yspeed; } }
    
	    // movement and collision
	    yspeed = newy;
	    xspeed = newx;

	    // set air state
	    player_in_air();
	    uncurl = 0;
	    break;

	default: // main
	    // aerial acceleration
	    if (input & INPUT_LEFT)
	    {
	        if not reverse_control { facing = -1;  if (xspeed > -speed_cap)  { xspeed = max(xspeed - air_acceleration, -speed_cap); } }
	        else { facing = 1;  if (xspeed < speed_cap) { xspeed = min(xspeed + air_acceleration, speed_cap); } }
	    }
        
	    if (input & INPUT_RIGHT)
	    {
	        if not reverse_control { facing = 1; if (xspeed < speed_cap) { xspeed = min(xspeed + air_acceleration, speed_cap); } }
	        else { facing = -1; if (xspeed > -speed_cap) { xspeed = max(xspeed - air_acceleration, -speed_cap); } }
	    }

	    // movement
	    if not player_move_air() { return false; }

	    // jump height
	    if jumping and (input_released & INPUT_ACTION) and (yspeed < -jump_release) { yspeed = -jump_release; }

	    // air friction
	    /*if ((yspeed < 0) and (yspeed > -jump_release))
	    {
	        if (abs(xspeed) > 0.125)
	        {
	            xspeed *= (air_friction);
	        }
	    }*/
    
	    // gravity
	    yspeed += (gravity_force * global.tempo);
    
	    // landing
	    if floor_tag
	    {
	        // maintain spindash
	        if spindashing
	        {
	            animation_reset = true;
	            return player_is_spindashing(-1);
	        }
        
	        // maintain super peel out
	        if peelouting
	        {
	            animation_reset = true;
	            return player_is_peelouting(-1);
	        }
        
	        // perform dropdash
	        if dropdasing and (character_id == CHARACTER_SONIC)
	        {
	            xspeed = facing * ((abs(xspeed) / 12) + 8);
	            camera.timer = floor(24 - abs(xspeed));
	            jump_action = false;
	            dropdash_action = false;
	            dropdasing = false;
	            jumping = false;
	            dropdash_charge = 0;
            
	            if (audio_is_playing(reserved_sound)) { audio_stop_sound(reserved_sound); }
	            audio_play_emitter(audio_emitter, sndSpinDashRelease, false, 0);
	            return player_is_rolling(-1);
	        }

	        // land normally
	        if (xspeed <> 0) { return player_is_running(-1); } else { return player_is_standing(-1); }
	    }

	    // Transform
	    if (input_pressed & INPUT_Z) and (character_id == CHARACTER_SONIC)
	    {
	        if (objData.player_rings[player_id] >= 25) and not super_form { return player_is_transforming(-1); }
	        else if super_form
	        {
	            music_play_loop(objZone.music, objZone.looppoint, objMusic.music_position[0], MUSPLAYFLAG_FADING|MUSPLAYFLAG_NOFORCE);
	            player_trasformation(true);
	            super_form = false;            
            
	            switch character_id
	            {
	                case CHARACTER_SONIC: { animation_table = objResources.anim_sonic; break; }
	            }
	            player_reset_physics();
	            animation_reset = true;
	        }
	    }
    
	    // Force spinning (and allows jump action)
	    if not (toggleflags & PLAYERSTATE_NORECURL)
	    {
	        if (input_pressed & INPUT_ACTION) and (animation_current <> "spin") and not jump_action and not jumping and not spinning
	        {
	            jump_action = true;
	            jumping = true;
	            spinning = true;
	            animation_new = "spin";
	            animation_speed = (1 / max(6 - abs(xspeed), 1));
	            image_angle = 0;
	        }
	    }

	    // Jump action
	    if (not objData.player_cpu[player_id])
	    {
	        if not (toggleflags & PLAYERSTATE_NOJUMPACTION) and (jump_action or multiability)
	        {
	            // Sonic's dropdash
	            if (character_id == CHARACTER_SONIC) and not super_form
	            {
	                if (animation_current == "spin")
	                {
	                    // Initialize
	                    if (input_pressed & INPUT_A) { if not dropdash_action { dropdash_action = true; } }
                    
	                    // Holding
	                    if (input & INPUT_A)
	                    {
	                        if not dropdasing and dropdash_action
	                        {
	                            dropdash_charge += 1;
	                            if (dropdash_charge >= dropdash_charge_max)
	                            {
	                                if (audio_is_playing(reserved_sound)) { audio_stop_sound(reserved_sound); }
	                                reserved_sound = audio_play_emitter(audio_emitter, sndSpinDashCharge, false, 0);
                                
	                                animation_new = "dropdash";
	                                animation_speed = 1;
	                                dropdasing = true;
	                                dropdash_charge = 0;
	                            }
	                        }
	                    }
	                }
	                else if (animation_current == "dropdash")
	                {
	                    // Cancel
	                    if not (input & INPUT_A)
	                    {
	                        if dropdasing
	                        {
	                            animation_new = "spin";
	                            animation_speed = (1 / max(6 - abs(xspeed), 1));
	                            jump_action = false;
	                            dropdash_action = false;
	                            dropdasing = false;
	                            dropdash_charge = 0;
	                        }
	                    }
	                }
	            }
            
	            // Character abilities
	            if (animation_current == "spin")
	            {
	                // Primary
	                if (input_pressed & INPUT_A)
	                {
	                    switch character_id
	                    {                    
	                        // Tails
	                        case CHARACTER_TAILS:
	                        {
	                            return player_is_flying(-1);
	                            break;
	                        }
                
	                        // Knuckles
	                        case CHARACTER_KNUCKLES:
	                        {
	                            return player_is_gliding(-1);
	                            break;
	                        }
	                    }
	                }
            
	                // Secondary
	                if (input_pressed & INPUT_B)
	                {
	                    switch (character_id)
	                    {
	                        // Sonic
	                        case CHARACTER_SONIC:
	                        {
	                            if not invincibility and not super_form
	                            {
	                                if shield
	                                {
	                                    switch shield_type
	                                    {
	                                        case SHIELD_LIGHTNING:
	                                        {
	                                            return player_is_lightning_jump(); 
	                                            break;
	                                        }
                                        
	                                        case SHIELD_FIRE:
	                                        {
	                                            return player_is_fire_boost();
	                                            break;
	                                        }
                                        
	                                        case SHIELD_BUBBLE:
	                                        {
	                                            return player_is_bubble_jump();
	                                            break;
	                                        }
	                                    }
	                                }
	                                else
	                                {
	                                    audio_play_emitter(audio_emitter, sndShieldInstashield, false, 0);
	                                    player_get_shield(SHIELD_INSTASHIELD);
                                    
	                                    spinning = true;
	                                    jumping = false;
	                                    jump_action = false;
	                                }
	                            }
	                            break;
	                        }
                        
	                        // Tails or Knuckles
	                        case CHARACTER_TAILS:
	                        case CHARACTER_KNUCKLES:
	                        {
	                            if not invincibility and not super_form
	                            {
	                                if shield
	                                {
	                                    switch shield_type
	                                    {
	                                        case SHIELD_LIGHTNING:
	                                        {
	                                            return player_is_lightning_jump();
	                                            break;
	                                        }
                                        
	                                        case SHIELD_FIRE:
	                                        {
	                                            return player_is_fire_boost();
	                                            break;
	                                        }
                                        
	                                        case SHIELD_BUBBLE:
	                                        {
	                                            return player_is_bubble_jump();
	                                            break;
	                                        }
	                                    }
	                                }
	                            }
	                            break;
	                        }
	                    }
	                }
	            }
	        }
	    }

	    // Animate
	    if (animation_current == "rise") and (yspeed >= 0) 
	    { 
	        if (abs(xspeed) >= (base_speed_cap + 2)) and ((character_id == CHARACTER_TAILS) or (character_id == CHARACTER_SONIC)) { animation_new = "sprint";  }
	        else if (abs(xspeed) >= base_speed_cap) { animation_new = "run";  }
	        else { animation_new = "walk"; }
	        if objData.falling_animations { animation_new = "fall"; }
        
	        animation_speed = (1 / max(10 - abs(xspeed), 1));
	    }
	    if spinning and (animation_current == "spin") and not dropdasing { animation_speed = (1 / max(6 - abs(xspeed), 1)); }
	    if not spinning and (image_angle <> angle)  { image_angle = angle_wrap(image_angle + (2.8125 * global.tempo) * sign(distance_to_angle(image_angle, angle))); } // angle
	}



}
