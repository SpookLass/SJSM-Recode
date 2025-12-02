// Mod list
ini_open("mods.ini");
globalvar mod_list;
global.mod_list = ds_list_create();
ds_list_clear(global.mod_list);
ds_list_read(global.mod_list,ini_read_string("MODS","mods",ds_list_write(global.mod_list)));
ini_close();
ds_list_add(global.mod_list,working_directory+"\MODS\PLUS");
ds_list_add(global.mod_list,working_directory+"\MODS\LEAN");
ds_list_add(global.mod_list,working_directory+"\MODS\SMALL_BAB");
ds_list_add(global.mod_list,working_directory+"\MODS\SCM");
//ds_list_add(global.mod_list,working_directory+"\MODS\EXAMPLE_MOD");
// Mod load list
globalvar mod_load_list;
global.mod_load_list = ds_list_create();
ds_list_clear(global.mod_load_list);
// Get the first file in the mod directory
local.i = 0;
local.file = file_find_first(working_directory+"\MODS\",fa_directory);
while (local.file != "")
{
    // Not sure why, but it doesn't include the path.
    ds_list_add(global.mod_load_list,working_directory+"\MODS\"+local.file);
    file_find_next();
    local.i += 1;
    // Draw
    draw_clear_alpha(c_black,0);
    draw_text_transformed(view_wview[view_current]/2,view_hview[view_current]*0.9,"Loading mods ("+string(local.i)+")...",1,1,0);
    screen_refresh();
}
file_find_close();
// Draw (hope this works)
draw_clear_alpha(c_black,0);
draw_text_transformed(view_wview[view_current]/2,view_hview[view_current]*0.9,"Loaded mods!",1,1,0);
screen_refresh();