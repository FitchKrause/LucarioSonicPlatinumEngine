/// @description  Ripple reflection

for (var i = 0; i < scanlines - 1; i += 1) { scan[i].xoffset = cos(objScreen.image_index / 13.2 + i * 0.87) * 3; }