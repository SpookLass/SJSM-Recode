/*
Argument 0: List
Argument 1: Entry
*/
if ds_list_find_index(argument0,argument1) < 0
{ ds_list_add(argument0,argument1); }