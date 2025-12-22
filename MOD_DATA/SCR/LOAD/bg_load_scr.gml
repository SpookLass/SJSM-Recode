/*
Argument 0: Print
*/
// Get the first file in the main directory
local.i = 0;
local.file = file_find_first(main_directory_const+"\BG\MAIN\*.png",-1);
// Not sure why, but it doesn't include the path.
while (local.file != "")
{
    file_to_bg_scr(main_directory_const+"\BG\MAIN\"+local.file,filename_change_ext(local.file,""),false,false,argument0);
    local.file = file_find_next();
    local.i += 1;
    // Draw
    draw_clear_alpha(c_black,0);
    draw_text_transformed(view_wview[view_current]/2,view_hview[view_current]*0.9,"Loading textures ("+string(local.i)+")...",1,1,0);
    screen_refresh();
}
file_find_close();
// Time for the manual stuff
draw_clear_alpha(c_black,0);
draw_text_transformed(view_wview[view_current]/2,view_hview[view_current]*0.9,"Loading vanilla textures...",1,1,0);
screen_refresh();
// Replaceable
file_to_bg_scr(vanilla_directory_const+"\TEX\WALL_01.png","wall_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\TEX\FLOOR_01.png","floor_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\TEX\ROOF_01.png","ceil_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\TEX\sprites\POS_07_spr.png","poster_01_bg",false,false,argument0); // 7-10 and EM
file_to_bg_scr(vanilla_directory_const+"\TEX\sprites\POS_01_spr.png","poster_02_bg",false,false,argument0); // 1-6
// Materials
file_to_bg_scr(vanilla_directory_const+"\MAT\BASIC.png","basic_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\BLANK.png","blank_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\CRATE_01.png","crate_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\DOOR_01B.png","door_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\DOOR_01.png","door_flat_bg",false,false,argument0); // Used in ele
file_to_bg_scr(vanilla_directory_const+"\MAT\DOOR_02.png","ele_door_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\FABRIC_01.png","fabric_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\FURN_01.png","drawer_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\GLASS_01.png","glass_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\MACHINE_01.png","pc_big_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\MACHINE_02.png","pc_sm_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\MACHINE_03.png","machine_01_bg",false,false,argument0); // PCs?
file_to_bg_scr(vanilla_directory_const+"\MAT\MACHINE_04.png","machine_02_bg",false,false,argument0); // CAT?
file_to_bg_scr(vanilla_directory_const+"\MAT\MACHINE_05.png","cat_01_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\MACHINE_06.png","cat_02_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\METAL_01.png","metal_01_bg",false,false,argument0); // No clue tbh
file_to_bg_scr(vanilla_directory_const+"\MAT\METAL_03.png","metal_02_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\METAL_02.png","pole_metal_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\RUG.png","rug_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\SAVE_01.png","save_ped_01_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\SAVE_02.png","save_ped_02_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\SAVE_03.png","save_cross_02_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\SAVE_04.png","save_cross_03_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\SAVE_05.png","save_cross_01_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\TORCH.png","torch_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\WOOD_01.png","wood_01_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\WOOD_02.png","wood_02_bg",false,false,argument0);
// Rare
file_to_bg_scr(vanilla_directory_const+"\TEX\RARE\BRIDGE_01.png","bridge_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\TEX\RARE\BRIDGE_02.png","bridge_fake_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\TEX\RARE\ELE_01.png","ele_wall_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\TEX\RARE\ELE_02.png","ele_frame_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\TEX\RARE\ELE_03.png","ele_window_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\TEX\RARE\ELE_04.png","ele_ceil_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\TEX\RARE\ELE_05.png","ele_floor_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\TEX\RARE\RAIL_01.png","rail_metal_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\TEX\RARE\RAIL_02.png","rail_wood_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\TEX\RARE\ROCK_01.png","rock_bg",false,false,argument0); // We don't need the others... I think
file_to_bg_scr(vanilla_directory_const+"\TEX\RARE\SKY_01.png","sky_03_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\TEX\RARE\TILE_01.png","tile_floor_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\TEX\RARE\TILE_02.png","tile_ceil_bg",false,false,argument0); // Worry about wallpaper later
file_to_bg_scr(vanilla_directory_const+"\TEX\RARE\WINDOW_01.png","window_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\TEX\RARE\WINDOW_02.png","lp_window_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\TEX\RARE\WINDOW_03.png","lab_window_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\TEX\RARE\WIRE_01.png","wire_01_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\TEX\RARE\WIRE_02.png","wire_02_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\TEX\RARE\WIRE_03.png","wire_03_bg",false,false,argument0);
// Mobile
file_to_bg_scr(vanilla_directory_const+"\TEX\mobile\MID_02_tex.png","fan_blade_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\TEX\mobile\MID_03_tex.png","fan_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\TEX\mobile\MID_04_tex.png","phone_bg",false,false,argument0);
// Art
file_to_bg_scr(vanilla_directory_const+"\MAT\ART\ART_01.png","art_01_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\ART\ART_02.png","art_02_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\ART\ART_03.png","art_03_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\ART\ART_04.png","art_04_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\ART\ART_05.png","art_05_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\ART\ART_06.png","art_06_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\ART\ART_07.png","art_07_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\ART\ART_08.png","art_08_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\ART\ART_09.png","art_09_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\ART\ART_10.png","art_10_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\ART\ART_11.png","art_11_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\ART\ART_12.png","art_12_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\ART\ART_13.png","art_13_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\ART\ART_14.png","art_14_bg",false,false,argument0);
file_to_bg_scr(vanilla_directory_const+"\MAT\ART\ART_15.png","art_15_bg",false,false,argument0);
// Mod stuff
for (local.j=0; local.j<ds_list_size(global.mod_list); local.j+=1;)
{
    local.dir = ds_list_find_value(global.mod_list,local.j);
    local.i = 0;
    local.file = file_find_first(local.dir+"\BG\MAIN\*.png",-1);
    while (local.file != "")
    {
        file_to_bg_scr(local.dir+"\BG\MAIN\"+local.file,filename_change_ext(local.file,""),false,false,argument0);
        local.file = file_find_next();
        local.i += 1;
        // Draw
        draw_clear_alpha(c_black,0);
        draw_text_transformed(view_wview[view_current]/2,view_hview[view_current]*0.9,"Loading mod textures ("+string(local.i)+")...",1,1,0);
        screen_refresh();
    }
    file_find_close();
}
// Draw
draw_clear_alpha(c_black,0);
draw_text_transformed(view_wview[view_current]/2,view_hview[view_current]*0.9,"Loaded textures!",1,1,0);
screen_refresh();