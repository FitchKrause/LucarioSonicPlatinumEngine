/// @description  Scaling correction

// correct x-scaling
if (image_xscale < 0)
{
    // calculate distances bounding box edges are from sprite border
    var l = sprite_get_bbox_left(sprite_index);
    var r = sprite_get_width(sprite_index) - (1) - sprite_get_bbox_right(sprite_index);
    switch sign(l - r) // compensate for stretching
    {
        case 1: // leftward
        {
            true_left += 1 + (l - r);
            true_right += (l - r) - 1;
            break;
        }
        
        case -1: // rightward
        {
            true_left -= (r - l) - 1;
            true_right -= (r - l) + 1;
        }
        
        default: // symmetrical
        {
            true_left += 1;
            true_right -= 1;
        }
    }
}

// correct y-scaling
if (image_yscale < 0)
{
    // calculate distances bounding box edges are from sprite border
    var t = sprite_get_bbox_top(sprite_index);
    var b = sprite_get_height(sprite_index) - (1) - sprite_get_bbox_bottom(sprite_index);
    switch sign(t - b) // compensate for stretching
    {
        case 1: // upward
        {
            true_top += 1 + (t - b);
            true_bottom += (t - b) - 1;
            break;
        }
    
        case -1: // downward
        {
            true_top -= (b - t) - 1;
            true_bottom -= (b - t) + 1;
            break;
        }
    
        default: // symmetrical
        {
            true_top += 1;
            true_bottom -= 1;
        }
    }
}