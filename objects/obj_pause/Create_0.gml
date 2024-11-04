var i;

scr_initinput();
eyelist = ds_list_create();
pause_create_eyes();
pause = false;
i = 0;
color = make_color_rgb(121, 103, 151);
selected = 0;
stickpressed_h = 0;
stickpressed_v = 0;
image_speed = 0;
depth = -998;
pause_menu = ["RESUME", "OPTIONS", "RESTART LEVEL", "EXIT LEVEL"];
cursor_index = 0;
cursor_sprite_number = sprite_get_number(spr_cursor);
cursor_sprite_height = sprite_get_height(spr_cursor);
peppino_sprite = spr_player_idle;
peppino_sprite_number = sprite_get_number(peppino_sprite);
peppino_index = 0;
toppin_sprite[0] = spr_toppinshroom;
toppin_sprite[1] = spr_toppincheese;
toppin_sprite[2] = spr_toppintomato;
toppin_sprite[3] = spr_toppinsausage;
toppin_sprite[4] = spr_toppinpineapple;

for (i = 0; i < array_length(toppin_sprite); i++)
{
    toppin_number[i] = sprite_get_number(toppin_sprite[i]);
    toppin_index[i] = 0;
    toppin_has[i] = false;
}

pause_screenshot = -4;
pause_music = 175;
scroll = 0;
alpha = 0;
global.roomtorestart = room;
border_x = 960 + sprite_get_width(spr_pause_border);
border_y = 540 + sprite_get_height(spr_pause_border);
text_y = -100;
