function __background_get_internal(argument0, argument1, argument2)
{
    var __prop, __bind, __backinfo, __res, __backid, __layerid, __isfore;
    
    __prop = argument0;
    __bind = argument1;
    __backinfo = argument2;
    
    if (__backinfo[0] == -1 || layer_background_exists(__backinfo[1], __backinfo[0]) == 0)
    {
        __backinfo = __background_get_element(__bind);
        
        if (__backinfo[0] == -1)
            return -1;
    }
    
    __res = -1;
    __backid = __backinfo[0];
    __layerid = __backinfo[1];
    __isfore = __backinfo[2];
    
    switch (__prop)
    {
        case e__BG.Visible:
            __res = layer_get_visible(__layerid);
            break;
        
        case e__BG.Foreground:
            __res = __isfore;
            break;
        
        case e__BG.Index:
            __res = layer_background_get_sprite(__backid);
            break;
        
        case e__BG.X:
            __res = layer_get_x(__layerid);
            break;
        
        case 4:
            __res = layer_get_y(__layerid);
            break;
        
        case 5:
            __res = sprite_get_width(layer_background_get_index(__backid));
            break;
        
        case 6:
            __res = sprite_get_height(layer_background_get_index(__backid));
            break;
        
        case 7:
            __res = layer_background_get_htiled(__backid);
            break;
        
        case 8:
            __res = layer_background_get_vtiled(__backid);
            break;
        
        case 9:
            __res = layer_background_get_xscale(__backid);
            break;
        
        case 10:
            __res = layer_background_get_yscale(__backid);
            break;
        
        case 11:
            __res = layer_get_hspeed(__layerid);
            break;
        
        case 12:
            __res = layer_get_vspeed(__layerid);
            break;
        
        case 13:
            __res = layer_background_get_blend(__backid);
            break;
        
        case 14:
            __res = layer_background_get_alpha(__backid);
            break;
        
        default:
            break;
    }
    
    return __res;
}
