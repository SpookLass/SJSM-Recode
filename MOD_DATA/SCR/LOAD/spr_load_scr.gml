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
    draw_load_scr("Loading sprites ("+string(local.i)+")...");
}
file_find_close();
// Draw
draw_load_scr("Loading vanilla sprites ("+string(local.i)+")...");
// Player
file_to_spr_scr(vanilla_directory_const+"\TEX\sprites\EX_03_spr.png","ghost_spr",3,false,false,0,0,argument0);
sprite_set_offset(ghost_spr,sprite_get_width(ghost_spr)/2,sprite_get_height(ghost_spr)/2);
// Spooky
file_to_spr_scr(vanilla_directory_const+"\TEX\sprites\spooky_spr.png","spooky_spr",9,false,false,0,0,argument0);
sprite_set_offset(spooky_spr,sprite_get_width(spooky_spr)/2,108);
file_to_spr_scr(vanilla_directory_const+"\TEX\sprites\spooky2_spr.png","spooky_sad_spr",9,false,false,0,0,argument0);
file_to_spr_scr(vanilla_directory_const+"\TEX\sprites\spooky3_spr.png","spooky_halloween_spr",9,false,false,127,108,argument0);
file_to_spr_scr(vanilla_directory_const+"\TEX\sprites\MS28_01_spr.png","wf_spr",8,false,false,0,0,argument0);
sprite_set_offset(wf_spr,sprite_get_width(wf_spr)/2,23);
// Replaceable
file_to_spr_scr(vanilla_directory_const+"\TEX\WALL_01L0.png","light_wall_spr",2,false,false,0,0,argument0);
file_to_spr_scr(vanilla_directory_const+"\TEX\FLOOR_01L0.png","light_floor_spr",2,false,false,0,0,argument0);
// Stored so it can easily be replaced
globalvar light_wall_obj_spr;
globalvar light_floor_obj_spr;
light_wall_obj_spr = light_wall_spr;
light_floor_obj_spr = light_floor_spr;
// Mod stuff
for (local.j=0; local.j<ds_list_size(global.mod_list); local.j+=1;)
{
    local.dir = ds_list_find_value(global.mod_list,local.j);
    local.file = file_find_first(local.dir+"\SPR\MAIN\*.png",-1);
    local.i = 0;
    while (local.file != "")
    {
        file_to_spr_scr(local.dir+"\SPR\MAIN\"+local.file,filename_change_ext(local.file,""),1,false,false,0,0,argument0);
        local.file = file_find_next();
        local.i += 1;
        // Draw
        draw_load_scr("Loading mod sprites ("+string(local.i)+")...");
    }
    file_find_close();
}
// Draw
draw_load_scr("Loaded sprites!");