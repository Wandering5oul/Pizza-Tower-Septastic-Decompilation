trigger = 6;

func = function(argument0)
{
    if (!active)
    {
        if (following_has_follower(736))
        {
            active = 1;
            instance_destroy(obj_alienfollow);
        }
    }
};
