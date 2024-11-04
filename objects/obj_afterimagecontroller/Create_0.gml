depth = 1;
global.afterimage_list = ds_list_create();
alpha = array_create(UnknownEnum.Value_9, 1);
alpha[UnknownEnum.Value_2] = 0.5;
shd_alpha = shader_get_uniform(shd_firemouth_afterimage, "newAlpha");
