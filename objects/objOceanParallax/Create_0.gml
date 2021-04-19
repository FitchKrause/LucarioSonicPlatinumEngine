event_inherited();
/// Initialize

// defaults
relative_y = 0.8;
absolute_y = room_height - (room_height * relative_y);
scale_limit = 3;

// ocean
for (var i = 0; i < 40; i += 1)
{
    strip[i] = parallax_create(1, false, sprOceanParallax, 0, 0, i * 8, 768, 8, -(0.16 * i) mod 384, 0, 0.85, relative_y, 0, absolute_y + (i * 8), 0, 0);
    strip[i].visible = false;
    strip[i].image_alpha = 0.5;
}

// horizon
horizon = parallax_create(1, true, sprWaterHorizon, 0, 0, 0, 32, 15, 0, 0, 0, 0, 0, objWater.y - (sprite_get_height(sprWaterHorizon) / 2), 0, 0);
horizon.depth = objWater.depth - 1;

