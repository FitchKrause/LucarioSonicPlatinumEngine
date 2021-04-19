/// Input setup
image_speed = 0;
device_id = instance_number(objInput) - 1;
state = 0;
state_press = 0;
state_release = 0;
control_state = 0; // 0 = gamepad; 1 = player 1 stream
input_locked = false;

// control codes
for (var i = 0; i < 12; i += 1) { code_keyboard[i] = -1; code_gamepad[i] = -1; }

// gamepad properties
gamepad_enabled = gamepad_is_connected(device_id);

// input list for joystick replays, computer controls, etc.
stream = -1;
stream_size = 255;
stream_delay = 40;