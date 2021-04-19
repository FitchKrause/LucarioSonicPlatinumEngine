/// @description  Init
var relative_x = (room_width - 512) / (room_width - objScreen.width);
var relative_y = (room_height - 256) / (room_height - objScreen.height);

// defaults

// Sky
parallax_create(1, false, sprEmeraldHillParallax1, 0, 0, 0, sprite_get_width(sprEmeraldHillParallax1), sprite_get_height(sprEmeraldHillParallax1), 0, 0, relative_x, relative_y, 0, 0, 0, 0);

// Reflection
parallax_create(1, false, sprEmeraldHillParallax2, 8, 0, 0, sprite_get_width(sprEmeraldHillParallax2), sprite_get_height(sprEmeraldHillParallax2), 0, 0, relative_x, relative_y, 0, sprite_get_height(sprEmeraldHillParallax1), 0, 0);

// Floor Layer 1
parallax_create(1, false, sprEmeraldHillParallax3, 0, 0, 0, sprite_get_width(sprEmeraldHillParallax3), 16, 0, 0, 0.84, relative_y, 0, (sprite_get_height(sprEmeraldHillParallax1) + sprite_get_height(sprEmeraldHillParallax2)), 0, 0);

// Floor Layer 2
parallax_create(1, false, sprEmeraldHillParallax4, 0, 0, 0, sprite_get_width(sprEmeraldHillParallax4), 16, 0, 0, 0.74, relative_y, 0, (sprite_get_height(sprEmeraldHillParallax1) + sprite_get_height(sprEmeraldHillParallax2) + sprite_get_height(sprEmeraldHillParallax3)), 0, 0);

// 2.5D Floor layers
parallax_create(1, false, sprEmeraldHillParallax5, 0, 0, 0, sprite_get_width(sprEmeraldHillParallax5), 16, 0, 0, 0.64, relative_y, 0, (sprite_get_height(sprEmeraldHillParallax1) + sprite_get_height(sprEmeraldHillParallax2) + sprite_get_height(sprEmeraldHillParallax3) + sprite_get_height(sprEmeraldHillParallax4)), 0, 0);
parallax_create(1, false, sprEmeraldHillParallax5, 0, 0, 16, sprite_get_width(sprEmeraldHillParallax5), 16, 0, 0, 0.54, relative_y, 0, (sprite_get_height(sprEmeraldHillParallax1) + sprite_get_height(sprEmeraldHillParallax2) + sprite_get_height(sprEmeraldHillParallax3) + sprite_get_height(sprEmeraldHillParallax4))+ 16, 0, 0);
parallax_create(1, false, sprEmeraldHillParallax5, 0, 0, 32, sprite_get_width(sprEmeraldHillParallax5), 16, 0, 0, 0.44, relative_y, 0, (sprite_get_height(sprEmeraldHillParallax1) + sprite_get_height(sprEmeraldHillParallax2) + sprite_get_height(sprEmeraldHillParallax3) + sprite_get_height(sprEmeraldHillParallax4))+ 32, 0, 0);
parallax_create(1, false, sprEmeraldHillParallax5, 0, 0, 48, sprite_get_width(sprEmeraldHillParallax5), 16, 0, 0, 0.34, relative_y, 0, (sprite_get_height(sprEmeraldHillParallax1) + sprite_get_height(sprEmeraldHillParallax2) + sprite_get_height(sprEmeraldHillParallax3) + sprite_get_height(sprEmeraldHillParallax4)) + 48, 0, 0);
parallax_create(1, false, sprEmeraldHillParallax5, 0, 0, 64, sprite_get_width(sprEmeraldHillParallax5), 16, 0, 0, 0.24, relative_y, 0, (sprite_get_height(sprEmeraldHillParallax1) + sprite_get_height(sprEmeraldHillParallax2) + sprite_get_height(sprEmeraldHillParallax3) + sprite_get_height(sprEmeraldHillParallax4)) + 64, 0, 0);
parallax_create(1, false, sprEmeraldHillParallax5, 0, 0, 80, sprite_get_width(sprEmeraldHillParallax5), 16, 0, 0, 0.14, relative_y, 0, (sprite_get_height(sprEmeraldHillParallax1) + sprite_get_height(sprEmeraldHillParallax2) + sprite_get_height(sprEmeraldHillParallax3) + sprite_get_height(sprEmeraldHillParallax4)) + 80, 0, 0);
parallax_create(1, false, sprEmeraldHillParallax5, 0, 0, 96, sprite_get_width(sprEmeraldHillParallax5), 16, 0, 0, 0.04, relative_y, 0, (sprite_get_height(sprEmeraldHillParallax1) + sprite_get_height(sprEmeraldHillParallax2) + sprite_get_height(sprEmeraldHillParallax3) + sprite_get_height(sprEmeraldHillParallax4)) + 96, 0, 0);

// finish
instance_destroy();