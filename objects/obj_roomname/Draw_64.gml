var r;

r = string_letters(room_get_name(room));

if (!string_starts_with(r, "hub"))
    exit;

if ((instance_exists(obj_shell) && !obj_shell.showhud) || !global.option_hud)
    exit;

draw_set_font(global.smallfont);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_color(c_white);
draw_sprite(spr_roomnamebg, 0, xi, yi);
draw_text(xi, yi, string_hash_to_newline(message));
