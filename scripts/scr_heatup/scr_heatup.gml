function scr_heatup()
{
    global.baddiespeed += 0;
    
    if (global.stylethreshold == 0)
        global.baddiepowerup = 0;
    
    if (global.stylethreshold >= 0)
    {
        global.baddierage = 0;
        obj_heatafterimage.visible = true;
    }
    
    with (obj_tv)
    {
        message = "HEAT UP!!";
        alarm[0] = 200;
        showtext = 1;
    }
    
    obj_stylebar.toggle = 1;
    obj_stylebar.alarm[0] = 5;
}
