/// @description  Setup name tag
if instance_exists(objZone)
{
    // Name 
    name = objZone.name;
    act = objZone.act;
    style = objZone.levelstyle;
    if (objData.player_character_id[0] == CHARACTER_KNUCKLES) { bg_color = make_colour_rgb(0, 128, 0); }
    objGame.can_pause = false;
}

