// probably not gonna use it
enum part
{
	cloudeffect,
	crazyrunothereffect,
	highjumpcloud1,
	highjumpcloud2,
	jumpdust,
	balloonpop,
	shotgunimpact,
	impact,
	genericpoofeffect,
	keyparticles,
	teleporteffect,
	landcloud,
	ratmountballooncloud,
	groundpoundeffect,
	noisegrounddash,
	bubblepop,
}

var p;

if (instance_number(obj_particlesystem) > 1)
{
    instance_destroy();
    exit;
}

depth = -99;
global.particle_system = part_system_create();
global.part_map = ds_map_create();
global.part_depth = ds_map_create();
global.part_emitter = part_emitter_create(global.particle_system);
global.debris_list = ds_list_create();
global.collect_list = ds_list_create();
p = declare_particle(UnknownEnum.Value_1, spr_cloudeffect, 0.5, 99);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(UnknownEnum.Value_2, spr_crazyrunothereffect, 0.5, -99);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(UnknownEnum.Value_3, spr_highjumpcloud1, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(UnknownEnum.Value_4, spr_highjumpcloud2, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(UnknownEnum.Value_5, spr_jumpdust, 0.35, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(UnknownEnum.Value_6, spr_balloonpop, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(UnknownEnum.Value_7, spr_shotgunimpact, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(UnknownEnum.Value_8, spr_impact, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(UnknownEnum.Value_9, spr_genericpoofeffect, 1, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(UnknownEnum.Value_10, spr_keyparticles, 0.35, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(UnknownEnum.Value_11, spr_teleporteffect, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(UnknownEnum.Value_12, spr_landcloud, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
