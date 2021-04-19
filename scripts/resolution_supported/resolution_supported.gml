/// @description resolution_supported(width, height)
/// @param width
/// @param height

function resolution_supported() { return (display_get_width() > argument[0]) and (display_get_height() > argument[1]) }