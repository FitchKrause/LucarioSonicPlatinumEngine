/// @description  Draw scorecard

// skip
if (objZone.levelflags & LEVELFLAG_SKIPSCORECARD) exit;

var alpha = objData.hud_translucency;
draw_set_alpha(alpha);

// Oval
if (objZone.levelstyle == STYLETYPE_SONIC1)
{
    draw_sprite_ext(sprTitleCardOval, 0, oval_ox + oval_offset, 142, 2, 2, 0, c_white, alpha);
}

// act
if (not (objZone.levelflags & LEVELFLAG_NOACT)) and (act > -1)
{
    draw_set_valign(fa_bottom);
    draw_set_halign(fa_left);
    draw_set_colour(c_yellow);
    if (objZone.levelstyle == STYLETYPE_SONIC1)
    {
        draw_set_font(objResources.font_title_act);
        draw_text_transformed_colour((act2_ox + act_offset), 202, act, 2, 2, 0, c_white, c_white, c_white, c_white, alpha);
        draw_sprite_ext(sprTitleCardAct, 0, (act2_ox + act_offset) - 12, 202 - 18, 2, 2, 0, c_white, alpha);
    }
    else
    {
        draw_set_font(objResources.font_title_act2);
        draw_text_transformed_colour((act_ox + title_offset2) + 32, 176, act, 2, 2, 0, c_white, c_white, c_white, c_white, alpha);
    }
}

// sprites
if (not (objZone.levelflags & LEVELFLAG_NOBONUES))
{
    if (objZone.levelstyle == STYLETYPE_SONIC1)
    {
        draw_sprite_ext(sprScoreCard, 3, score_ox + score_offset1, 224, 2, 2, 0, c_white, alpha);
        draw_sprite_ext(sprScoreCard, 0, score_ox + score_offset2, 256, 2, 2, 0, c_white, alpha);
        draw_sprite_ext(sprScoreCard, 1, score_ox + score_offset3, 288, 2, 2, 0, c_white, alpha);
        if (perfect_bonus > -1) { draw_sprite_ext(sprScoreCard, 2, score_ox + score_offset4, 320, 2, 2, 0, c_white, alpha); }
    }
    else
    {
        draw_sprite_ext(sprScoreCard2, 0, score_ox + score_offset1, 224, 2, 2, 0, c_white, alpha);
        draw_sprite_ext(sprScoreCard2, 1, score_ox + score_offset2, 256, 2, 2, 0, c_white, alpha);
        if (perfect_bonus > -1) { draw_sprite_ext(sprScoreCard2, 2, score_ox + score_offset3, 288, 2, 2, 0, c_white, alpha); }
        draw_sprite_ext(sprScoreCard2, 3, score_ox + score_offset4, 320, 2, 2, 0, c_white, alpha);
    }
}

// title
draw_set_color(c_white);
draw_set_alpha(alpha);
draw_set_valign(fa_top);
draw_set_halign(fa_center);
if (objZone.levelstyle == STYLETYPE_SONIC1)
{
    draw_set_font(objResources.font_title_text);
    draw_text_transformed((title_ox1 - title_offset1) - 14, 116, name_tag + " Has", 2, 2, 0);
    if (not (objZone.levelflags & LEVELFLAG_NOACT)) and (act > -1)
    {
        draw_text_transformed((title_ox2 - title_offset2), 148, "Passed", 2, 2, 0);
    }
    else if (not (objZone.levelflags & LEVELFLAG_NOZONE))
    {
        draw_text_transformed((title_ox2 - title_offset2), 148, "Passed Zone", 2, 2, 0);
    }
    else
    {
        draw_text_transformed((title_ox2 - title_offset2), 148, "Passed Level", 2, 2, 0);
    }
}
else
{
    draw_set_font(objResources.font_title_text2);
    draw_text_transformed((title_ox1 - title_offset1) - 30, 116, name_tag + " Got", 2, 2, 0);
    if (not (objZone.levelflags & LEVELFLAG_NOACT)) and (act > -1)
    {
        draw_text_transformed((title_ox2 + title_offset2) + 20, 148, "Through Act", 2, 2, 0);
    }
    else if (not (objZone.levelflags & LEVELFLAG_NOZONE))
    {
        draw_text_transformed((title_ox2 + title_offset2) + 10, 148, "Through Zone", 2, 2, 0);
    }
    else
    {
        draw_text_transformed((title_ox2 + title_offset2) + 10, 148, "Through Level", 2, 2, 0);
    }
}

// text bonus
if (not (objZone.levelflags & LEVELFLAG_NOBONUES))
{
    draw_set_halign(fa_right);
    draw_set_color(c_white);
    if (objZone.levelstyle == STYLETYPE_SONIC1)
    {
        draw_set_font(objResources.font_hud_numbers);
        if objData.zeroes_display
        {
            draw_text_transformed_colour(tally_ox + score_offset1, 226, string_real_character(0, 9, 0), 2, 2, 0, c_gray, c_gray, c_gray, c_gray, alpha);
            draw_text_transformed_colour(tally_ox + score_offset2, 258, string_real_character(0, 9, 0), 2, 2, 0, c_gray, c_gray, c_gray, c_gray, alpha);
            draw_text_transformed_colour(tally_ox + score_offset3, 290, string_real_character(0, 9, 0), 2, 2, 0, c_gray, c_gray, c_gray, c_gray, alpha);
            if (perfect_bonus > -1) { draw_text_transformed_colour(tally_ox + score_offset4, 322, string_real_character(0, 9, 0), 2, 2, 0, c_gray, c_gray, c_gray, c_gray, alpha); }
        }
        
        draw_text_transformed(tally_ox + score_offset1, 226, total_bonus, 2, 2, 0);
        draw_text_transformed(tally_ox + score_offset2, 258, time_bonus, 2, 2, 0);
        draw_text_transformed(tally_ox + score_offset3, 290, rings_bonus, 2, 2, 0);    
        if (perfect_bonus > -1) { draw_text_transformed(tally_ox + score_offset4, 322, perfect_bonus, 2, 2, 0); }
    }
    else
    {
        draw_set_font(objResources.font_hud_numbers2);
        if objData.zeroes_display
        {
            draw_text_transformed_colour(tally_ox + score_offset1, 226, string_real_character(0, 9, 0), 2, 2, 0, c_gray, c_gray, c_gray, c_gray, alpha);
            draw_text_transformed_colour(tally_ox + score_offset2, 258, string_real_character(0, 9, 0), 2, 2, 0, c_gray, c_gray, c_gray, c_gray, alpha);
            if (perfect_bonus > -1) { draw_text_transformed_colour(tally_ox + score_offset3, 290, string_real_character(0, 9, 0), 2, 2, 0, c_gray, c_gray, c_gray, c_gray, alpha); }
            draw_text_transformed_colour(tally_ox + score_offset4, 322, string_real_character(0, 9, 0), 2, 2, 0, c_gray, c_gray, c_gray, c_gray, alpha);
        }
        
        draw_text_transformed(tally_ox + score_offset1, 226, time_bonus, 2, 2, 0);
        draw_text_transformed(tally_ox + score_offset2, 258, rings_bonus, 2, 2, 0);    
        if (perfect_bonus > -1) { draw_text_transformed(tally_ox + score_offset3, 290, perfect_bonus, 2, 2, 0); }
        draw_text_transformed(tally_ox + score_offset4, 322, total_bonus, 2, 2, 0);
    }
}

// continues tokens
if (not (objZone.levelflags & LEVELFLAG_NOBONUES))
{
    if (objData.continues_display == 1)
    {
        draw_sprite_ext(select(objData.player_character_id[player_numb] - 1, sprContinueTokenSonic, sprContinueTokenTails, sprContinueTokenKnuckles), (image_index mod 2), 32 - continues_offset, (objScreen.gui_height - 78), 2, 2, 0, c_white, 1);
        draw_sprite_ext(sprLivesXHud, 0, 54 - continues_offset, (objScreen.gui_height - 68), 2, 2, 0, c_white, 1);
        
        // continues counter
        draw_set_valign(fa_top);
        draw_set_halign(fa_right);
        draw_set_font(objResources.font_hud_lives);
        if objData.zeroes_display { draw_text_transformed_colour(142 - continues_offset, (objScreen.gui_height - 68), string_real_character(0, 4, 0), 2, 2, 0, c_gray, c_gray, c_gray, c_gray, alpha); }
        draw_text_transformed_colour(142 - continues_offset, (objScreen.gui_height - 68), objData.continues, 2, 2, 0, c_white, c_white, c_white,c_white, 1);
    }
    
    // continue get indicator
    if (continue_token) and ((objScreen.image_index div 14) mod 2)
    { 
        draw_sprite_ext(select(objData.player_character_id[player_numb] - 1, sprContinueTokenSonic, sprContinueTokenTails, sprContinueTokenKnuckles), (image_index mod 2), tally_ox + 36, 314, 2, 2, 0, c_white, 1);
    }
}

