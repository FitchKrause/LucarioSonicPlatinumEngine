/// @description  Deactivate
/*
// Free up background surface
surface_free(con_surf);

// Deactivate console
con_visible = false;

// Clearup
value = "";
con_sug_sel = 0;
ds_list_clear(con_sug);

// Reactivate instances
instance_activate_all();

