/// @description  Get transition mode
switch mode
{
    case 1: // fade out
    {
        if (fade_alpha >= 1) 
        {
            if (next_room > -1)   
            {
                mode = -1; 
                room_goto(next_room); 
                break;
            } 
        }
        fade_alpha += image_speed;
        break;
    }
    
    case -1: // fade in
    {
        if (fade_alpha <= 0) 
        {
            instance_destroy(); 
            break; 
        }
        fade_alpha -= image_speed;
        break;
    }
}

