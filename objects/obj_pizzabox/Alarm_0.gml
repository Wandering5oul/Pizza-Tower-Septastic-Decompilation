switch (image_index)
{
    case 0:
        content = 465;
        break;
    
    case 1:
        content = 466;
        break;
    
    case 2:
        content = 467;
        break;
    
    case 3:
        content = 468;
        break;
    
    case 4:
        content = 469;
        break;
    
    case 5:
        content = 465;
        image_index = 0;
        break;
}

if (room != rm_editor)
{
    with (instance_create(x, y, obj_pizzaboxunopen))
        content = other.content;
    
    instance_destroy();
}
