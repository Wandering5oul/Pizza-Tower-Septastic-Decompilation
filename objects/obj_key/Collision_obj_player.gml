if (room == rm_editor)
    exit;

if (global.key_inv)
    exit;

with (other)
{
    if (state != UnknownEnum.Value_51 && state != UnknownEnum.Value_186 && state != UnknownEnum.Value_16 && state != UnknownEnum.Value_47 && state != UnknownEnum.Value_21 && state != UnknownEnum.Value_33 && state != UnknownEnum.Value_24 && state != UnknownEnum.Value_48 && state != UnknownEnum.Value_38 && state != UnknownEnum.Value_107)
    {
        instance_destroy(other);
        global.key_inv = 1;
        key_particles = 1;
        alarm[7] = 30;
        scr_soundeffect(47);
        state = UnknownEnum.Value_90;
        image_index = 0;
        global.heattime = 60;
    }
}
