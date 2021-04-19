/// @description  Scale water strips

// get scale based on offset
var offset = floor(camera_get_view_y(view_camera[view_current]) * relative_y) + absolute_y;
var scale = median((objWater.y - offset) * 0.00625, -scale_limit, scale_limit);

// apply scale
for (var i = 0; i < 20; i++)
{
    with strip[i] 
    {
        image_yscale = scale;
        absolute_y = other.absolute_y + (i * 8) * scale;
        event_perform(ev_draw, 0);
    }
}

