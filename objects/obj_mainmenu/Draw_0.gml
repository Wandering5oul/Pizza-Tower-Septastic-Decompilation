var _h, _pad, _sw, _sh, i, _text, _c, _c1, _c2, _t1, _t2;

draw_set_color(c_white);
draw_set_alpha(1);
// draw_sprite_thunder calls have been fixed
draw_sprite_thunder(spr_mainmenu_bgsky, bgboil, (bg_x * 0.7) + 6, 0);
draw_sprite_thunder(spr_mainmenu_bgwater, bgboil, (bg_x * 0.8) - 20, 0);
draw_sprite_tiled(spr_mainmenu_bgclouds1, 0, (bg_x * 0.8) - clouds_x, 19);
draw_sprite_tiled(spr_mainmenu_bgclouds2, 0, (bg_x * 0.8) - (clouds_x * 0.5), 19);
draw_sprite_thunder(spr_mainmenu_bgmoon, 0, (bg_x * 0.85) + 7, 0);
draw_sprite_ext(spr_mainmenu_bgactualthunder, 0, (bg_x * 0.9) + 7, 0, 1, 1, 0, c_white, thunderalpha);
draw_sprite_thunder(spr_mainmenu_bgtower, 0, (bg_x * 0.9) + 7, 0);
draw_sprite_thunder(spr_mainmenu_bg, 0, bg_x, 0);
draw_sprite(spr_mainmenu_peppino, pep_index, scroll_x, 540);
draw_sprite(spr_mainmenu_noise, pep_index, scroll_x + 960, 540);
draw_set_alpha(uialpha);
draw_sprite(spr_mainmenu_logo, 0, logo_x, 0);
_h = string_height("A");
_pad = 48;
_sw = sprite_get_width(spr_mainmenu_logo);
_sh = sprite_get_height(spr_mainmenu_logo);

for (i = 0; i < array_length(text_arr[saves]); i++)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_set_font(global.creditsfont);
    _text = text_arr[saves][i];
    _c = ispeppino ? make_color_rgb(136, 168, 200) : make_color_rgb(216, 136, 24);
    
    if (selected == i)
    {
        _c = ispeppino ? c_white : make_color_rgb(248, 224, 128);
        _text = "[shake]" + _text;
    }
    
    draw_set_color(_c);
    draw_text_scribble(logo_x, (_pad * i) + _sh, _text);
    draw_set_color(c_white);
}

draw_set_alpha(icon_fade);
draw_sprite(spr_mainmenu_noiseicon, icon_index, scroll_x + 450, 390);
draw_sprite(spr_mainmenu_peppinoicon, icon_index, (scroll_x + 1920) - 450, 390);
draw_set_alpha(1);
stringwidth = string_width(text_arr[saves][selected] + "AAAA");
draw_sprite_ext(spr_pizzaangel, cursor_index, cursor1_x, cursor1_y, 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_noisedevil, cursor_index, cursor2_x, cursor2_y, -1, 1, 0, c_white, 1);

if (confirmscreen)
{
    draw_set_alpha(0.5);
    draw_rectangle_color(0, 0, 960, 540, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
    draw_set_color(c_red);
    draw_text_scribble(480, 220, "[shake]Exit the game?");
    _c1 = (confirmselect == 0) ? (ispeppino ? c_white : make_color_rgb(248, 224, 128)) : (ispeppino ? make_color_rgb(136, 168, 200) : make_color_rgb(216, 136, 24));
    _c2 = (confirmselect == 1) ? (ispeppino ? c_white : make_color_rgb(248, 224, 128)) : (ispeppino ? make_color_rgb(136, 168, 200) : make_color_rgb(216, 136, 24));
    _t1 = (confirmselect == 0) ? "[shake]Yes" : "Yes";
    _t2 = (confirmselect == 1) ? "[shake]No" : "No";
    draw_set_color(_c1);
    draw_text_scribble(380, 320, _t1);
    draw_set_color(_c2);
    draw_text_scribble(580, 320, _t2);
    draw_set_color(c_white);
}

draw_set_alpha(1);
