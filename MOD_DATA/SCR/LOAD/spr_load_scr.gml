/*
Argument 0: Print
*/
// Get the first file in the main directory
local.i = 0;
local.file = file_find_first(main_directory_const+"\SPR\MAIN\*.png",-1);
// Not sure why, but it doesn't include the path.
while (local.file != "")
{
    file_to_spr_scr(main_directory_const+"\SPR\MAIN\"+local.file,filename_change_ext(local.file,""),1,false,false,0,0,argument0);
    local.file = file_find_next();
    local.i += 1;
    // Draw
    draw_clear_alpha(c_black,0);
    draw_text_transformed(view_wview[view_current]/2,view_hview[view_current]*0.9,"Loading sprites ("+string(local.i)+")...",1,1,0);
    screen_refresh();
}
file_find_close();
// Draw
draw_clear_alpha(c_black,0);
draw_text_transformed(view_wview[view_current]/2,view_hview[view_current]*0.9,"Loading vanilla sprites...",1,1,0);
screen_refresh();
// Player
file_to_spr_scr(vanilla_directory_const+"\TEX\sprites\EX_03_spr.png","ghost_spr",3,false,false,0,0,argument0);
// Spooky
file_to_spr_scr(vanilla_directory_const+"\TEX\sprites\spooky_spr.png","spooky_spr",9,false,false,0,0,argument0);
file_to_spr_scr(vanilla_directory_const+"\TEX\sprites\spooky2_spr.png","spooky_sad_spr",9,false,false,0,0,argument0);
file_to_spr_scr(vanilla_directory_const+"\TEX\sprites\spooky3_spr.png","spooky_halloween_spr",9,false,false,0,0,argument0);
// Replaceable
file_to_spr_scr(vanilla_directory_const+"\TEX\WALL_01L0.png","light_wall_spr",2,false,false,0,0,argument0);
file_to_spr_scr(vanilla_directory_const+"\TEX\FLOOR_01L0.png","light_floor_spr",2,false,false,0,0,argument0);
// Stored so it can easily be replaced
globalvar light_wall_obj_spr;
globalvar light_floor_obj_spr;
light_wall_obj_spr = light_wall_spr;
light_floor_obj_spr = light_floor_spr;
// Mod stuff
for (local.i=0; local.i<ds_list_size(global.mod_list); local.i+=1;)
{
    local.dir = ds_list_find_value(global.mod_list,local.i);
    local.file = file_find_first(local.dir+"\SPR\MAIN\*.png",-1);
    local.i = 0;
    while (local.file != "")
    {
        file_to_spr_scr(local.dir+"\SPR\MAIN\"+local.file,filename_change_ext(local.file,""),1,false,false,0,0,argument0);
        local.file = file_find_next();
        local.i += 1;
        // Draw
        draw_clear_alpha(c_black,0);
        draw_text_transformed(view_wview[view_current]/2,view_hview[view_current]*0.9,"Loading mod sprites ("+string(local.i)+")...",1,1,0);
        screen_refresh();
    }
    file_find_close();
}
// Draw
draw_clear_alpha(c_black,0);
draw_text_transformed(view_wview[view_current]/2,view_hview[view_current]*0.9,"Loaded sprites!",1,1,0);
screen_refresh();