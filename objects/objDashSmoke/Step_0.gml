/// @description Check player's animation

if player_id
{
	if (player_id.state <> player_is_spindashing) and (player_id.state <> player_is_peelouting)
	{
		instance_destroy();
	}
}