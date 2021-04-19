/// @description  Clean up
local_list = 0;
//ds_list_destroy(local_list);
ds_list_destroy(xtable);
ds_list_destroy(ytable);
ds_list_destroy(debug_list);

if surface_exists(palette_surface) { surface_free(palette_surface); }
audio_emitter_free(audio_emitter);

// Remove tails' tails
if (character_id == CHARACTER_TAILS) { instance_destroy(tails_effect); }

// Remove id
objGame.player_id[player_id] = noone;

