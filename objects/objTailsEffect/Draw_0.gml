/// @description  Draw Tails of Tails

var draw_angle = image_angle;
if objData.classic_rotation { draw_angle = round(image_angle / 45) * 45; }

if draw_tail
{
    draw_sprite_ext(sprite_index, image_index, floor(x), floor(y), player_id.offset_size * player_id.facing, player_id.offset_size, draw_angle, image_blend, image_alpha);
}

