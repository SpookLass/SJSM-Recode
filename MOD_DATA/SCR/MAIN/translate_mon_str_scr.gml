/*
Argument 0: Translation Key
Argument 1: Monster name value
Open the ini before running
*/
switch argument1
{
    // OG
    case name_num_og_const:
    {
        if ini_key_exists("NAME",argument0+"_num_og") { return ini_read_string("NAME",argument0+"_num_og","NAME_"+argument0+"_num_og"); } 
        if ini_key_exists("NAME",argument0+"_num") { return ini_read_string("NAME",argument0+"_num","NAME_"+argument0+"_num"); }
    }
    case name_og_const:
    {
        if ini_key_exists("NAME",argument0+"_og") { return ini_read_string("NAME",argument0+"_og","NAME_"+argument0+"_og"); } 
        return ini_read_string("NAME",argument0,"NAME_"+argument0);
    }
    // HD
    case name_num_hd_const:
    {
        if ini_key_exists("NAME",argument0+"_num_hd") { return ini_read_string("NAME",argument0+"_num_hd","NAME_"+argument0+"_num_hd"); } 
        if ini_key_exists("NAME",argument0+"_num") { return ini_read_string("NAME",argument0+"_num","NAME_"+argument0+"_num"); }
    }
    case name_hd_const:
    {
        if ini_key_exists("NAME",argument0+"_hd") { return ini_read_string("NAME",argument0+"_hd","NAME_"+argument0+"_hd"); }
        return ini_read_string("NAME",argument0,"NAME_"+argument0);
    }
    // Fanon
    case name_fanon_const:
    {
        if ini_key_exists("NAME",argument0+"_fanon") { return ini_read_string("NAME",argument0+"_fanon","NAME_"+argument0+"_fanon"); }
        if ini_key_exists("NAME",argument0+"_hd") { return ini_read_string("NAME",argument0+"_hd","NAME_"+argument0+"_hd"); }
    }
    // Recode
    default: { return ini_read_string("NAME",argument0,"NAME_"+argument0); }
}