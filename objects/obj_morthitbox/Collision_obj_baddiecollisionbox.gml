var _lag;

if (!other.baddieID.invincible && other.baddieID.destroyable && playerid.state != UnknownEnum.Value_61 && other.baddieID.state != UnknownEnum.Value_137 && !other.baddieID.thrown)
{
    _lag = 5;
    other.baddieID.hp -= 6;
    other.baddieID.state = UnknownEnum.Value_137;
    other.baddieID.hitX = other.baddieID.x;
    other.baddieID.hitY = other.baddieID.y;
    other.baddieID.hitLag = _lag;
    Mort_DownMovement();
}
