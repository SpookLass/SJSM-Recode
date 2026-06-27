/*
Argument 0: Room Count
Returns the number of elevators the player has been through (hopefully)
*/
local.prog = 0;
local.rm = argument0;
// Rate 1
if local.rm <= global.ele_end_01_var || global.ele_type_var <= 0
{
    if global.ele_rate_01_var <= 0 { return local.prog; }
    return local.prog+floor(local.rm/global.ele_rate_01_var);
}
if global.ele_rate_01_var > 0
{ local.prog += floor(global.ele_end_01_var/global.ele_rate_01_var); }
local.rm -= global.ele_end_01_var;
// Rate 2
local.end2 = global.ele_end_02_var-global.ele_end_01_var;
if local.rm <= local.end2 || global.ele_type_var <= 1
{
    if global.ele_rate_02_var <= 0 { return local.prog; }
    return local.prog+floor(local.rm/global.ele_rate_02_var);
}
if global.ele_rate_02_var > 0
{ local.prog += floor(local.end2/global.ele_rate_02_var); }
local.rm -= local.end2;
// Rate 3
if global.ele_rate_03_var <= 0 { return local.prog; }
return local.prog+floor(local.rm/global.ele_rate_03_var);