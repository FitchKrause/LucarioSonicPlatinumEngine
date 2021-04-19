/// @description  draw_sprite_flip_ext(sprite,subimg,x,y,xscale,yscale,rot,color,alpha,fliph,flipv)
/// @param sprite
/// @param subimg
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param rot
/// @param color
/// @param alpha
/// @param fliph
/// @param flipv
function draw_sprite_flip_ext() {
	//
	//  Draws a sprite in the same manner as draw_sprite_ext() and
	//  can also flip the sprite horizontally and/or vertically.
	//  When flipped, the sprite will be drawn within its normal 
	//  bounding box rather than being flipped about its origin.
	//
	//      fliph       true to flip horizontally
	//      flipv       true to flip vertically
	//
	/// GMLscripts.com/license
	{
	    var sprite, subimg, posx, posy, xscale, yscale, rot, color, alpha, fliph, flipv;
    
	    sprite = argument[0];
	    subimg = argument[1];
	    posx   = argument[2];
	    posy   = argument[3];
	    xscale = argument[4];
	    yscale = argument[5];
	    rot    = argument[6];
	    color  = argument[7];
	    alpha  = argument[8];
	    fliph  = argument[9];
	    flipv  = argument[10];

	    if (fliph)
	    {
	        posx  = 2 * (sprite_get_width(sprite) - sprite_get_xoffset(sprite));
	        posx  = xscale * (posx - sprite_get_bbox_right(sprite)) + argument[2];
	        xscale *= -1;
	    }
    
	    if (flipv)
	    {
	        posy  = 2 * (sprite_get_height(sprite) - sprite_get_yoffset(sprite));
	        posy  = yscale * (posy - sprite_get_bbox_bottom(sprite)) + argument[3];
	        yscale *= -1;
	    }
    
	    draw_sprite_ext(sprite,subimg,posx,posy,xscale,yscale,rot,color,alpha);
	}



}
