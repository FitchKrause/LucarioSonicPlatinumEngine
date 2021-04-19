/// @description  Render

draw_self();

if (timer > 0)
{
    if ((objScreen.image_index div 4) mod 2 == 0)
    {
        draw_sprite(sprCasinoNightBumper, 3, x, y);
    }
}

