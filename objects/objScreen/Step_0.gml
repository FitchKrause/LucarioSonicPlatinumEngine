/// @description  Internal frame counter
image_index += 1 * global.tempo;

offset += 1;
if (offset > (height + 20)) { offset = -20; }

if (display_get_timing_method() <> tm_countvsyncs)
{
	display_reset(0, false);
	display_set_timing_method(tm_countvsyncs);
}

/*if (display_get_timing_method() <> tm_countvsyncs) and not reset_display
{
	display_set_timing_method(tm_countvsyncs);
	reset_display = true;
	reset_display_tick = 0;
}
else if (display_get_timing_method() <> tm_countvsyncs) and reset_display
{
	reset_display_tick += 1;
	if (reset_display_tick >= 10) { reset_display = false; }
}
else if (display_get_timing_method() == tm_countvsyncs) and reset_display
{
	reset_display = false;
	reset_display_tick = 0;
	log("done");
}*/