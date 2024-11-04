var _sw;

scr_initinput();
selected = 0;
ispeppino = true;

if (instance_exists(obj_player1))
    ispeppino = obj_player1.ispeppino;

text_arr[0] = ["Select Save", "Options", "Level Select", "Exit Game"];
text_arr[1] = ["Back", "Save 1", "Save 2", "Save 3"];
bg_x = 60;
scroll_x = 0;
pep_index = 0;
thunderalpha = 0;
ready = false;
_sw = sprite_get_width(spr_mainmenu_logo);
logo_x = 960 - (_sw / 2);
icon_offset = 0;
icon_index = 0;
icon_sprite = spr_mainmenu_noiseicon;
scroll_xtarget = 0;

if (!ispeppino)
{
    bg_x = -60;
    scroll_x = -960;
    scroll_xtarget = -960;
    icon_sprite = spr_mainmenu_peppinoicon;
    logo_x = _sw / 2;
}

icon_timer = 0;
icon_fade = 0;
saves = false;
file = 1;
uialpha = 1;
confirmscreen = false;
confirmselect = 0;
stickpressed_h = 0;
stickpressed_v = 0;
bgboil = 0;
clouds_x = 0;
cursor1_x = 0;
cursor1_y = 0;
cursor2_x = 0;
cursor2_y = 0;
cursor_index = 0;
stringwidth = 0;

draw_sprite_thunder = function(argument0, argument1, argument2, argument3)
{
    var thunderspr;
    
    thunderspr = asset_get_index(sprite_get_name(argument0) + "thunder");
    draw_sprite(argument0, argument1, argument2, argument3);
    draw_sprite_ext(thunderspr, argument1, argument2, argument3, 1, 1, 0, c_white, thunderalpha);
};
