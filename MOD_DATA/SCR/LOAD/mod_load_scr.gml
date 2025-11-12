// Mod list
ini_open("mods.ini");
globalvar mod_list;
global.mod_list = ds_list_create();
ds_list_clear(global.mod_list);
ds_list_read(global.mod_list,ini_read_string("MODS","mods",ds_list_write(global.mod_list)));
ini_close();
// Mod load list
globalvar mod_load_list;
global.mod_load_list = ds_list_create();
ds_list_clear(global.mod_load_list);
// Get the first file in the mod directory
local.file = file_find_first(working_directory+"\MODS\*",fa_directory);
while (local.file != "")
{
    // Not sure why, but it doesn't include the path.
    ds_list_add(global.mod_load_list,working_directory+"\MODS\"+local.file);
    file_find_next();
}
file_find_close();