if (global.panic && global.fill > 0 && !instance_exists(obj_ghostcollectibles))
    global.fill--;

if (global.fill <= 0 && global.panic && !instance_exists(obj_pizzaface))
{
    instance_create(obj_player1.x, obj_player1.y, obj_pizzaface);
    scr_soundeffect(97);
}
