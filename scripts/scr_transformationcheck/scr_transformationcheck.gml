function scr_transformationcheck()
{
    var i;
    
    for (i = 0; i < array_length(transformation); i++)
    {
        if (state == transformation[i])
            return 0;
    }
    
    return 1;
}
