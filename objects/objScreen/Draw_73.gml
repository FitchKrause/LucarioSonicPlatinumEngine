/// @description  Splitscreen
if splitscreen_on
{
    if not surface_exists(view[0]) { view[0] = surface_create(width, height); }
    if not surface_exists(view[1]) { view[1] = surface_create(width, height); }
	switch view_current
	{
	    case 0:
		case 1:
		{
			if surface_exists(view[view_current])
		    {
		        surface_set_target(view[view_current]);
		        surface_reset_target();
		        surface_copy(view[view_current], 0, 0, rendering_game_id);
		    }
			break;
		}
		
		case 2:
		{
			draw_surface_part_ext(view[0], 0, ((height / 2) / 2), width, height - ((height / 2) / 2), 0, 0, 0.5, 0.5, c_white, 1);
			draw_surface_part_ext(view[1], 0, ((height / 2) / 2), width, height - ((height / 2) / 2), 0, ((height / 2) / 2), 0.5, 0.5, c_white, 1);
			break;
		}
	}
}