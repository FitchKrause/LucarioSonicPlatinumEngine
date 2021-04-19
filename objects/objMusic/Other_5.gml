/// @description  Reset values

if (music_flags & MUSFLAG_NOSTOP)
{
    if not objData.level_restart
    {
        music_stop_all();
        music_reset_pitch();
        music_playing = noone;
        overlay_playing = noone;
    }
}
music_flags &= ~(MUSFLAG_NOSTOP);
audio_listener_position(0, 0, 0);