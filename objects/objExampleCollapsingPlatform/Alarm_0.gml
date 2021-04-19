/// @description  Generate pieces
var j, i;

// sound
audio_play_sound_at(sndCollapse, x+sprite_width*0.5, y+sprite_height*0.5, 0, 100, 300, 1, false, 0)

// get bounds
var width = sprite_width div 16;
var height = sprite_height div 16;

// go through rows
for (j=0; j<height; j+=1)
{
    // go through collumns
    for (i=0; i<width; i+=1)
    {
        // create block
        with instance_create_depth(x+i*16, y+j*16, depth, objExampleCollapsingPlatformPiece)
        {
            // set delay on drop
            if image_xscale>0 alarm[0] = ((width-i)*other.ox)+(((height-j)-1)*other.oy); else
            if image_xscale<0 alarm[0] = (i*other.ox)+(((height-j)-1)*other.oy);
        }
    }
}
instance_destroy();