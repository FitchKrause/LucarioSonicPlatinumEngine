/// @description  Move backlayer

event_inherited();

with shield_backlayer
{
    x = floor(other.player_id.x);
    y = floor(other.player_id.y);
    visible = other.visible - (other.animation_script == player_animation_shield_fire_action);
}

