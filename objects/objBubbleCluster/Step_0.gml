/// @description  Spawn bubbles

if ((objScreen.image_index mod 240) == 0)
{
    var type;
    
    // Get a pattern different from the last
    do
    {
        type = irandom(3);
    }
    until (type <> pattern);
    pattern = type;
    
    // Set bubble amount based on pattern
    if (pattern == 1)
    {
        count = 3;
    }
    else if (pattern == 2)
    {
        count = choose(5, 6);
    }
    
    if (pattern == 3)
    {
        count = 2;
    }
    
    // timer
    timer = 1;
    
}

