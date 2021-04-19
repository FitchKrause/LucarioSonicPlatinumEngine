/// @description  Start critical game values

// Define geometric tables
globalvar sine, cosine;
for (var i = 360; i > -1; i -= 1) { sine[i] = sin(degtorad(i)); cosine[i] = cos(degtorad(i)); }
randomize();

// Controllers
controller[0] = instance_create_depth(0, 0, 0, objInput); // Player 1
controller[1] = noone; //instance_create_depth(0, 0, 0, objInput); // Player 2 (Unused)

// Start critical processes (All used for the game)
instance_create_depth(0, 0, 0, objResources); // Game Resources (Particles, Animation script tables and Fonts)
instance_create_depth(0, 0, 0, objData); // Game Data (User Settings, Characters, Rings, Lives, Score and Continues)
instance_create_depth(0, 0, -2048, objScreen); // Game Screen (Resolution base of 424x240, for resolution HUD is the double of the base)
instance_create_depth(0, 0, 0, objMusic); // Game Music (eXtensive music machine with flags and loop point system)
//instance_create_depth(0, 0, -2024, objConsole); // Developer console
engine_reset_data();

// Shaders handler
if not shaders_are_supported() or not shader_is_compiled(shdPalleteSwapper)
{
    global.shaders_active = false;
    audio_play_normal(sndFatalError, false, 0);
}

// Start
//objData.player_character_id[0] = CHARACTER_SONIC;
//transition_to(zoneTest, objTitleCard, 24);
//stage_goto(0, objTitleCard, 24);
transition_to(gameMenu, objFade, 24);