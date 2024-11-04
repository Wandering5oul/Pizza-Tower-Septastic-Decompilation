if (instance_number(object_index) > 1)
{
    instance_destroy();
    exit;
}

depth = -7;
gpu_set_alphatestref(244);
finisher_alpha = 0;
use_lighting = 0;
flash = 0;
surf = surface_create(960, 540);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);
surface_reset_target();
bg_alpha = 0.8;
circle_alpha_out = 0.4;
circle_alpha_in = 1;
circle_size_out = 178;
circle_size_in = 128;
use_dark = false;
dark_alpha = 1;
dark_arr = ["Tiles_1", "Tiles_2", "Tiles_3", "Tiles_4"];
objdark_arr = [320, 697, 98, 206, 825, 3, 313, 253, 460, 471, 472, 50, 176, 354];
