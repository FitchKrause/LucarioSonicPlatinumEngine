/// @description  player_change_character(character)
/// @param character
function player_change_character()
{
	/*
	Changes the player instance into the given character.
	(Does nothing if the player instance is already that character)

	> character: character id to change into

	< return value: n/a
	*/
	
	if (character_id == argument[0]) { return false; }
	character_id = argument[0];
	switch character_id
	{
	    case CHARACTER_SONIC: { animation_table = super_form ? objResources.anim_supersonic : objResources.anim_sonic; break; }
	    case CHARACTER_TAILS:
	    {
	        animation_table = objResources.anim_tails;
	        tails_effect = instance_create_depth(x, y, depth - 1, objTailsEffect);
	        tails_effect.player_id = id;
	        break;
	    }
    
	    case CHARACTER_KNUCKLES: { animation_table = objResources.anim_knuckles; break; }
	    default: { animation_table = -1; break; }
	}
	animation_running = abs(animation_table > -1);
	player_reset_palette();

	// reset bounding box
	offset_x = 8 * offset_size;
	offset_y = 14 * offset_size;
	offset_wall = 10 * offset_size;
	segment_width = offset_x; //* 0.5;
	segment_height = offset_y; //* 0.5;
}