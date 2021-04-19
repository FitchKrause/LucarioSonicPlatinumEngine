/// @description  player_is_debugging()
function player_is_debugging(argument0) {
	switch argument0
	{
	case -1: // Starting
	    // States
	    state = player_is_debugging;
	    spinning = false;
	    jumping = false;
	    jump_action = false;
	    underwater = false;
	    outspace = false;
	    floating = false;
	    toggleflags &= ~(PLAYERSTATE_NOROTATE);
    
	    // Air state
	    player_in_air();
	    player_reset_physics();
    
	    // Timers and physics
	    xspeed = 0;
	    yspeed = 0;
	    dead_timer = 0;
	    global.tempo = global.tempo_base;

	    // Character
	    if (character_id == CHARACTER_KNUCKLES) { glide_falling = false; }
	    if (character_id == CHARACTER_TAILS) { with (tails_effect) {  visible = false; } }

	    // Camera
	    camera.vertical_lock = false;
	    camera.follow = true;
    
	    // Visibility
	    depth = 0;
	    visible = true;
        
	    // Modifiers and effects
	    if instance_exists(objDashSmoke) { with smoke { instance_destroy(); } }
	    if audio_is_playing(reserved_sound) { audio_stop_sound(reserved_sound); }
	    if shield { with shield { visible = false; } }
	    if invincibility { with invincibility { visible = false; } }
    
	    // Debug
	    debug_object = noone;
	    debug_sprite = -1;
	    debug_angle = 0;
	    break;

	default: // main

	    // Free move    
	    // Horizontal
	    if (input & INPUT_LEFT) { xspeed -= 0.5; } // Left
	    else if (input & INPUT_RIGHT) { xspeed += 0.5; } // Right
	    else { if (xspeed > 0) { xspeed -= 0.5; } else if (xspeed < 0) { xspeed += 0.5; } }
    
	    // Vertical
	    if (input & INPUT_UP) { yspeed -= 0.5; } // Up
	    else if (input & INPUT_DOWN) { yspeed += 0.5; } // Down
	    else { if (yspeed > 0) { yspeed -= 0.5; } else if (yspeed < 0) { yspeed += 0.5; } }
    
	    // Movement
	    xspeed = max(min(xspeed, 9), -9);   
	    yspeed = max(min(yspeed, 9), -9);
	    x += xspeed;
	    y += yspeed;
    
	    // Debug inputs
	    // Place object
	    if (input_pressed & INPUT_A) //or (input & INPUT_X)
	    {
	        debug_instance = instance_create_depth(floor(x), floor(y), 0, debug_object);
        
	        switch debug_object
	        {
	            case objMonitor:
	            {
	                debug_instance.icon = debug_type;
	                break;
	            }
	            case objSpringWhite: 
	            case objSpringWhiteDiagonal: 
	            case objSpringPurple:
	            case objSpringPurpleDiagonal:
	            case objSpringRed: 
	            case objSpringRedDiagonal:
	            case objSpringOrange: 
	            case objSpringOrangeDiagonal:
	            case objSpringYellow:
	            case objSpringYellowDiagonal: 
	            case objSpringGreen: 
	            case objSpringGreenDiagonal:
	            case objSpringBlue: 
	            case objSpringBlueDiagonal:
	            case objSpike:
	            case objSpikeSonic1:
	            {
	                debug_instance.image_angle = debug_type * 90;
	                break;
	            }
	        }
	    }
    
	    // Move the object list
	    if (input_pressed & INPUT_Y)
	    {
	        debug_pos += 1;
	        debug_type = 0;
	        debug_angle = 0;
	        if (debug_pos >= ds_list_size(debug_list)) { debug_pos = 0; }
	    }
    
	    // Move the object list backwards
	    if (input_pressed & INPUT_Z)
	    {
	        debug_pos -= 1;
	        debug_type = 0;
	        debug_angle = 0;
	        if (debug_pos < 0) { debug_pos = (ds_list_size(debug_list) - 1); }
	    }
    
	    // Change object type
	    if (input_pressed & INPUT_B)
	    {
	        debug_type += 1;
	        switch debug_object
	        {
	            case objMonitor:
	            {
	                if (debug_type > MONITOR_RANDOM) { debug_type = MONITOR_EXTRALIFE; }
	                break;
	            }
	            case objSpringWhite: 
	            case objSpringWhiteDiagonal: 
	            case objSpringPurple:
	            case objSpringPurpleDiagonal:
	            case objSpringRed: 
	            case objSpringRedDiagonal:
	            case objSpringOrange: 
	            case objSpringOrangeDiagonal:
	            case objSpringYellow:
	            case objSpringYellowDiagonal: 
	            case objSpringGreen: 
	            case objSpringGreenDiagonal:
	            case objSpringBlue: 
	            case objSpringBlueDiagonal:
	            case objSpike:
	            case objSpikeSonic1:
	            {
	                if (debug_type > 3) { debug_type = 0; }
	                break;
	            }
	            default: debug_type = 0;
	        }
	    }
    
	    // Change object type backwards
	    if (input_pressed & INPUT_C)
	    {
	        debug_type -= 1;
	        switch debug_object
	        {
	            case objMonitor:
	            {
	                if (debug_type < MONITOR_EXTRALIFE) { debug_type = MONITOR_RANDOM; }
	                break;
	            }
	            case objSpringWhite: 
	            case objSpringWhiteDiagonal: 
	            case objSpringPurple:
	            case objSpringPurpleDiagonal:
	            case objSpringRed: 
	            case objSpringRedDiagonal:
	            case objSpringOrange: 
	            case objSpringOrangeDiagonal:
	            case objSpringYellow:
	            case objSpringYellowDiagonal: 
	            case objSpringGreen: 
	            case objSpringGreenDiagonal:
	            case objSpringBlue: 
	            case objSpringBlueDiagonal:
	            case objSpike:
	            case objSpikeSonic1:
	            {
	                if (debug_type < 0) { debug_type = 3; }
	                break;
	            }
	            default: debug_type = 0;
	        }
	    }

	    // Modifiers and character
	    if (character_id == CHARACTER_TAILS) { with tails_effect { visible = false; } }
	    with shield { visible = false; }
	    with invincibility { visible = false; }
    
	    // Object
	    debug_object = ds_list_find_value(debug_list, debug_pos);
	    if (debug_object <> noone) and not is_undefined(debug_object) { debug_sprite = object_get_sprite(debug_object); } else { debug_sprite = -1; }
    
	    // Angle
	    switch debug_object
	    {
	        case objSpringWhite: 
	        case objSpringWhiteDiagonal: 
	        case objSpringPurple:
	        case objSpringPurpleDiagonal:
	        case objSpringRed: 
	        case objSpringRedDiagonal:
	        case objSpringOrange: 
	        case objSpringOrangeDiagonal:
	        case objSpringYellow:
	        case objSpringYellowDiagonal: 
	        case objSpringGreen: 
	        case objSpringGreenDiagonal:
	        case objSpringBlue: 
	        case objSpringBlueDiagonal:
	        case objSpike:
	        case objSpikeSonic1:
	        {
	            debug_angle = debug_type * 90;
	            break;
	        }
	    }
	}



}
