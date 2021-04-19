/// @description  Create destroyed platform

// Setup
timer = 1;
height = (ceil(sprite_height / block_height) * block_height);
block_height2 = block_height - (height - sprite_height);

// Reversed
if (image_xscale == -1)
{
    // Start loop
    for (i = block_width; i <= abs(sprite_width); i+= block_width)
    {
        for (j = height - block_height; j >= 0; j -= block_height)
        {            
            // Create instance
            instance = instance_create_depth(x - abs(sprite_width) + i, (y - sprite_yoffset) + j, 0, objBrokenTerrain);
            with (instance)
            {
                // Sprite region
                xpos = abs(other.sprite_width) - other.i;
                ypos = other.j;
                wpos = other.block_width;
                if (other.j == (other.height - other.block_height))
                {
                    hpos = other.block_height2;
                }
                else
                {
                    hpos = other.block_height;
                }
                
                // Propeties
                can_collide = true;
                
                // Set sprite
                sprite_index = other.sprite_index;                         
                image_xscale = other.image_xscale;
                
                // Movement
                xspeed = 0;
                yspeed = 0;
                gravity_enabled = false;
                
                // Sprite duplicate
                if(sprite_exists(other.mask_index))
                {
                    sprite_mask = sprite_duplicate(other.mask_index)
                }
                else
                {
                    sprite_mask = sprite_duplicate(other.sprite_index)
                }
                sprite_collision_mask(sprite_mask, true, 2, xpos, (xpos + wpos), ypos, (ypos + hpos), 0, 0);
                mask_index = sprite_mask;
            }
            
            // Start falling
            k = i + block_width;
            instance.timer = timer;
            timer += 1;
        }
    }
}

// Normal
else if (image_xscale == 1)
{
    // Start loop
    for (i = (sprite_width - block_width); i >= 0; i -= block_width)
    {
        for (j = (height - block_height); j >= 0; j -= block_height)
        {            
            // Create instance
            instance = instance_create_depth(x + i, (y - sprite_yoffset) + j, depth, objBrokenTerrain);
            with (instance)
            {
                // Sprite region
                xpos = other.i
                ypos = other.j;
                wpos = other.block_width;
                if (other.j == (other.height - other.block_height))
                {
                    hpos = other.block_height2;
                }
                else
                {
                    hpos = other.block_height;
                }
                
                // Propeties
                can_collide = true;

                // Set sprite
                sprite_index = other.sprite_index;                         
                image_xscale = other.image_xscale;
                
                // Movement
                xspeed = 0;
                yspeed = 0;
                gravity_enabled = false;
                
                // Sprite duplicate
                if (sprite_exists(other.mask_index))
                {
                    sprite_mask = sprite_duplicate(other.mask_index)
                }
                else
                {
                    sprite_mask = sprite_duplicate(other.sprite_index)
                }
                sprite_collision_mask(sprite_mask, true, 2, xpos, ypos, (xpos + wpos), (ypos + hpos), 0, 0);
                mask_index = sprite_mask;
            }

            // Start falling
            k = (abs(sprite_width) - i) + block_width;               
            instance.timer = timer;
            timer += 1;
        }
    }
}

// Sound
audio_play_stereo(sndCollapse, x, y, false, 0);

