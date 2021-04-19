/// @description  Skip game over

if (not offset) and (timer) and (not forced)
{
    if (input_check_pressed(0, INPUT_ACTION))
    {
        timer = -1;
        event_user(0);
    }
}

