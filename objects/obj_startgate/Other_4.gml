switch (targetRoom)
{
    case 23:
        leveli = 0;
        break;
    
    case 31:
        leveli = 1;
        break;
    
    case 43:
        leveli = 2;
        break;
    
    case 59:
        leveli = 3;
        break;
    
    case 86:
        leveli = 4;
        break;
    
    case 110:
        leveli = 5;
        break;
    
    case 126:
        leveli = 6;
        break;
    
    case 149:
        leveli = 7;
        break;
    
    case 170:
        leveli = 8;
        break;
    
    case 190:
        leveli = 9;
        break;
    
    case 232:
        leveli = 10;
        break;
    
    case 244:
        leveli = 12;
        break;
    
    case 402:
        leveli = 13;
        break;
    
    case 589:
        leveli = 14;
        break;
    
    case 542:
        leveli = 15;
        break;
    
    case 436:
        leveli = 16;
        break;
    
    case 453:
        leveli = 17;
        break;
    
    case 417:
        leveli = 18;
        break;
    
    case 482:
        leveli = 19;
        break;
}

world = floor(leveli / 4);
ini_open_from_string(obj_savesystem.ini_str);
highscore = ini_read_real("Highscore", string(level), 0);
secret_count = ini_read_string("Secret", string(level), 0);
toppin[0] = ini_read_real("Toppin", string(level) + "1", 0);
toppin[1] = ini_read_real("Toppin", string(level) + "2", 0);
toppin[2] = ini_read_real("Toppin", string(level) + "3", 0);
toppin[3] = ini_read_real("Toppin", string(level) + "4", 0);
toppin[4] = ini_read_real("Toppin", string(level) + "5", 0);
ini_close();

switch (level)
{
    case "entrance":
        msg = "ENTRANCE";
        break;
    
    case "medieval":
        msg = "PIZZASCAPE";
        break;
    
    case "chateau":
        msg = "PIZZASCARE";
        break;
    
    case "ruin":
        msg = "TEH ANCIENT CHEESE";
        break;
    
    case "dungeon":
        msg = "BLOODSAUCE DUNGEON";
        break;
    
    case "floorroom":
        msg = "OREGANO DESERT";
        break;
    
    case "graveyard":
        msg = "THE WASTEYARD";
        break;
    
    case "farm":
        msg = "FUN FARM";
        break;
    
    case "ufo":
        msg = "SPACE PINBALL";
        break;
    
    case "strongcold":
        msg = "STRONGCOLD";
        break;
    
    case "forest":
        msg = "GNOME FOREST";
        break;
    
    case "beach":
        msg = "PINEAPPLE BEACH";
        break;
    
    case "dragonlair":
        msg = "DRAGON LAIR";
        break;
    
    case "snickchallenge":
        msg = "SNICK CHALLENGE";
        break;
}
