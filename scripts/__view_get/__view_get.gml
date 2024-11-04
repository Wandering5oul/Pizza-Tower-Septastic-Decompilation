function __view_get(argument0, argument1)
{
    var __prop, __index, __res, __cam;
    
    __prop = argument0;
    __index = argument1;
    __res = -1;
    
    switch (__prop)
    {
        case e__VW.XView:
            __cam = view_get_camera(__index);
            __res = camera_get_view_x(__cam);
            break;
        
        case e__VW.YView:
            __cam = view_get_camera(__index);
            __res = camera_get_view_y(__cam);
            break;
        
        case e__VW.WView:
            __cam = view_get_camera(__index);
            __res = camera_get_view_width(__cam);
            break;
        
        case e__VW.HView:
            __cam = view_get_camera(__index);
            __res = camera_get_view_height(__cam);
            break;
        
        case 4:
            __cam = view_get_camera(__index);
            __res = camera_get_view_angle(__cam);
            break;
        
        case 5:
            __cam = view_get_camera(__index);
            __res = camera_get_view_border_x(__cam);
            break;
        
        case 6:
            __cam = view_get_camera(__index);
            __res = camera_get_view_border_y(__cam);
            break;
        
        case 7:
            __cam = view_get_camera(__index);
            __res = camera_get_view_speed_x(__cam);
            break;
        
        case 8:
            __cam = view_get_camera(__index);
            __res = camera_get_view_speed_y(__cam);
            break;
        
        case 9:
            __cam = view_get_camera(__index);
            __res = camera_get_view_target(__cam);
            break;
        
        case 10:
            __res = view_get_visible(__index);
            break;
        
        case 11:
            __res = view_get_xport(__index);
            break;
        
        case 12:
            __res = view_get_yport(__index);
            break;
        
        case 13:
            __res = view_get_wport(__index);
            break;
        
        case 14:
            __res = view_get_hport(__index);
            break;
        
        case 15:
            __res = view_get_camera(__index);
            break;
        
        case 16:
            __res = view_get_surface_id(__index);
            break;
        
        default:
            break;
    }
    
    return __res;
}
