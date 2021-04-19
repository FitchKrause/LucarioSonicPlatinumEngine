/// @description  Wait for animals to leave
if (state == 1)
{ 
    with instance_create_depth(0, 0, -1024, objScoreCard) { move_player = false; }
    state = 0;
}

