with (other)
{
    if (state == UnknownEnum.Value_42 || state == UnknownEnum.Value_43)
    {
        image_index = 0;
        sprite_index = spr_shotgunpullout;
        scr_soundeffect(116);
        instance_destroy(other);
        shotgunAnim = 1;
        tv_push_prompt_once(tv_create_prompt("This is the shotgun powerup text", UnknownEnum.Value_2, 373, 3), "shotgun");
        global.heattime = 60;
        instance_create(x, y, obj_shotgunback);
    }
}
