/// @description  player_set_scale(scale)
/// @param scale
function player_set_scale()
{
	offset_size = clamp_value(argument[0], 0.01, 10);
	player_set_hitbox(offset_x, offset_y, offset_wall);
}