/// @description  Handle game overs

// Music
objMusic.flags &= ~(MUSFLAG_NOCHANGE);

// Execute
if (image_index == 1)
{
    if (objGame.mode == GAMETYPE_SINGLEPLAYER) { transition_to(room, objTitleCard, 24); }
    else if (objGame.mode == GAMETYPE_COMPETITION)
    {
        objGame.mode = GAMETYPE_SINGLEPLAYER;
        objScreen.splitscreen = false;
        transition_to(gameMenu, objFade, 24);
    }
}
else
{
    if (objData.continues > 0) { instance_create_depth(0, 0, -1040, objContinue); }
	else { transition_to(gameMenu, objFade, 24 + (60 * forced)); }
}

