/// @description  Sequence & Animation

if timer { timer -= 1 * global.tempo; if not timer { timer_end = true; } }
if timer_end { if image_offset { image_offset = clamp_value(image_offset - 8 * global.tempo, 0, 88); } else { animation_running = true; timer_end = false; } }
if animation_running
{
    switch animation_tick
	{
		case 0: { image_frame = 1; break; }
		case 10: { image_frame = 2; break; }
		case 20: { image_frame = 3; break; }
		case 30: { image_frame = 4; break; }
		case 40: { image_frame = 5; break; }
		case 50: { image_frame = 6; break; }
		case 58: { image_frame = 7; break; }
		case 66: { animation_tick = 49; break; }
	}
    animation_tick += 1 * global.tempo;
}
if (animation_tick >= 49) { if (fade > 0) { fade -= 0.03 * global.tempo; } }