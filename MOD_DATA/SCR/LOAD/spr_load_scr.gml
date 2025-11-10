/*
Argument 0: Print
*/
// Get the first file in the main directory
local.file = file_find_first(main_directory_const+"\SPR\MAIN\*.png",-1);
// Not sure why, but it doesn't include the path.
while (local.file != "")
{
    file_to_spr_scr(main_directory_const+"\SPR\MAIN\"+local.file,filename_change_ext(local.file,""),1,false,false,0,0,argument0);
    local.file = file_find_next();
}
file_find_close();
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