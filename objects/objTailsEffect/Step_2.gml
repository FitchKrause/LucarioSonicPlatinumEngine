/// @description  Step

// Not Tails
if (player_id.character_id <> CHARACTER_TAILS) { instance_destroy(); exit; }

// Execute
event_inherited();

// Set animation
switch player_id.animation_current
{
    case "idle":
    case "brake":
    case "look":
    case "crouch":
    case "push": // Standing
    {
        visible = 1 - ((player_id.immunity div 4) mod 2);
        sprite_index = sprTailsEffect1;
        image_speed = 0.125;
        break;
    }
    
    case "spin": // Spinning
    {
        visible = 1 - ((player_id.immunity div 4) mod 2);
        sprite_index = sprTailsEffect2;
        image_speed = 0.25;
        break;
    }
    
    case "spindash": // Spindash
    {
        visible = 1 - ((player_id.immunity div 4) mod 2);
        sprite_index = sprTailsEffect3;
        image_speed = 0.333;
        break;
    }
    
    case "flight":
    {
        visible = 1 - ((player_id.immunity div 4) mod 2);
        sprite_index = sprTailsEffect4;
        image_speed = 0.25;
        break;
    }
    
    case "flight_end": // Flight spin
    {
        visible = 1 - ((player_id.immunity div 4) mod 2);
        sprite_index = sprTailsEffect4;
        image_speed = 0.125;
        break;
    }
    
    default:
    {
        visible = false;
    }
}

// Abort if not visible
if not visible exit;

// Set facing
image_xscale = player_id.facing;

// Set angle
switch player_id.state
{
    case player_is_falling:
    {
        // Rotate to movement direction if spinning
        if (player_id.animation_current <> "spin") { image_angle = player_id.angle; }
        else if (image_xscale) { image_angle = point_direction(0, 0, player_id.xspeed, player_id.yspeed); }
        else { image_angle = point_direction(player_id.xspeed, player_id.yspeed, 0, 0); }
        break;
    }
    
    case player_is_spindashing:
    case player_is_looking:
    case player_is_crouching:
    case player_is_standing:
    {
        // Match gravity angle
        image_angle = gravity_angle();
        break;
    }
    
    case player_is_debugging:
    {
        visible = false;
        break;
    }
            
    default:
    {
        // Match player's angle
        image_angle = player_id.angle;
        if player_id.floor_id { if (player_id.floor_id.surface_angle & ANGLEFLAG_COLLISION) and not (player_id.floor_id.surface_angle & ANGLEFLAG_ROTATE) { image_angle = gravity_angle(); } }
    }
}

