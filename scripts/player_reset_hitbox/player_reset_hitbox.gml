/// @description  player_reset_hitbox()
function player_reset_hitbox()
{
	offset_x = 8 * offset_size;
	offset_y = 14 * offset_size - (2 * sign(character_id == CHARACTER_TAILS));
	offset_wall = 10 * offset_size;
}