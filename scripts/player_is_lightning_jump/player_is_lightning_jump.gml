/// @description  player_is_lightning_jump()
function player_is_lightning_jump() {

	// animate
	animation_new = "spin";
	animation_speed = (1 / max(5 - abs(xspeed), 1));
	image_angle = 0;

	// states and flags
	state = player_is_falling;
	spinning = true;
	jumping = false;
	jump_action = false;

	// movement and collision
	yspeed = -5.5;

	// set air state
	player_in_air();

	// effects
	for (var i = 0; i < 4; i += 1)
	{
	    // set direction
	    switch i
	    {
	        case 0:
	        {
	            part_type_speed(objResources.part_lspark, 2, 2, 0, 0);
	            part_type_direction(objResources.part_lspark, 180, 180, 0, 0);
	            break;
	        }
            
	        case 1:
	        {
	            part_type_speed(objResources.part_lspark, 2, 2, 0, 0);
	            part_type_direction(objResources.part_lspark, 0, 0, 0, 0);
	            break;
	        }
            
	        case 2:
	        {
	            part_type_speed(objResources.part_lspark, 2.8, 2.8, 0, 0);
	            part_type_direction(objResources.part_lspark, 225, 225, 0, 0);
	            break;
	        }    
        
	        case 3:
	        {
	            part_type_speed(objResources.part_lspark, 2.8, 2.8, 0, 0);
	            part_type_direction(objResources.part_lspark, 315, 315, 0, 0);
	            break;
	        }
	    }

	    // create spark
	    part_particles_create(objGame.particles, x, y, objResources.part_lspark, 1);
	}

	// sound
	audio_play_emitter(audio_emitter, sndShieldLightningAction, false, 0);




}
