/// @description  Update position

event_inherited();

// adjust sparks
var offset = 0;
var size = ds_list_size(player_id.xtable);
for (var i = 0; i < 4; i += 1)
{
    offset = size - 1 - ((i + 1) * spacing);
    if (offset < 0) { offset += size; }
    px[i] = floor(ds_list_find_value(player_id.xtable, offset));
    py[i] = floor(ds_list_find_value(player_id.ytable, offset));
	//part_particles_create(objGame.particles, px[i], py[i], objResources.part_inv_sparkle, 1);
}

// adjust angles
angle = angle_wrap(angle - 22.5);
angle2 = angle_wrap(angle2 - 11.25);

// animation
image_index = objScreen.image_index div 4;
flip = not flip;