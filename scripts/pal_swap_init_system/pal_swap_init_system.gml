function pal_swap_init_system()
{
    global.Pal_Shader = argument[0];
    global.Pal_Texel_Size = shader_get_uniform(argument[0], "texel_size");
    global.Pal_UVs = shader_get_uniform(argument[0], "palette_UVs");
    global.Pal_Index = shader_get_uniform(argument[0], "palette_index");
    global.Pal_Texture = shader_get_sampler_index(argument[0], "palette_texture");
    global.N_Pal_Texture = shader_get_sampler_index(shd_noise_afterimage, "palette_texture");
    global.N_Texel_Size = shader_get_uniform(shd_noise_afterimage, "texel_size");
    global.N_Pal_UVs = shader_get_uniform(shd_noise_afterimage, "palette_UVs");
    global.N_Pal_Index = shader_get_uniform(shd_noise_afterimage, "palette_index");
    global.N_Pal_Y = shader_get_uniform(shd_noise_afterimage, "palette_y");
    global.N_Pattern_Tex = shader_get_sampler_index(shd_noise_afterimage, "pattern_texture");
    global.N_Pattern_Enabled = shader_get_uniform(shd_noise_afterimage, "pattern_enabled");
    global.N_Pattern_UVs = shader_get_uniform(shd_noise_afterimage, "pattern_UVs");
    
    if (argument_count > 1 && argument[1])
        global.Pal_Map = ds_map_create();
}
