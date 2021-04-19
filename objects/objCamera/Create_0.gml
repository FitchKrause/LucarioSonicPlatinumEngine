/// @description Initialize camera

initialized = false;
tick = 0;

// stage boundaries
left_bound = 0; // left
top_bound = 0; // top
right_bound = room_width; // right
bottom_bound = room_height; // bottom

// panning speed (auto movement)
panning_hspeed = 0; 
panning_vspeed = 0;

// panning offset
origin_x = 0;
origin_y = 0;
offset_x = 0; 
offset_y = 0;

// states
horizontal_lock = false; // horizontal border state
vertical_lock = true; // vertical border state

// flags
locked_horizontal = false;
locked_vertical = false;
locked_x = false;
locked_y = false;

// borders
border_x = 8; // horizontal border
border_y = 32; // vertical border 

// settings
max_speed = 16; // max speed camera 

// view
camera_id = instance_number(objCamera) - 1;