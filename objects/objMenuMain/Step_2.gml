/// @description  Events and Animations

// Timer
if menu_tick { menu_tick -= 1; }

// 
if effect_started
{
	if not effect_reversed
	{
		menu_state = 1;
		if (effect_menu_move > 0) { effect_menu_move -= 40; }
		if (effect_line_move > 0) { effect_line_move -= 20; }
		if (effect_alpha >= 1) 
	    { 
			if (effect_alpha2 >= 1)
			{
				effect_started = false;
				menu_active = true;
				music_play_loop(bgmMainMenuFull, 70623, audio_sound_get_track_position(objMusic.music_playing) * objMusic.sample_rate);
			}
			else { effect_alpha2 += 0.2; }
	    }
		else { effect_alpha += 0.1; }
		
		/*if (effect_alpha >= 1) 
	    { 
	        if (effect_line_move > 0) { effect_line_move -= 20; }
			else
			{
				if (effect_alpha2 >= 1)
				{
					menu_state = 1;
					if (effect_menu_move > 0) { effect_menu_move -= 40; }
					else
					{
						effect_started = false;
						menu_active = true;
						music_play_loop(bgmMainMenuFull, 70623, audio_sound_get_track_position(objMusic.music_playing) * objMusic.sample_rate);
					}
				}
				else { effect_alpha2 += 0.2; }
			}
	    }
		else { effect_alpha += 0.1; }*/
	}
	else
	{
		if (effect_menu_move < 320) { effect_menu_move += 40; }
		if (effect_line_move < 200) { effect_line_move += 20; }
		if (effect_alpha <= 0) 
	    { 
			if (effect_alpha2 <= 0)
			{
				effect_started = false;
				menu_active = true;
				menu_state = 0;
				music_play_loop(bgmMainMenu, 70623, audio_sound_get_track_position(objMusic.music_playing) * objMusic.sample_rate);
			}
			else { effect_alpha2 -= 0.2; }
	    }
		else { effect_alpha -= 0.1; }
		
		/*if (effect_menu_move <= 300) { effect_menu_move += 40; }
		else
		{
			if (effect_alpha2 <= 0)
			{
				menu_state = 0;
				if (effect_line_move <= 180) { effect_line_move += 20; }
				else
				{
					if (effect_alpha <= 0)
					{
						effect_started = false;
						menu_active = true;
						music_play_loop(bgmMainMenu, 70623, audio_sound_get_track_position(objMusic.music_playing) * objMusic.sample_rate);
					}
					else { effect_alpha -= 0.1; }
				}
			}
			else { effect_alpha2 -= 0.2; }
		}*/
	}
}

// Lines
if not (menu_state == 4) and not ((menu_state == 3) and (menu_substate == 1))
{
	if (effect_line_offset > -(sprite_get_height(sprTitleCardBorder) * 2))
	{
		effect_line_offset -= 1;
	}
	else { effect_line_offset = -2; }
}

// ...
if character_anim_arrowup { character_anim_arrowup -= 1; }
if character_anim_arrowdown { character_anim_arrowdown -= 1; }

// Offset (Controls)
if (controls_keyboard_item > 6) and (controls_keyboard_item < 12) { controls_keyboard_offset_target = 24 * (controls_keyboard_item - 6); }
else if (controls_keyboard_item > 11) { controls_keyboard_offset_target = 132; } else { controls_keyboard_offset_target = 0; }
if (controls_keyboard_offset <> controls_keyboard_offset_target) { controls_keyboard_offset = approach(controls_keyboard_offset, controls_keyboard_offset_target, 10); }