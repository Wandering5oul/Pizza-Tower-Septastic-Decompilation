if (room == rm_editor)
    exit;

if (global.collectsound < 10)
    global.collectsound += 1;

if (global.timeattack == 1)
    instance_destroy();

if (place_meeting(x, y, obj_destructibles))
    depth = 102;
else
    depth = 2;

if (object_index == obj_bigescapecollect)
{
    if (global.panic == 1)
        image_alpha = 1;
}
