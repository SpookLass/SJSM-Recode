/*
Argument 0: Translation Key
Open language file first
*/
local.def = ini_read_string("NAME",argument0,"NAME_"+argument0);
switch global.name_var
{
    case name_og_const: { return ini_read_string("NAME",argument0+"_og",local.def); break; }
    case name_hd_const: { return ini_read_string("NAME",argument0+"_hd",local.def); break; }
    case name_og_num_const: { return ini_read_string("NAME",argument0+"_og_num",local.def); break; }
    case name_hd_num_const: { return ini_read_string("NAME",argument0+"_hd_num",local.def); break; }
    case name_fanon_const: { return ini_read_string("NAME",argument0+"_fanon",local.def); break; }
    default: { return local.def; break; }
}