/// @description  Variables

event_inherited();

depth = -128;
image_speed = 0

reaction_script = player_reaction_water;

// Render
water_index = sprWater;
horizon = false;
horizon_index = sprWaterHorizon;
flash = false;

// Propeties
can_run = false;

// Motion
moving = false;
moving_horizontal = 0;
moving_vertical = 0;

// ...
//transparency_buffer_height = 32;
/*
k = 0.035;
d = 0.025;
spread = 0.25;

// Spring
spring_count = ceil(sprite_width / 4);
springs[spring_count] = 0;
springs_velocity[spring_count] = 0;
spring_delta_r[spring_count] = 0;
spring_delta_l[spring_count] = 0;

