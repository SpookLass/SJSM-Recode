/*
Argument 0: Monster theme
Argument 1: Theme
Argument 2: Max
Argument 3-5: Default for main, old, and Rom M
*/
switch argument0
{
    // Random
    case -2: { return irandom(argument2); }
    // Default
    case -1:
    {
        switch argument1
        {
            case 2: { return argument5; }
            case 1: { return argument4; }
        }
        return argument3;
    }
}
return argument0;