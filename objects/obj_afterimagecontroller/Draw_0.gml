var i, b, shd, a;

for (i = 0; i < ds_list_size(global.afterimage_list); i++)
{
    b = ds_list_find_value(global.afterimage_list, i);
    shd = false;
    
    with (b)
    {
        if (visible)
        {
            a = other.alpha[identifier];
            
            if (identifier == UnknownEnum.Value_3)
            {
                a = alpha;
                shd = true;
                shader_set(shd_firemouth_afterimage);
            }
            else if (identifier == UnknownEnum.Value_4)
            {
                a = alpha;
                
                if (playerid != -4)
                {
                    shader_set(global.Pal_Shader);
                    shd = true;
                    pal_swap_set(playerid.spr_palette, playerid.paletteselect, 0);
                }
            }
            else if (identifier == UnknownEnum.Value_8)
            {
                a = alpha;
                shd = true;
                shader_set(shd_noise_afterimage);
                pal = 1;
                
                if (obj_player1.paletteselect == 0)
                    pal = 5;
                
                noise_aftimg_set_pal(obj_player1.spr_palette, obj_player1.paletteselect, pal);
                shader_set_uniform_i(global.N_Pattern_Enabled, 0);
            }
            
            pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false);
            draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, 0, image_blend, a);
            
            if (shd)
                shader_reset();
        }
    }
}
