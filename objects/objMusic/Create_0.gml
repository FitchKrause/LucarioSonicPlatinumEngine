///@desc Initialize

image_speed = 0;

// State machine
state = MUSSTATE_SILENCE;
state_previous = MUSSTATE_SILENCE;
state_default = MUSSTATE_SILENCE;
/***********************************************************************************
  - 0: Silence: Just that.
  - 1: Loop: Repeat over and over again.
  - 2: Single: Music that plays once. 
  - 3: Overlay: Pause current music, on finish continue current music.
***********************************************************************************/

// Positions
for (var i = 0; i < 10; i += 1) { music_position[i] = 0; }

// Music
music_playing = -1;
music_current_id = -1;
music_current_flags = 0;
music_current_looppoint = 0;
music_previous_id = -1;
music_previous_flags = 0;
music_previous_looppoint = 0;

// Overlay
overlay_playing = -1;
overlay_current_id = -1;
overlay_current_flags = 0;
overlay_previous_id = -1;
overlay_previous_flags = 0;

// Volume
//volume_current = 1;
//volume_target = 1;
//volume_speed = 1;
//volume_type = 0; // 0 = normal, 1 = overlay, 2 = all

// Pitch
pitch_current = 1;
pitch_target = 1;
//pitch_speed = 1;
//pitch_type = 0; // 0 = normal, 1 = overlay, 2 = all
pitch_default = 1;

// Extra
is_looping = false;
sample_rate = 44100;
music_flags = 0;