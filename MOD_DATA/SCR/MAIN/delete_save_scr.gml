/*
Argument 0: Save name
*/
local.index = ds_list_find_index(global.save_list,string(argument0));
if local.index >= 0
{
    ds_list_delete(global.save_list,local.index);
    ini_open("saves.ini");
    ini_write_string("SAVES","SAVES",ds_list_write(global.save_list));
    ini_close();
    file_delete("save_"+string(argument0)+".ini");
}