/// @description  Release powerup

// broken stand
with instance_create_depth(x, y, depth, objMonitorBroken) { image_yscale = other.image_yscale; }

// explosion
part_particles_create(objGame.particles, x, y, objResources.part_explosion, 1);

