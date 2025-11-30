// Initialize mods
for (local.i=0; local.i<ds_list_size(global.mod_list); local.i+=1;)
{
    local.dir = ds_list_find_value(global.mod_list,local.i);
    local.file = local.dir+"\SCR\LOAD\load_scr.gml";
    if file_exists(local.file) { execute_file(local.file); }
    // Draw
    draw_clear_alpha(c_black,0);
    draw_text_transformed(view_wview[view_current]/2,view_hview[view_current]*0.9,"Initializing mods ("+string(local.i)+")...",1,1,0);
    screen_refresh();
}
// Draw (hope this works)
draw_clear_alpha(c_black,0);
draw_text_transformed(view_wview[view_current]/2,view_hview[view_current]*0.9,"Initializes mods!",1,1,0);
screen_refresh();