switch (image_index)
{
    case 0:
        contentEditor = 371;
        break;
    
    case 1:
        contentEditor = 241;
        break;
    
    case 2:
        contentEditor = 381;
        break;
    
    case 3:
        contentEditor = 377;
        break;
    
    case 4:
        contentEditor = 380;
        break;
    
    case 5:
        contentEditor = 401;
        break;
    
    case 6:
        contentEditor = 403;
        break;
}

with (instance_create_layer(x, y, "Level_structure", obj_baddiespawner))
    content = other.contentEditor;
