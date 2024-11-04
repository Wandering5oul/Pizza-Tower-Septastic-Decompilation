var i, b, ix, _kungfu, _stun;

draw_set_color(c_black);
draw_rectangle(0, -50, -50, room_height + 50, false);
draw_rectangle(room_width, -50, room_width + 50, room_height + 50, false);
draw_rectangle(0, 0, room_width, -50, false);
draw_rectangle(0, room_height, room_width, room_height + 50, false);
draw_set_color(c_white);
draw_set_color(c_white);

if (use_dark)
{
    for (i = 0; i < array_length(objdark_arr); i++)
    {
        with (objdark_arr[i])
        {
            if (visible)
            {
                b = get_dark(image_blend, other.use_dark);
                ix = image_xscale;
                draw_sprite_ext(sprite_index, image_index, x, y, ix, image_yscale, image_angle, b, image_alpha);
            }
        }
    }
}

if (obj_player1.finisher || obj_player2.finisher)
    finisher_alpha = Approach(finisher_alpha, 0.3, 0.1);
else if (finisher_alpha > 0)
    finisher_alpha = Approach(finisher_alpha, 0, 0.02);

if (finisher_alpha > 0)
{
    draw_set_alpha(finisher_alpha);
    draw_rectangle_color(-32, -32, room_width + 32, room_height + 32, c_black, c_black, c_black, c_black, 0);
    draw_set_alpha(1);
}

_kungfu = global.kungfu;

with (obj_baddie)
{
    b = get_dark(image_blend, obj_drawcontroller.use_dark);
    _stun = 0;
    
    if (state == UnknownEnum.Value_138)
        _stun = 25;
    
    if (visible)
    {
        draw_sprite_ext(sprite_index, image_index, x, y + _stun, xscale * image_xscale, yscale, angle, b, image_alpha);
        
        if (_kungfu)
        {
            if (hp > maxhp)
                maxhp = hp;
            
            draw_healthbar(x - 16, y - 50, x + 16, y - 45, (hp / maxhp) * 100, c_black, c_red, c_red, 0, 1, 1);
        }
    }
}

shader_set(global.Pal_Shader);

with (obj_thug_red)
{
    if (visible)
    {
        pal_swap_set(spr_palette, paletteselect, 0);
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, img_angle, image_blend, image_alpha);
    }
}

with (obj_heatafterimage)
{
    if (visible)
    {
        pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, 0);
        draw_sprite_ext(obj_player1.sprite_index, obj_player1.image_index, x, y, obj_player1.xscale, obj_player1.yscale, 1, c_white, alpha);
    }
}

with (obj_player2)
{
    if (visible)
    {
        b = get_dark(image_blend, obj_drawcontroller.use_dark);
        pal_swap_set(spr_palette, paletteselect, 0);
        draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, b, image_alpha);
    }
}

with (obj_player1)
{
    if (visible)
    {
        b = get_dark(image_blend, obj_drawcontroller.use_dark);
        pal_swap_set(spr_palette, paletteselect, 0);
        draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, angle, b, image_alpha);
    }
}

with (obj_noisedebris)
{
    if (visible)
    {
        pal_swap_set(spr_noisepalette, obj_player1.paletteselect, 0);
        draw_self();
    }
}

shader_set(shd_hit);

with (obj_baddie)
{
    _stun = 0;
    
    if (state == UnknownEnum.Value_138)
        _stun = 25;
    
    if (visible && flash)
        draw_sprite_ext(sprite_index, image_index, x, y + _stun, xscale * image_xscale, yscale, angle, image_blend, image_alpha);
}

with (obj_player)
{
    if (visible && flash)
        draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
}

with (obj_smallnumber)
{
    if (visible && flash)
        draw_text(x, y, number);
}

shader_reset();
