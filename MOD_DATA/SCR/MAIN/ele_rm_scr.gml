/*
Argument 0: Room Count
Returns true if current room is an elevator room.
*/
local.prog = 0;
local.rm = argument0;
// Rate 1
if local.rm <= global.ele_end_01_var || global.ele_type_var <= 0
{ return (mod_scr(local.rm,global.ele_rate_01_var) == 0); }
local.rm -= global.ele_end_01_var;
// Rate 2
local.end2 = global.ele_end_02_var-global.ele_end_01_var;
if local.rm <= local.end2 || global.ele_type_var <= 1
{ return (mod_scr(local.rm,global.ele_rate_02_var) == 0); }
local.rm -= local.end2;
// Rate 3
return (mod_scr(local.rm,global.ele_rate_03_var) == 0);