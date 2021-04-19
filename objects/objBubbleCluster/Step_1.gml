/// @description  Start patterns

if (timer)
{
    timer -= 1;
    
    if (not timer)
    {
        // Reset timer
        timer = -1;
        
        // Spawn patterns
        switch (pattern)
        {
            // Spawn pattern 1
            case 0:
            {
                with instance_create_depth(x, y - 5, -1, objBubble)
                {
                    size = 5;
                    offset = choose(0, 180);
                }
                break;
            }
            
            // Spawn pattern 2
            case 1:
            {
                with instance_create_depth(x, y - 5, -1, objBubble)
                {
                    if (other.count == 2)
                    {
                        size = 5;
                    }
                    else
                    {
                        size = choose(1, 2);
                    }
                    
                    offset = choose(0, 180);
                }
                
                // Continue spawning
                count -= 1;
                if count
                {
                    timer = 16;
                }
                
                break;
            }
            
            // Spawn pattern 3
            case 2:
            {
                with instance_create_depth(x, y - 5, -1, objBubble)
                {
                    if (other.count == 3)
                    {
                        size = 5;
                    }
                    else
                    {
                        size = choose(1, 2);
                    }
                    
                    offset = choose(0, 180);
                }
                
                // Continue spawning
                count -= 1;
                if count
                {
                    timer = 16;
                }
                
                break;
            }
            
            // Spawn pattern 4
            case 3:
            {
                with instance_create_depth(x, y - 5, -1, objBubble)
                {
                    image_index = 1;
                    size = 3 + other.count;
                    offset = choose(0, 180);
                }
                
                // continue spawning
                count -= 1;
                if count
                {
                    timer = 16;
                }
                
                break;
            }
        }
    }
}

