/// @description  Animation

if (frame_speed > 0)
{
    if (image_index == size)
    {
        frame_speed = 0;
    }
}

// Frame speed
if not (image_index == size)
{
    image_index += frame_speed * global.tempo;
}