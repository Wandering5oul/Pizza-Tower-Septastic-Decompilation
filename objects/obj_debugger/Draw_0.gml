if (bbox)
{
    with (all)
    {
        draw_set_color(c_white);
        
        if (!object_is_ancestor(object_index, par_door) && !object_is_ancestor(object_index, par_collision) && object_index != obj_camera)
            draw_rectangle(bbox_left + 1, bbox_top + 1, bbox_right - 2, bbox_bottom - 2, true);
        
        draw_set_alpha(1);
    }
}
