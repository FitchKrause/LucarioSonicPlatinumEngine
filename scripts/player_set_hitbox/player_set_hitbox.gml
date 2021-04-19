/// @description  player_set_hitbox(offset_x, offset_y, offset_wall)
/// @param offset_x
/// @param offset_y
/// @param offset_wall
function player_set_hitbox()
{
	offset_x = argument[0] * offset_size;
	offset_y = argument[1] * offset_size - (2 * sign(character_id == CHARACTER_TAILS));
	offset_wall = argument[2] * offset_size;
}