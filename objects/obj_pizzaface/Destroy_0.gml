var _x, _y;

_x = savedx - savedcx;
_y = savedy - savedcy;

while (_x > 860)
    _x -= 20;

while (_y > 440)
    _y -= 20;

while (_x < 100)
    _x += 20;

while (_y < 100)
    _y += 20;

with (instance_create(x, y, obj_shakeanddie))
    sprite_index = other.spr_dead;

scr_soundeffect(42);
scr_soundeffect(55);
