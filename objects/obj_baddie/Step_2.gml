if (state == UnknownEnum.Value_4)
    scr_enemy_grabbed();
else if (state == UnknownEnum.Value_43)
    scr_enemy_lungeattack();

scr_squash();

if (thrown)
{
    scr_destroy_destructibles(hsp, 0);
    scr_destroy_destructibles(0, vsp);
    scr_destroy_destructibles(hsp, vsp);
}

if (state != UnknownEnum.Value_4 && state != UnknownEnum.Value_154 && object_index != obj_pepbat && object_index != obj_fakesanta)
    scr_collide();

if (invtime > 0)
    invtime--;

if (sprite_index == walkspr && hsp != 0 && floor(image_index) == (image_number - 1))
    create_particle(x - (image_xscale * 20), y + 43, UnknownEnum.Value_1, 0);

if (state == UnknownEnum.Value_134)
    image_speed = 0.35 + (global.baddiespeed * 0.05);
else if (state != 128)
    image_speed = 0.35;

if (dodgebuffer > 0)
    dodgebuffer--;

with (instance_nearest(x, y, obj_player))
{
    if (state == UnknownEnum.Value_84)
    {
        other.stunned = 0;
        
        if (other.state != UnknownEnum.Value_129 && !other.provoked && other.bombreset > 0)
        {
            other.bombreset = 0;
            other.provoked = 1;
        }
        
        other.scaredbuffer = 0;
    }
    else if (other.state != UnknownEnum.Value_129)
    {
        other.provoked = 0;
    }
}
