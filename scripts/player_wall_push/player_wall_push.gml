function player_wall_push(argument0, argument1)
{
	// player_wall_push(local_id, direction)
	/*
	Pushes the given local in the given direction if applicable.

	> local_id: instance id to evaluate
	> direction: sign of horizontal movement (-1 or 1)

	< return value: n/a.
	*/

	// animate
	animation_new = "push";
	animation_speed = 1;

	// abort if ...
	if not argument0.can_push or ((argument0.y - argument0.yprevious) <> 0) { return false; } // not movable or moving vertically
	with argument0  { if place_meeting(x + cosine[other.angle] * argument1, y - sine[other.angle] * argument1, objColliderHard) { return false; } } // against a wall

	// push sound
	if not audio_is_playing(sndPush) { audio_play_stereo(sndPush, argument0.x, argument0.y, false, 0); }

	// push solid and adjust player
	argument0.x += (cosine[angle] * (argument1 * argument0.push_speed)) * global.tempo;
	argument0.y -= (sine[angle] * (argument1 * argument0.push_speed)) * global.tempo;
	x += (cosine[angle] * (argument1 * argument0.push_speed)) * global.tempo;
	y -= (sine[angle] * (argument1 * argument0.push_speed)) * global.tempo;
}