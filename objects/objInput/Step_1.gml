/// @description Input update
var buffer = state;
var i;

// clear states
state = 0;
state_press = 0;
state_release = 0;

// locked
if input_locked /*or objConsole.is_active*/ { exit; }

// Check gamepad disconnected
if not gamepad_is_connected(device_id)
{
    if gamepad_enabled
    {
        gamepad_enabled = false;
    }
}

// determine control type
switch control_state
{
    case 1: // stream input
    {
        if (device_id == 0) { break; }
        with objGame.controller[0] { other.state = stream[|max(stream_size - stream_delay, 0)]; }
        break;
    }
    
    default: // device input
    {
        // keyboard input
        for (i = 0; i < 12; i += 1) { if keyboard_check(code_keyboard[i]) { state |= power(2, i); } }
    
        // gamepad button input
        if gamepad_enabled { for (i = 0; i < 12; i += 1) { if gamepad_button_check(device_id, code_gamepad[i]) { state |= power(2, i); } } }
    }
}

// negate opposite inputs
if (state & INPUT_UP) and (state & INPUT_DOWN) { state ^= (INPUT_UP | INPUT_DOWN); }
if (state & INPUT_LEFT) and (state & INPUT_RIGHT) { state ^= (INPUT_LEFT | INPUT_RIGHT); }

// pressing and releasing
state_press = (state & buffer) ^ state;
state_release = (state & buffer) ^ buffer;

// queue input state
ds_list_add(stream, state);
if (ds_list_size(stream) > stream_size) { ds_list_delete(stream, 0); }