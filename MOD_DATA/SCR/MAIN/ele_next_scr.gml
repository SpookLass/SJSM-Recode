/*
Argument 0: Room Count
Returns the next elevator room.
*/
local.rm = argument0;
// Rate 1
if local.rm < global.ele_end_01_var || global.ele_type_var <= 0
{
    if global.ele_rate_01_var > 0
    {
        local.next = global.ele_rate_01_var*(floor(local.rm/global.ele_rate_01_var)+1);
        if local.next >= global.ele_end_01_var && global.ele_type_var > 0 { return global.ele_end_01_var; }
        return local.next;
    }
    if global.ele_type_var <= 0 { return noone; }
}
local.rm -= global.ele_end_01_var;
// Rate 2
local.end2 = global.ele_end_02_var-global.ele_end_01_var;
if local.rm < local.end2 || global.ele_type_var <= 1
{
    if global.ele_rate_02_var > 0
    {
        local.next = global.ele_rate_02_var*(floor(local.rm/global.ele_rate_02_var)+1);
        if local.next >= local.end2 && global.ele_type_var > 1 { return global.ele_end_02_var; }
        return global.ele_end_01_var+local.next;
    }
    if global.ele_type_var <= 1 { return noone; }
}
local.rm -= local.end2;
// Rate 3
if global.ele_rate_03_var > 0
{ return local.end2+(global.ele_rate_03_var*(floor(local.rm/global.ele_rate_03_var)+1)); }
return noone;