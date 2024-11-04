var tv_x, tv_y, _ps, _cx, _cy, _perc, _minX, _maxX, _tx, _ty, _str, num, i, char, collect_x, collect_y, spr;

if (instance_exists(obj_titlecard) && obj_titlecard.visible)
    exit;

draw_set_font(global.bigfont);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_alpha(1);
tv_x = 845;
tv_y = 80;
_ps = !obj_player1.ispeppino;
_cx = tv_x + combo_posX;
_cy = tv_y + 117 + hud_posY + combo_posY;
_perc = global.combotime / 60;
_minX = _cx - 56;
_maxX = _cx + 59;
combofill_x = lerp(combofill_x, _minX + ((_maxX - _minX) * _perc), 0.5);
combofill_y = _cy;
shader_set(global.Pal_Shader);
pal_swap_set(spr_tv_combofillpalette, (!global.combodropped && global.prank_enemykilled) ? 2 : 1, false);
draw_sprite(spr_tv_combobubblefill, combofill_index, combofill_x, combofill_y);
pal_swap_set(spr_tv_combopalette, _ps, false);
draw_sprite(spr_tv_combobubble, -1, _cx, _cy);
draw_set_font(global.combofont2);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
_tx = _cx - 64;
_ty = _cy - 12;
_str = string(visualcombo);
num = string_length(_str);

for (i = num; i > 0; i--)
{
    char = string_char_at(_str, i);
    draw_text(_tx, _ty, char);
    _tx -= 22;
    _ty -= 8;
}

shader_reset();
collect_x = irandom_range(-collect_shake, collect_shake);
collect_y = irandom_range(-collect_shake, collect_shake);

if (room != strongcold_endscreen)
{
    draw_sprite_ext(spr_tv_bg, bg_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);
    shader_set(global.Pal_Shader);
    pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, 0);
    draw_sprite_ext(sprite_index, image_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);
    shader_reset();
}

if (tv_state == UnknownEnum.Value_2)
    draw_sprite_ext(spr_tv_whitenoise, whitenoise_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);

if (!obj_player1.ispeppino)
{
    shader_set(global.Pal_Shader);
    pal_swap_set(spr_tv_palette, 1, 0);
    spr = spr_tv_empty;
    
    if (sprite_index == spr_tv_open)
        spr = sprite_index;
    
    draw_sprite_ext(spr, image_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);
    shader_reset();
}

if (bubblespr != -4)
    draw_sprite_ext(bubblespr, bubbleindex, 512, 53 + hud_posY, 1, 1, 1, c_white, alpha);

if (!surface_exists(promptsurface))
    promptsurface = surface_create(290, 102);

surface_set_target(promptsurface);
draw_clear_alpha(c_black, 0);
draw_set_font(font1);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

if (bubblespr == spr_tv_bubble)
{
    promptx -= promptspd;
    
    if (bubblespr != spr_tv_bubbleclose && promptx < (350 - string_width(prompt)))
    {
        bubblespr = spr_tv_bubbleclose;
        bubbleindex = 0;
    }
    
    draw_text_color(promptx - 350, 50, prompt, c_black, c_black, c_black, c_black, 1);
}

draw_set_halign(fa_left);
surface_reset_target();
draw_surface(promptsurface, 350, hud_posY);
draw_set_font(global.smallnumber_fnt);
draw_set_halign(fa_center);

if (instance_exists(obj_pizzaball))
    draw_text(832, 300, string(global.golfhit) + " " + "GOLF HIT");
