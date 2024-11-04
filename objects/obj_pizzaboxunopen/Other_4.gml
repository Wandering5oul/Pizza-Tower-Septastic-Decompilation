if (global.timeattack == 1)
    instance_destroy();

if (ds_list_find_index(global.saveroom, id) != -1)
    instance_destroy();

if (content == 465 && global.shroomfollow)
    instance_destroy();

if (content == 466 && global.cheesefollow)
    instance_destroy();

if (content == 467 && global.tomatofollow)
    instance_destroy();

if (content == 468 && global.sausagefollow)
    instance_destroy();

if (content == 469 && global.pineapplefollow)
    instance_destroy();

if (global.snickchallenge == 1)
    instance_destroy();
