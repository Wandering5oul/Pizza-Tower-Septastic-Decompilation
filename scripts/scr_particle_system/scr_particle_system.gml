function declare_particle(argument0, argument1, argument2, argument3)
{
    var p, t, s, spd;
    
    ds_map_set(global.part_map, argument0, part_type_create());
    ds_map_set(global.part_depth, argument0, argument3);
    p = ds_map_find_value(global.part_map, argument0);
    part_type_sprite(p, argument1, 1, 1, 0);
    t = sprite_get_number(argument1);
    s = argument2;
    spd = t / s;
    part_type_life(p, spd, spd);
    return p;
}

function particle_set_scale(argument0, argument1, argument2)
{
    part_type_scale(ds_map_find_value(global.part_map, argument0), argument1, argument2);
}

function create_debris(argument0, argument1, argument2)
{
    var q;
    
    q = 
    {
        x: argument0,
        y: argument1,
        sprite_index: argument2,
        image_index: irandom(sprite_get_number(argument2) - 1),
        image_angle: random_range(1, 270),
        sprw: sprite_get_width(argument2),
        sprh: sprite_get_height(argument2),
        hsp: random_range(-4, 4),
        vsp: random_range(-4, 0),
        grav: 0.4
    };
    ds_list_add(global.debris_list, q);
    return q;
}

function create_collect(argument0, argument1, argument2, argument3 = 0)
{
    var q;
    
    argument0 -= camera_get_view_x(view_camera[0]);
    argument1 -= camera_get_view_y(view_camera[0]);
    q = 
    {
        x: argument0,
        y: argument1,
        sprite_index: argument2,
        image_index: 0,
        image_number: sprite_get_number(argument2),
        hsp: 0,
        vsp: 0,
        value: argument3
    };
    ds_list_add(global.collect_list, q);
    return q;
}

function create_particle(argument0, argument1, argument2, argument3 = 0)
{
    var _depth;
    
    _depth = ds_map_find_value(global.part_depth, argument2);
    
    if (is_undefined(_depth))
        _depth = object_get_depth(object_index);
    
    part_system_depth(global.particle_system, _depth);
    part_emitter_region(global.particle_system, global.part_emitter, argument0 - argument3, argument0 + argument3, argument1 - argument3, argument1 + argument3, 0, 0);
    part_emitter_burst(global.particle_system, global.part_emitter, ds_map_find_value(global.part_map, argument2), 1);
}
