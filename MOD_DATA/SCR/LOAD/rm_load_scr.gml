/*
Argument 0: Print
*/
// Get the first file in the main directory
local.file = file_find_first(main_directory_const+"\RM\MAIN\*.gml",-1);
while (local.file != "")
{
    file_to_rm_scr(main_directory_const+"\RM\MAIN\"+local.file,filename_change_ext(local.file,""),argument0);
    local.file = file_find_next();
    local.i += 1;
    // Draw
    draw_clear_alpha(c_black,0);
    draw_text_transformed(view_wview[view_current]/2,view_hview[view_current]*0.9,"Loading rooms ("+string(local.i)+")...",1,1,0);
    screen_refresh();
}
file_find_close();
// Mod stuff
for (local.i=0; local.i<ds_list_size(global.mod_list); local.i+=1;)
{
    local.dir = ds_list_find_value(global.mod_list,local.i);
    local.file = file_find_first(local.dir+"\RM\MAIN\*.gml",-1);
    while (local.file != "")
    {
        file_to_rm_scr(local.dir+"\RM\MAIN\"+local.file,filename_change_ext(local.file,""),argument0);
        local.file = file_find_next();
        local.i += 1;
        // Draw
        draw_clear_alpha(c_black,0);
        draw_text_transformed(view_wview[view_current]/2,view_hview[view_current]*0.9,"Loading mod rooms ("+string(local.i)+")...",1,1,0);
        screen_refresh();
    }
    file_find_close();
}
// Draw
draw_clear_alpha(c_black,0);
draw_text_transformed(view_wview[view_current]/2,view_hview[view_current]*0.9,"Loaded roomse!",1,1,0);
screen_refresh();