/// @description  Construct slants

event_inherited();

// get non-scaled dimensions
var width = true_right - true_left;
var height = true_bottom - true_top;
var average = (width + height) * 0.5;

// divide boundary into sections
var division = ceil(log10(average / 16) / log10(2));
division += division - 1;
var scale_x = width / division;
var scale_y = height / division;

// initialize
var previous_x, previous_y, m1, m2, ox, oy;
var intersect_x = 0;
var intersect_y = 0;

// create curvature out of slants
for (var i = 0; i < division; i += 1)
{
    // save previous values
    previous_x = intersect_x;
    previous_y = intersect_y;

    // get next intersection
    m1 = (division - i) / (i + 1);
    m2 = (division - (i + 1)) / (i + 2);
    intersect_x = (-i + (i + 1)) / (m1 - m2);
    intersect_y = (m1 * intersect_x) + i;
    intersect_x *= scale_x;
    intersect_y *= scale_y;

    // get offset for placement
    if image_xscale > 0 ox = bbox_right - previous_x; else ox = bbox_left + previous_x;
    if image_yscale < 0 oy = bbox_bottom - previous_y; else oy = bbox_top + previous_y;
    
    // place slant
    with instance_create_depth(ox, oy, depth, objSlant)
    {
        // scale between intersections
        image_xscale = (intersect_x - previous_x) * 0.03125 * sign(other.image_xscale);
        image_yscale = (intersect_y - previous_y) * 0.03125 * sign(other.image_yscale);
        x -= sprite_width; // space correction

        // copy attributes
        zlayer = other.zlayer;
        angle = other.angle;
        flat_surface = other.flat_surface;
        surface_angle = other.surface_angle;
        top_only = other.top_only;
        launch = other.launch;
        crush = other.crush;
        can_push = other.can_push;
        can_climb = other.can_climb;
    }
}

instance_destroy();

