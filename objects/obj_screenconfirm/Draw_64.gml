var _revert, _midW, _midH, c1, c2;

draw_set_alpha(1);
draw_set_font(global.bigfont);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
_revert = "REVERTING IN " + string(timer) + "...";
_midW = 480;
_midH = 270;
draw_text(_midW, _midH - 70, "CONFIRM SETTINGS");
draw_text(_midW, _midH - 30, _revert);
c1 = (select == 0) ? c_white : 8421504;
c2 = (select == 1) ? c_white : 8421504;
draw_text_color(_midW - 100, _midH + 30, "YES", c1, c1, c1, c1, 1);
draw_text_color(_midW + 100, _midH + 30, "NO", c2, c2, c2, c2, 1);
