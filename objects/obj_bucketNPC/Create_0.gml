event_inherited();
dialog[0] = dialog_create("...", -4, function()
{
    obj_bucketNPC.alarm[0] = 5 * room_speed;
});
portrait = spr_dialogue_bucket;
dialogsnd = [-4];

if (obj_player.ispeppino)
    instance_destroy();

bucket = true;
talking = false;
