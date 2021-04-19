/// @description Initialize

scanlines = 11;
var step = 41 / scanlines;
var relative_y = 0.991;

// clouds
parallax_create(1, false, sprAzureLakeParallax, 0, 0, 0, 256, 32, -0.4, 0, 0.85, relative_y, 0, 0, 0, 0);
parallax_create(1, false, sprAzureLakeParallax, 0, 0, 32, 256, 16, -0.3, 0, 0.83, relative_y, 0, 32, 0, 0);
parallax_create(1, false, sprAzureLakeParallax, 0, 0, 48, 256, 16, -0.2, 0, 0.80, relative_y, 0, 48, 0, 0);

// mountains
parallax_create(1, false, sprAzureLakeParallax, 0, 0, 64, 256, 46, 0, 0, 0.74, relative_y, 0, 64, 0, 0);

// forest
parallax_create(1, false, sprAzureLakeParallax, 0, 0, 110, 256, 25, 0, 0, 0.71, relative_y, 0, 110, 0, 0);

// reflection
for (var i = 0; i < scanlines; i += 1) { scan[i] = parallax_create(1, false, sprAzureLakeParallax, 0, 0, 135 + floor(i * step), 256, ceil(step), 0, 0, 0.74, relative_y, 0, 135 + floor(i * step), 0, 0); }

// foreground
for (var i = 0; i < 10; i += 1) { parallax_create(1, false, sprAzureLakeParallax, 0, 0, 176 + i * 8, 256, 8, ((1 + i) / 15) * -1.8, 0, 0.5 - ((1 + i) / 15) * 0.5, relative_y, 0, 176 + i * 8, 0, 0); }