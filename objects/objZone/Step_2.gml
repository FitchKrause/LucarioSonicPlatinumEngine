/// @description  Listener and scene culling
if objGame.paused or objGame.lost_focus { exit; }


// Activate onscreen instances and surrounding instances offscreen
with objZoneObject
{
	if (deletion_method == 1) { instance_deactivate_object(self); }
	/*if not in_view(view_camera[view_current], 32)
	{
		
		switch deletion_method
		{
			case 1: { instance_deactivate_object(self); break; } 
			case 2: { instance_destroy(); break; }
		}
	}*/
}
with objCamera { instance_activate_region(camera_get_view_x(view_camera[camera_id]) - 32, camera_get_view_y(view_camera[camera_id]) - 32, camera_get_view_width(view_camera[camera_id]) + 64, camera_get_view_height(view_camera[camera_id]) + 64, true); }
//with objPlayer { if offscreen_enabled and not in_view(view_camera[camera.camera_id], 32) { instance_activate_region(x - (offset_y * 2) - abs(xspeed), y - (offset_y * 2) - abs(yspeed), (offset_y * 4) + abs(xspeed * 2), (offset_y * 4) + abs(yspeed * 2), true); } }
//with objEnemy { if offscreen_enabled { instance_activate_region(bbox_left - (sprite_width * 0.5), bbox_top - (sprite_height * 0.5), bbox_right + (sprite_width * 0.5), bbox_bottom + (sprite_height * 0.5), true); } }