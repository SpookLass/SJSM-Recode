// Initialize mods
for (local.i=0; local.i<ds_list_size(global.mod_list); local.i+=1;)
{
    local.dir = ds_list_find_value(global.mod_list,local.i);
    local.file = local.dir+"\SCR\LOAD\load_scr.gml";
    if file_exists(local.file) { execute_file(local.file,local.dir); }
    // Draw
    draw_load_scr("Initializing mods ("+string(local.i)+")...");
}
// Draw (hope this works)
draw_load_scr("Initialized mods!");