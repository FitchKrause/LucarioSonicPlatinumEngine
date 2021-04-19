/// @description  Clean up

if audio_group_is_loaded(AudioSounds) { audio_group_unload(AudioSounds); }

ds_list_destroy(stage_list);
part_system_destroy(particles);