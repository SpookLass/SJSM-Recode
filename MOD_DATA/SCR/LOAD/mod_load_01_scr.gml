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
local.i = 0;
local.file = file_find_first(working_directory+"\MODS\*",fa_directory);
while (local.file != "")
{
    if local.file != "." && local.file != ".." { ds_list_add(global.mod_load_list,working_directory+"\MODS\"+local.file); }
    local.file = file_find_next();
    local.i += 1;
    // Draw
    draw_load_scr("Loading mods ("+string(local.i)+")...");
}
file_find_close();
// Draw (hope this works)
draw_load_scr("Loaded mods!");