/// @description  Destroy

// Start loop
for(i = 0; i < sprite_width; i += block_width)
{
    for (j = 0; j < sprite_height; j += block_height)
    {
        // Create instance
        instance = instance_create_depth(x + i, y + j, depth, objBrokenTerrain);
        with (instance)
        {
            // Region
            xpos = other.i
            ypos = other.j;
            wpos = other.block_width;
            hpos = other.block_height;
            
            // Propeties
            can_collide = false;
            
            // Set sprite
            sprite_index = other.sprite_index;
            
            // Vertical
            if (ypos == 0) { yspeed = -4; }
            else if (ypos == (sprite_height / 2)) { yspeed = -2; }
             
            // Horizontal   
            if (xpos == 0) { xspeed = -1; }
            else if (xpos == (sprite_width / 2)) { xspeed = 2; }
        }
    }
}

// Sound
audio_play_stereo(sndCollapse, floor(x), floor(y), false, 0);

