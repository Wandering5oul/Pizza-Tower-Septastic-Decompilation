var j, m, i, move, os, option, move2, b;

j = 0;
m = menus[menu];

if (instance_exists(obj_keyconfig))
    j = 4;

if (m.menu_id >= UnknownEnum.Value_7 && m.menu_id <= UnknownEnum.Value_11)
    j = 4;
else if (m.menu_id >= UnknownEnum.Value_2 && m.menu_id <= UnknownEnum.Value_5)
    j = 2;
else if (m.menu_id == UnknownEnum.Value_1)
    j = 1;
else if (m.menu_id == UnknownEnum.Value_6)
    j = 3;

for (i = 0; i < array_length(bg_alpha); i++)
{
    if (i == j)
        bg_alpha[i] = Approach(bg_alpha[i], 1, 0.1);
    else
        bg_alpha[i] = Approach(bg_alpha[i], 0, 0.05);
}

bg_x -= 1;
bg_y -= 1;

if (instance_exists(obj_keyconfig) || instance_exists(obj_screenconfirm))
    exit;

scr_getinput();
key_back = false;

if (backbuffer > 0)
{
    backbuffer--;
    key_jump = false;
    key_back = false;
}

move = key_down2 - key_up2;

if (move != 0)
{
    slidebuffer = 0;
    slidecount = 0;
}

os = optionselected;
optionselected += move;
optionselected = clamp(optionselected, 0, array_length(m.options) - 1);

if (os != optionselected)
    scr_soundeffect(69);

option = m.options[optionselected];
move2 = key_left2 + key_right2;

switch (option.type)
{
    case UnknownEnum.Value_2:
        if (key_jump && option.func != -4)
        {
            scr_soundeffect(25, 31, 218);
            option.func();
        }
        
        break;
    
    case UnknownEnum.Value_0:
        if (key_jump || -key_left2 || key_right2)
        {
            scr_soundeffect(69);
            option.value = !option.value;
            
            if (option.on_changed != -4)
                option.on_changed(option.value);
        }
        
        break;
    
    case UnknownEnum.Value_1:
        if (move2 != 0)
        {
            scr_soundeffect(69);
            option.value += move2;
            
            if (option.value > (array_length(option.values) - 1))
                option.value = 0;
            
            if (option.value < 0)
                option.value = array_length(option.values) - 1;
            
            if (option.on_changed != -4)
                option.on_changed(option.values[option.value].value);
        }
        
        break;
    
    case UnknownEnum.Value_3:
        move2 = key_left + key_right;
        
        if (move2 != 0 && slidebuffer <= 0)
        {
            option.moved = true;
            option.value += move2;
            option.value = clamp(option.value, 0, 100);
            slidebuffer = 1;
        }
        
        if (move2 != 0)
            option.moving = true;
        
        if (move2 == 0)
        {
            slidecount = 0;
            option.moving = false;
        }
        
        break;
}

for (i = 0; i < array_length(m.options); i++)
{
    b = m.options[i];
    
    if (b.type == UnknownEnum.Value_3)
    {
        if (b.moved && (move2 == 0 || optionselected != i))
        {
            b.moved = false;
            b.moving = false;
            
            if (b.on_changed != -4)
                b.on_changed(b.value);
        }
        
        if (b.on_move != -4 && b.moving)
            b.on_move(b.value);
        
        if (b.sound != -4)
        {
        }
    }
}

if (menu == UnknownEnum.Value_0)
    scr_pauseicons_update(optionselected);
else
    scr_pauseicons_update(-1);

if (slidebuffer > 0)
    slidebuffer--;

if ((key_back || key_slap2 || keyboard_check_pressed(vk_escape)) && !instance_exists(obj_keyconfig) && !instance_exists(obj_audioconfig))
{
    scr_soundeffect(232);
    
    if (menu == UnknownEnum.Value_0)
    {
        if (instance_exists(obj_mainmenuselect))
            obj_mainmenuselect.selected = false;
        
        if (instance_exists(obj_mainmenu))
            obj_mainmenu.optionbuffer = 2;
        
        instance_destroy();
    }
    else
    {
        for (i = 0; i < array_length(m.options); i++)
        {
            b = m.options[i];
            
            if (b.type == UnknownEnum.Value_3)
            {
            }
        }
        
        menu_goto(m.backmenu);
    }
}
