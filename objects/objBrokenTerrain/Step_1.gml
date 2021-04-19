/// @description  Timer

if (timer)
{
    timer -= 1;
    if (not timer)
    {
        // Set gravity and mask
        gravity_enabled = true;
        mask_index = sprMaskNull;
    }
}

