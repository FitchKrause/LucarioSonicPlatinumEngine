/// @desc Calculate height

if (image_xscale >= 1)
{
    // set defaults
    ox[0] = -1;
    ox[1] = -1;
    
    // get bridge position
    with objPlayer
    {
        if (floor_id == other.id)
		{
			other.ox[player_id] = median(x - other.bbox_left, 0, other.sprite_width) / other.sprite_width;
		}
    }
    
    // determine which is best
    if (ox[0] > -1) and (ox[1] > -1) { ratio = mean(ox[0], ox[1]); }
    else if (ox[0] > -1) { ratio = ox[0]; } else if (ox[1] > -1) { ratio = ox[1]; } else { ratio = 0; }
    
    // update height
    tension = floor(max_tension * sine[floor(ratio * 180)]);
    tension_interpolated = floor(lerp(tension_interpolated, tension, 0.6));
    y = floor(ystart + tension_interpolated);
}