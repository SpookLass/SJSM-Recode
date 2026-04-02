/*
Returns whether or not doors should lock based on global.lock_var
*/
switch global.lock_var
{
    case 0: { return false; }
    case 1: { return !instance_exists(enemy_par_obj); }
    case 2: case 3: { return true; }
}