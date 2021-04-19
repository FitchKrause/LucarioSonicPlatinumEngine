/// @description  Draw invincibility sparks

var c = (cosine[angle2] * 16) * player_id.offset_size;
var s = (sine[angle2] * 16) * player_id.offset_size;

// 5th circle
draw_sprite_ext(sprMutekiSpark4, image_index, px[3] + s, py[3] - c, player_id.offset_size, player_id.offset_size, player_id.offset_size, c_white, 1);
draw_sprite_ext(sprMutekiSpark4, image_index + 1, px[3] - s, py[3] + c, player_id.offset_size, player_id.offset_size, player_id.offset_size, c_white, 1);

// 4th circle
draw_sprite_ext(sprMutekiSpark3, image_index, px[2] + c, py[2] - s, player_id.offset_size, player_id.offset_size, player_id.offset_size, c_white, 1);
draw_sprite_ext(sprMutekiSpark3, image_index + 2, px[2] - c, py[2] + s, player_id.offset_size, player_id.offset_size, player_id.offset_size, c_white, 1);

// 3rd circle
draw_sprite_ext(sprMutekiSpark2, image_index, px[1] - s, py[1] - c, player_id.offset_size, player_id.offset_size, player_id.offset_size, c_white, 1);
draw_sprite_ext(sprMutekiSpark2, image_index + 3, px[1] + s, py[1] + c, player_id.offset_size, player_id.offset_size, player_id.offset_size, c_white, 1);

// 2nd circle
draw_sprite_ext(sprMutekiSpark1, image_index, px[0] + c, py[0] - s, player_id.offset_size, player_id.offset_size, player_id.offset_size, c_white, 1);
draw_sprite_ext(sprMutekiSpark1, image_index + 4, px[0] - c, py[0] + s, player_id.offset_size, player_id.offset_size, player_id.offset_size, c_white, 1);

// 1st circle
c = (cosine[angle2] * 16) * player_id.offset_size;
s = (sine[angle2] * 16) * player_id.offset_size;
if flip
{
    draw_sprite_ext(sprMutekiSpark1, image_index, x + c, y - s, player_id.offset_size, player_id.offset_size, player_id.offset_size, c_white, 1);
    draw_sprite_ext(sprMutekiSpark1, image_index + 5, x - c, y + s, player_id.offset_size, player_id.offset_size, player_id.offset_size, c_white, 1);
}
else
{
    draw_sprite_ext(sprMutekiSpark1, image_index, x + s, y + c, player_id.offset_size, player_id.offset_size, player_id.offset_size, c_white, 1);
    draw_sprite_ext(sprMutekiSpark1, image_index + 5, x - s, y - c, player_id.offset_size, player_id.offset_size, player_id.offset_size, c_white, 1);
}

// Spark
//draw_sprite_ext(sprInvSparkle, image_index, )