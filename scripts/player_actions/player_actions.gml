/// @description  player_actions(actions, setVisible)
/// @param actions
/// @param  setVisible
function player_actions()
{
	/*
	Activate or deactivate actions of the player.
	(Steps Events and Animations).

	> actions: Activate actions or not of the player.
	  setVisible: Set visible or not the player.

	< return value: n/a
	*/

	// Flags
	var allflags = PLAYERSTATE_NOINPUT|PLAYERSTATE_NOJUMPACTION|PLAYERSTATE_NOROTATE|PLAYERSTATE_NOSTATE|PLAYERSTATE_NOANIMATE|PLAYERSTATE_NOSPINDASH|PLAYERSTATE_NOPEELOUT|PLAYERSTATE_NOROLLING
	toggleflags &= ~(allflags);
	if not argument[0] { toggleflags |= allflags; }

	// Set visible
	toggleflags &= ~(PLAYERSTATE_NOUPDATEVISIBLE);
	if not argument[1] { toggleflags |= PLAYERSTATE_NOUPDATEVISIBLE; }
	visible = argument[1];
}