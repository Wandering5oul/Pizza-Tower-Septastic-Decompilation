trigger = 7;

func = function(argument0)
{
    if (!active)
    {
        if (following_count(174) >= 3)
        {
            active = 1;
            instance_destroy(obj_chickenfollow);
        }
    }
};
