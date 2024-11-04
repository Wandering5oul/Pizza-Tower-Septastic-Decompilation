function noise_aftimg_set_pal(argument0, argument1, argument2 = 5)
{
    var tex, UVs, texel_x, texel_y, texel_hx, texel_hy;
    
    tex = sprite_get_texture(argument0, 0);
    UVs = sprite_get_uvs(argument0, 0);
    texture_set_stage(global.N_Pal_Texture, tex);
    texture_set_interpolation_ext(global.N_Pal_Texture, 0);
    texel_x = texture_get_texel_width(tex);
    texel_y = texture_get_texel_height(tex);
    texel_hx = texel_x * 0.5;
    texel_hy = texel_y * 0.5;
    shader_set_uniform_f(global.N_Texel_Size, texel_x, texel_y);
    shader_set_uniform_f(global.N_Pal_UVs, UVs[0] + texel_hx, UVs[1] + texel_hy, UVs[2] + texel_hx, UVs[3] + texel_hy);
    shader_set_uniform_f(global.N_Pal_Index, argument1);
    shader_set_uniform_f(global.N_Pal_Y, argument2);
}

function noise_aftimg_set_pattern(argument0, argument1)
{
    var _tex, _uvs;
    
    if (argument0 == -4)
    {
        shader_set_uniform_i(global.N_Pattern_Enabled, 0);
        exit;
    }
    
    shader_set_uniform_i(global.N_Pattern_Enabled, 1);
    _tex = sprite_get_texture(argument0, argument1);
    texture_set_stage(global.N_Pattern_Tex, _tex);
    texture_set_interpolation_ext(global.N_Pattern_Tex, 0);
    _uvs = sprite_get_uvs(argument0, argument1);
    shader_set_uniform_f(global.N_Pattern_UVs, _uvs[0], _uvs[1], _uvs[2], _uvs[3]);
}
