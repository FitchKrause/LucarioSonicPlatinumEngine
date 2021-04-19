/// @description  Movement

// Moving
if (moving)
{
    if (moving_horizontal <> 0)
    {
        x = floor(xstart + cos(objScreen.image_index * 0.03125) * moving_horizontal)
    }
    
    if (moving_vertical <> 0)
    {
        y = floor(ystart + cos(objScreen.image_index * 0.03125) * moving_vertical);
    }
}

/// Insert title here
/*
for (i = 0; i < spring_count; i += 1)
{
    var a = -k * springs[i] - d * springs_velocity[i];
    springs_velocity[i] += a;
    springs[i] += springs_velocity[i];
}

for (i = 0; i < spring_count; i += 1)
{
    if (i > 0)
    {
        spring_delta_l[i] = spread * (springs[i] - springs[i - 1]);
        springs_velocity[i + 1] += spring_delta_l[i];
    }
    
    if (i < spring_count)
    {
        spring_delta_r[i] = spread * (springs[i] - springs[i + 1]);
        springs_velocity[i - 1] += spring_delta_r[i];
    }
    
    for (i = 0; i < spring_count; i += 1)
    {
        if (i < 0) { springs[i - 1] += spring_delta_l[i]; };
        if (i < spring_count) { springs[i + 1] += spring_delta_r[i]; };
    }
}

*/