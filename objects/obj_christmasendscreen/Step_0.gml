if (image_alpha < 1)
    image_alpha += 0.005;

if (image_alpha == 1 && obj_player1.key_jump2)
{
    scr_soundeffect(72);
    scr_playerreset();
    obj_player.state = UnknownEnum.Value_18;
    obj_player1.targetDoor = "A";
    room = Realtitlescreen;
}
