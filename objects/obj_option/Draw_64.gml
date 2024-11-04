var i, _os, m, options, len, size, xx, yy, c, a, o, t, txt, w, h, aw, x1, y1, x2, y2, spr, select, n;

draw_rectangle_color(0, 0, 960, 540, c_black, c_black, c_black, c_black, false);

for (i = 0; i < array_length(bg_alpha); i++)
    draw_sprite_tiled_ext(spr_optionsBG, i, bg_x, bg_y, 1, 1, c_white, bg_alpha[i]);

if (room != rm_mainmenu)
{
    with (obj_keyconfig)
        event_perform(ev_draw, ev_gui);
}

if (instance_exists(obj_keyconfig) || instance_exists(obj_screenconfirm))
    exit;

draw_set_font(global.bigfont);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
_os = optionselected;
m = menus[menu];
options = m.options;
len = array_length(options);
size = (string_height("A") * len) + (len * m.ypad);
xx = 480;
yy = 270 - (size / 4);

switch (m.anchor)
{
    case UnknownEnum.Value_0:
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        c = c_white;
        a = 1;
        
        for (i = 0; i < len; i++)
        {
            o = options[i];
            c = 8421504;
            
            if (i == _os)
                c = c_white;
            
            t = o.name;
            draw_text_color(xx, yy + (m.ypad * i), t, c, c, c, c, a);
            
            if (menu == UnknownEnum.Value_0)
                scr_pauseicon_draw(i, xx + (string_width(t) / 2) + 50, yy + (m.ypad * i));
        }
        
        break;
    
    case UnknownEnum.Value_1:
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        xx = m.xpad;
        c = c_white;
        a = 1;
        
        for (i = 0; i < len; i++)
        {
            draw_set_halign(fa_left);
            o = options[i];
            c = 8421504;
            
            if (i == _os)
                c = c_white;
            
            txt = o.name;
            draw_text_color(xx, yy + (m.ypad * i), txt, c, c, c, c, a);
            draw_set_halign(fa_right);
            
            switch (o.type)
            {
                case UnknownEnum.Value_0:
                    draw_text_color(960 - m.xpad, yy + (m.ypad * i), o.value ? "ON" : "OFF", c, c, c, c, a);
                    break;
                
                case UnknownEnum.Value_3:
                    w = 200;
                    h = 5;
                    aw = w * (o.value / 100);
                    x1 = 960 - m.xpad - w;
                    y1 = yy + (m.ypad * i);
                    x2 = x1 + aw;
                    y2 = y1 + h;
                    spr = spr_slidericon;
                    
                    if (menu != UnknownEnum.Value_1)
                        spr = spr_slidericon2;
                    
                    draw_set_alpha(a);
                    draw_sprite_ext(spr_slider, 0, x1, y1, 1, 1, 0, c_dkgray, a);
                    draw_sprite_ext(spr_slider, 0, x1, y1, 1, 1, 0, c, a);
                    draw_set_alpha(1);
                    draw_sprite(spr, o.moving ? 1 : 0, x2, y2 - h);
                    break;
                
                case UnknownEnum.Value_1:
                    select = o.values[o.value];
                    n = select.name;
                    n = select.name;
                    draw_text_color(960 - m.xpad, yy + (m.ypad * i), n, c, c, c, c, a);
                    break;
            }
        }
        
        break;
}
