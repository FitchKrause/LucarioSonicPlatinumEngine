/// @description  Swing platform

// calculate offset
offset = angle_wrap(270 + cosine[objScreen.image_index mod 360] * range);

// apply offset
x = xstart + floor(cosine[offset] * height);
y = ystart - floor(sine[offset] * height);

