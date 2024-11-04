var player, baddie, _hsp_multi;

player = other.id;
baddie = id;

if (state == UnknownEnum.Value_80 && image_index > 8 && image_index < 12)
{
    scr_hurtplayer(player);
}
else
{
    with (other)
    {
        if (instakillmove == 1 && baddie.state != UnknownEnum.Value_4 && baddie.thrown == 0 && !baddie.invincible)
        {
            if (state == UnknownEnum.Value_121 && sprite_index != spr_mach3hit && (character == "P" || character == "V"))
            {
                if (fightball == 0)
                    sprite_index = spr_mach3hit;
                
                image_index = 0;
            }
            
            if (state == UnknownEnum.Value_104 && grounded)
            {
                machpunchAnim = 1;
                image_index = 0;
            }
            
            if (state != UnknownEnum.Value_107)
                baddie.grabbedby = 1;
            else
                baddie.grabbedby = 2;
            
            scr_soundeffect(74);
            
            if (state == UnknownEnum.Value_121)
            {
                instance_destroy(baddie);
            }
            else
            {
                _hsp_multi = 2;
                baddie.hsp = sign(baddie.x - x) * _hsp_multi;
                
                if (baddie.hsp == 0)
                    baddie.hsp = -baddie.image_xscale * _hsp_multi;
                
                baddie.vsp = -8;
                baddie.stunned = baddie.inv_max;
                baddie.state = UnknownEnum.Value_138;
                baddie.inv_stun = 1;
                baddie.inv_timer = baddie.inv_max;
                baddie.hp--;
                
                if (baddie.hp <= 0)
                    instance_destroy(baddie);
            }
            
            if (!baddie.important)
            {
                global.hit += 1;
                global.combotime = 60;
                global.heattime = 60;
            }
            
            if (!grounded && state != UnknownEnum.Value_108 && key_jump2)
            {
                if (state == UnknownEnum.Value_104 || (state == UnknownEnum.Value_121 && fightball == 0))
                    sprite_index = spr_mach2jump;
                
                suplexmove = 0;
                vsp = -11;
            }
        }
    }
}
