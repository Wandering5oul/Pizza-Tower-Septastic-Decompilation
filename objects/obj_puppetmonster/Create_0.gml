var a, lowestdepth, i, b;

hsp = 0;
vsp = 0;
hsp_carry = 0;
scr_collision_init();
platformid = -4;
grav = 0.5;
grounded = 0;
event_inherited();
monsterid = 2;
spr_dead = spr_monstercheese_dead;
state = 215;
xs = room_width / 2;
ys = -100;
substate = 135;
backgroundID = -4;
a = layer_get_all();
lowestdepth = 10000;

for (i = 0; i < array_length(a); i++)
{
    b = a[i];
    
    if (layer_get_element_type(b) == 1)
    {
        trace("layer background");
        
        if (layer_get_depth(b) < lowestdepth)
        {
            backgroundID = layer_background_get_id(b);
            lowestdepth = layer_get_depth(b);
            trace(lowestdepth);
        }
    }
}

trace(backgroundID);
trace(a);
