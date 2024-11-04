if (grounded && other.sprite_index == spr_swordstone && (state == UnknownEnum.Value_42 || state == UnknownEnum.Value_80 || state == UnknownEnum.Value_43))
{
    scr_soundeffect(104);
    global.SAGEknighttaken = 1;
    momentum = 0;
    movespeed = 0;
    other.image_index = 1;
    image_index = 0;
    image_speed = 0.35;
    sprite_index = spr_knightpepstart;
    state = UnknownEnum.Value_47;
    hsp = 0;
    vsp = 0;
    tv_push_prompt_once(tv_create_prompt("This is the knight transformation text", UnknownEnum.Value_2, 622, 3), "knight");
}
