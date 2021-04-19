/// Destroy outside of view

if (deletion_method == 2)
{   
    if view_visible[view_current] and in_view(view_camera[view_current], 32) { exit; }
    instance_destroy();
}