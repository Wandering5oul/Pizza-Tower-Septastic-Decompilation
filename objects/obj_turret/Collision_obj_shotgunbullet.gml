if (invtime <= 0)
{
    invtime = 15;
    hp--;
    scr_soundeffect(74);
}

instance_destroy(other);
