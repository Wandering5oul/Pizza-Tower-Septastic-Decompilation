if (active)
{
    with (obj_player1)
    {
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_set_font(global.font_small);
        draw_set_color(c_white);
        draw_set_alpha(1);
        draw_text(16, 16, string_concat("HSP = ", hsp));
        draw_text(16, 32, string_concat("VSP = ", vsp));
        draw_text(16, 48, string_concat("MOVESPEED = ", movespeed));
        draw_text(16, 64, string_concat("STATE = ", state));
        draw_text(16, 80, string_concat("X = ", x));
        draw_text(16, 96, string_concat("Y = ", y));
        draw_set_halign(fa_right);
        draw_set_color(c_white);
        draw_set_alpha(1);
        draw_text(944, 16, string_concat("sprite_index = ", sprite_get_name(sprite_index)));
        draw_text(944, 32, string_concat("mask_index = ", sprite_get_name(mask_index)));
        draw_text(944, 48, string_concat("image_index = ", image_index));
        draw_text(944, 64, string_concat("image_speed = ", image_speed));
        draw_text(944, 80, string_concat("fps = ", fps));
        draw_text(944, 96, string_concat("room = ", room_get_name(room)));
        draw_text(944, 110, string_concat("supercharge = ", supercharge));
        draw_text(944, 126, string_concat("supercharged = ", supercharged));
        draw_text(944, 142, string_concat("tv queue length = ", ds_list_size(obj_tv.tv_queue)));
        draw_set_halign(fa_left);
        draw_set_valign(fa_bottom);
        draw_set_alpha(1);
        draw_text(16, 524, "1 - September Moveset\n2 - Noclip\n3 - Collisions\nTab - Disable Menu");
    }
}
