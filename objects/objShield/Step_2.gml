/// @description  Set offset
event_inherited();

// get angle
angle = player_id.angle
if (player_id.floor_id) { if (player_id.floor_id.surface_angle & ANGLEFLAG_COLLISION) and not (player_id.floor_id.surface_angle & ANGLEFLAG_ROTATE) { angle = gravity_angle(); } }

switch player_id.animation_current
{
case "spin":
    break;

default:
    x -= (sine[angle] * 4);
    y -= (cosine[angle] * 4);
}

// Facing
facing = player_id.facing;

