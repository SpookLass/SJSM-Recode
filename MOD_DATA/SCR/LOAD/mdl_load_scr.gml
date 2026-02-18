/*
Argument 0: Print
*/
// Get the first file in the main directory
local.i = 0;
local.file = file_find_first(main_directory_const+"\MDL\MAIN\*.gmmod",-1);
// Not sure why, but it doesn't include the path.
while (local.file != "")
{
    file_to_mdl_scr(main_directory_const+"\MDL\MAIN\"+local.file,filename_change_ext(local.file,""),argument0);
    local.file = file_find_next();
    local.i += 1;
    // Draw
    draw_load_scr("Loading models ("+string(local.i)+")...");
}
file_find_close();
// Mod stuff
for (local.j=0; local.j<ds_list_size(global.mod_list); local.j+=1;)
{
    local.dir = ds_list_find_value(global.mod_list,local.j);
    local.i = 0;
    local.file = file_find_first(local.dir+"\MDL\MAIN\*.png",-1);
    while (local.file != "")
    {
        file_to_mdl_scr(local.dir+"\MDL\MAIN\"+local.file,filename_change_ext(local.file,""),argument0);
        local.file = file_find_next();
        local.i += 1;
        // Draw
        draw_load_scr("Loading mod models ("+string(local.i)+")...");
    }
    file_find_close();
}
// Draw
draw_load_scr("Loaded models!");