/// @description  Sparkle
if (not animation_running) or (objScreen.image_index mod 11) { exit; }
part_particles_create(objGame.particles, x + ox[offset], y + oy[offset], objResources.part_sparkle, 1);
offset = (offset + 1) mod 7;

