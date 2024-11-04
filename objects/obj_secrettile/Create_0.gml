var i, lay_id, map_id, ts, t, yy, xx, _x, _y, data, _id;

alpha = 1;
depth = -8;
tiles[0] = array_create(0);
tiles[1] = array_create(0);
tiles[2] = array_create(0);

for (i = 0; i < 3; i++)
{
    lay_id = layer_get_id(concat("Tiles_Secret", i + 1));
    tilemap_sprite[i] = -4;
    
    if (lay_id != -1)
    {
        map_id = layer_tilemap_get_id(lay_id);
        ts = tilemap_get_tileset(map_id);
        t = -4;
        
        switch (ts)
        {
            case 64:
                t = 1973;
                break;
            
            case 65:
                t = 1974;
                break;
            
            case 80:
                t = 2068;
                break;
            
            case 81:
                t = 2069;
                break;
            
            case 84:
                t = 2074;
                break;
            
            case 69:
                t = 2004;
                break;
            
            case 39:
                t = 1879;
                break;
            
            case 41:
                t = 1873;
                break;
            
            case 40:
                t = 1878;
                break;
            
            case 66:
                t = 1991;
                break;
            
            case 67:
                t = 1992;
                break;
            
            case 68:
                t = 1993;
                break;
            
            case 54:
                t = 1922;
                break;
            
            case 76:
                t = 2056;
                break;
            
            case 85:
                t = 2081;
                break;
            
            case 86:
                t = 2082;
                break;
            
            case 87:
                t = 2088;
                break;
            
            case 104:
                t = 1956;
                break;
            
            case 17:
                t = 2599;
                break;
            
            case 73:
                t = 2043;
                break;
            
            case 75:
                t = 2051;
                break;
            
            case 74:
                t = 2050;
                break;
            
            case 37:
                t = 1859;
                break;
            
            case 18:
                t = 2147;
                break;
            
            case 106:
                t = 2689;
                break;
            
            case 89:
                t = 2115;
                break;
            
            case 90:
                t = 2120;
                break;
            
            case 91:
                t = 2118;
                break;
            
            case 8:
                t = 1132;
                break;
            
            case 45:
                t = 1891;
                break;
            
            case 61:
                t = 1961;
                break;
            
            case 62:
                t = 1962;
                break;
            
            case 63:
                t = 1963;
                break;
            
            case 92:
                t = 2127;
                break;
            
            case 93:
                t = 2128;
                break;
            
            case 94:
                t = 2129;
                break;
            
            case 9:
                t = 332;
                break;
            
            case 101:
                t = 1560;
                break;
            
            case 97:
                t = 1018;
                break;
            
            case 77:
                t = 2064;
                break;
            
            case 78:
                t = 2066;
                break;
            
            case 79:
                t = 2067;
                break;
            
            case 24:
                t = 2746;
                break;
            
            case 12:
                t = 1927;
                break;
            
            case 110:
                t = 2545;
                break;
            
            case 5:
                t = 1251;
                break;
            
            case 22:
                t = 1944;
                break;
            
            case 6:
                t = 1346;
                break;
            
            case 113:
                t = 2083;
                break;
            
            case 11:
                t = 280;
                break;
        }
        
        tilemap_sprite[i] = t;
        
        for (yy = 0; yy < image_yscale; yy++)
        {
            for (xx = 0; xx < image_xscale; xx++)
            {
                _x = x + (xx * 32);
                _y = y + (yy * 32);
                data = tilemap_get_at_pixel(map_id, _x, _y);
                _id = tile_get_index(data);
                array_push(tiles[i], [_id, _x, _y]);
                data = tile_set_empty(data);
                tilemap_set_at_pixel(map_id, data, _x, _y);
            }
        }
    }
}

trace(tilemap_sprite);

if (array_length(tiles[0]) <= 0 && array_length(tiles[1]) <= 0 && array_length(tiles[2]) <= 0)
    instance_destroy();
