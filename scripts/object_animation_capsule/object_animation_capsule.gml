/// @description  object_animation_capsule(tick)
/// @param tick
function object_animation_capsule() {

	switch argument[0]
	{    
	    case 1:
	    {
	        // Throw away lock
	        image_index = 1;
	        instance_create_depth(x, y - 39, 1, objCapsuleLock);
	        break;
	    }
    
	    case 2:
	    {
	        part_particles_create(objGame.particles, x, y - 39, objResources.part_explosion, 1);
	        audio_play_stereo(sndPop, x, y, false, 0);
	        break;
	    }
    
	    case 32: { for (var i = 0; i < 8; i += 1) { with instance_create_depth(x - 28 + (7 * i), y - 16, 2, objZone.animal[irandom_range(0, (array_length(objZone.animal) - 1))]) { timer = 154 - (8 * i); } } break; }
	    case 35: { image_index = 2; break; }
	    case 39: { image_index = 3; break; }
	    case 43: { image_index = 4; break; }
    
		case 38:
		case 46:
	    case 54:
		case 62:
		case 78:
	    case 86:
		case 94:
		case 110:
		case 118:
	    case 126:
		case 142:
		case 150:
		case 158:
		case 174:
		case 182:
		case 190:
	    case 206:
		case 214:
	    {
	        with instance_create_depth(x - 21 + (7 * irandom(6)), y - 16, 2, objZone.animal[irandom_range(0, (array_length(objZone.animal) - 1))]) { timer = 12; }
			if (argument[0] == 214) { state = 1; }
	        break;
	    }
	}



}
