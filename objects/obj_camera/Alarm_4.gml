var i;

if (room == timesuproom || is_bossroom())
{
    instance_destroy(obj_comboend);
    exit;
}

with (obj_comboend)
{
    for (i = 0; i < comboscore; i += comboscore)
        create_collect(obj_player1.x + irandom_range(-60, 60), (obj_player1.y - 100) + irandom_range(-60, 60), choose(1714, 1716, 1717, 1718, 1715));
    
    comboscore = 0;
    instance_destroy();
}

with (instance_create(x, y, obj_comboend))
{
    combo = global.savedcombo;
    comboscore = global.comboscore;
    comboscoremax = comboscore;
    combominus = round(comboscore / 50);
}

global.comboscore = 0;
global.savedcombo = 0;
