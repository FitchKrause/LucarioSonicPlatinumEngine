function player_is_clambering(argument0) {
	// player_is_clambering()
	switch argument0
	{
	case -1: // starting
	    // animate
	    animation_new = "climb_end";
	    animation_speed = 1;

	    // states and flags
	    state = player_is_clambering;

	    // movement and collision
	    yspeed = 0;
	    x += (cosine[angle]*3*facing)+(sine[angle]*9);
	    y += (-sine[angle]*3*facing)+(cosine[angle]*9);
	    break;

	default: // main
	    // adjust position
	    switch animation_tick
	    {
	    case 8:
	        x += (cosine[angle]*8*facing)-(sine[angle]*11);
	        y += (-sine[angle]*8*facing)-(cosine[angle]*11);
	        break;
	    case 14:
	        x += (-sine[angle]*13);
	        y += (-cosine[angle]*13);
	        break;
	    case 20:
	        return player_is_standing(-1);
	        break;
	    }
	}



}
