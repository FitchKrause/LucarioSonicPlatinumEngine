/// @description  Release small animal

// explosion
part_particles_create(objGame.particles, x, y, objResources.part_explosion, 1);

// small animal
with instance_create_depth(x, y, 0, objZone.animal[irandom(2)]) alarm[0] = 1;

