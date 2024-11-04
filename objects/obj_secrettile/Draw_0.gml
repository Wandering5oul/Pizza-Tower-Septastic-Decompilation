var k, _w, i, b, _index, xi, yi, j, _l, _t;

if (array_length(tiles) > 0)
{
    for (k = 0; k < array_length(tilemap_sprite); k++)
    {
        if (tilemap_sprite[k] != -4)
        {
            _w = sprite_get_width(tilemap_sprite[k]) / 32;
            
            for (i = 0; i < array_length(tiles[k]); i++)
            {
                b = tiles[k][i];
                _index = b[0];
                xi = 0;
                yi = 0;
                
                for (j = 0; j < _index; j++)
                {
                    xi++;
                    
                    if (xi >= _w)
                    {
                        xi = 0;
                        yi++;
                    }
                }
                
                _l = xi * 32;
                _t = yi * 32;
                draw_sprite_part_ext(tilemap_sprite[k], 0, _l, _t, 32, 32, b[1], b[2], 1, 1, c_white, alpha);
            }
        }
    }
}
