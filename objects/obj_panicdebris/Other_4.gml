var lay_id, back_id, lay_id2, back_id2, lay_id3, back_id3;

lay_id = layer_get_id("Backgrounds_1");
back_id = layer_background_get_id(lay_id);
lay_id2 = layer_get_id("Backgrounds_2");
back_id2 = layer_background_get_id(lay_id2);
lay_id3 = layer_get_id("Backgrounds_3");
back_id3 = layer_background_get_id(lay_id3);

if (global.panic == 1 && layer_background_get_sprite(back_id) == 1731)
    layer_background_sprite(back_id, 1896);

if (global.panic == 1 && layer_background_get_sprite(back_id) == 1728)
    layer_background_sprite(back_id, 1895);

if (global.panic == 1 && layer_background_get_sprite(back_id3) == 1733)
    layer_background_sprite(back_id3, 1900);

if (global.panic == 1 && layer_background_get_sprite(back_id) == 1690)
    layer_background_sprite(back_id, 1858);

if (global.panic == 1 && layer_background_get_sprite(back_id) == 1693)
    layer_background_sprite(back_id, 1861);

if (global.panic == 1 && layer_background_get_sprite(back_id2) == 1695)
    layer_background_sprite(back_id2, 1863);

if (global.panic == 1 && layer_background_get_sprite(back_id) == 1780)
    layer_background_sprite(back_id, 1948);

if (global.panic == 1 && layer_background_get_sprite(back_id2) == 1778)
    layer_background_sprite(back_id2, 1946);

if (global.panic == 1 && layer_background_get_sprite(back_id3) == 1775)
    layer_background_sprite(back_id3, 1943);
