/// @description  Final sequence

animation_running = false;
animation_tick = 0;
sprite_index = sprSignPostCharacter;
image_index = (character_id - 1);

// Wait...
if objZone.finished
{
   // Singleplayer
   if (objGame.mode == GAMETYPE_SINGLEPLAYER)
   {
        with instance_create_depth(0, 0, -1038, objScoreCard) { move_player = other.move_player; }
   }
}

