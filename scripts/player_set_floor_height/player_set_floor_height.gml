function player_set_floor_height()
{
	// floor height
	repeat (offset_y * 2)
	{
		if collision_box(offset_x, offset_y, (mask_rotation mod 180), floor_id)
		{
			x -= sine[mask_rotation];
			y -= cosine[mask_rotation];
		}
		else { break; }
	}
	repeat (offset_y * 2)
	{
		if not collision_ray(offset_x, offset_y + 1, mask_rotation, floor_id)
		{
			x += sine[mask_rotation];
			y += cosine[mask_rotation];
		} else { break; }
	}
}