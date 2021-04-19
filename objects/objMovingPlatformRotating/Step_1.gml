/// @description  Swing platform

// apply offset
x = xstart + floor(cosine[objScreen.image_index mod 360] * height);
y = ystart - floor(sine[objScreen.image_index mod 360] * height);

