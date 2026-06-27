/*
Argument 0: Print
*/
// Mod / Texture Pack stuff
    for (local.j=0; local.j<ds_list_size(global.mod_list); local.j+=1;)
    {
        local.dir = ds_list_find_value(global.mod_list,local.j);
        local.file = file_find_first(local.dir+"\SPR\MAIN\*.gml",-1);
        // Get the first file in the main directory
            local.i = 0;
            local.file = filename_change_ext(file_find_first(local.dir+"\SPR\MAIN\*.gml",-1),"");
            while (local.file != "")
            {
                // Not sure why, but it doesn't include the path.
                file_to_asset_scr(local.dir+"\SPR\MAIN\"+local.file,local.file,argument0,1,false,false,0,0);
                local.file = filename_change_ext(file_find_next(),"");
                local.i += 1;
                // Draw
                draw_load_scr("Loading mod main sprites ("+string(local.i)+")...");
            }
            file_find_close();
        // Get the first file in the monster directory
            local.i = 0;
            local.file = filename_change_ext(file_find_first(local.dir+"\SPR\MON\*.gml",-1),"");
            while (local.file != "")
            {
                // Not sure why, but it doesn't include the path.
                globalvar_scr(local.dir+"\SPR\MON\"+local.file,local.file+"_path",argument0);
                local.file = filename_change_ext(file_find_next(),"");
                local.i += 1;
                // Draw
                draw_load_scr("Loading mod monster sprites ("+string(local.i)+")...");
            }
            file_find_close();
        // Get the first file in the room directory
            local.i = 0;
            local.file = filename_change_ext(file_find_first(local.dir+"\SPR\RM\*.gml",-1),"");
            while (local.file != "")
            {
                // Not sure why, but it doesn't include the path.
                globalvar_scr(local.dir+"\SPR\RM\"+local.file,local.file+"_path",argument0);
                local.file = filename_change_ext(file_find_next(),"");
                local.i += 1;
                // Draw
                draw_load_scr("Loading mod room sprites ("+string(local.i)+")...");
            }
            file_find_close();
        // Get the first file in the death screen directory
            local.i = 0;
            local.file = filename_change_ext(file_find_first(local.dir+"\SPR\DEAD\*.gml",-1),"");
            while (local.file != "")
            {
                // Not sure why, but it doesn't include the path.
                globalvar_scr(local.dir+"\SPR\DEAD\"+local.file,local.file+"_path",argument0);
                local.file = filename_change_ext(file_find_next(),"");
                local.i += 1;
                // Draw
                draw_load_scr("Loading mod death screen sprites ("+string(local.i)+")...");
            }
            file_find_close();
        // Get the first file in the UI directory
            local.i = 0;
            local.file = filename_change_ext(file_find_first(local.dir+"\SPR\UI\*.gml",-1),"");
            while (local.file != "")
            {
                // Not sure why, but it doesn't include the path.
                globalvar_scr(local.dir+"\SPR\UI\"+local.file,local.file+"_path",argument0);
                local.file = filename_change_ext(file_find_next(),"");
                local.i += 1;
                // Draw
                draw_load_scr("Loading mod user interface sprites ("+string(local.i)+")...");
            }
            file_find_close();
        // Get the first file in the minigame directory
            local.i = 0;
            local.file = filename_change_ext(file_find_first(local.dir+"\SPR\MINI\*.gml",-1),"");
            while (local.file != "")
            {
                // Not sure why, but it doesn't include the path.
                globalvar_scr(local.dir+"\SPR\MINI\"+local.file,local.file+"_path",argument0);
                local.file = filename_change_ext(file_find_next(),"");
                local.i += 1;
                // Draw
                draw_load_scr("Loading mod minigame sprites ("+string(local.i)+")...");
            }
            file_find_close();
        // Get the first file in the Karamari directory
            if global.kh_var
            {
                local.i = 0;
                local.file = filename_change_ext(file_find_first(local.dir+"\SPR\KH\*.gml",-1),"");
                while (local.file != "")
                {
                    // Not sure why, but it doesn't include the path.
                    globalvar_scr(local.dir+"\SPR\KH\"+local.file,local.file+"_path",argument0);
                    local.file = filename_change_ext(file_find_next(),"");
                    local.i += 1;
                    // Draw
                    draw_load_scr("Loading mod Karamari Hospital sprites ("+string(local.i)+")...");
                }
                file_find_close();
            }
        // Get the first file in the Dollhouse directory
            if global.dh_var
            {
                local.i = 0;
                local.file = filename_change_ext(file_find_first(local.dir+"\SPR\DH\*.gml",-1),"");
                while (local.file != "")
                {
                    // Not sure why, but it doesn't include the path.
                    globalvar_scr(local.dir+"\SPR\DH\"+local.file,local.file+"_path",argument0);
                    local.file = filename_change_ext(file_find_next(),"");
                    local.i += 1;
                    // Draw
                    draw_load_scr("Loading mod Doll House sprites ("+string(local.i)+")...");
                }
                file_find_close();
            }
    }
// Get the first file in the main directory
    local.i = 0;
    local.file = filename_change_ext(file_find_first(main_directory_const+"\SPR\MAIN\*.gml",-1),"");
    while (local.file != "")
    {
        // Not sure why, but it doesn't include the path.
        file_to_asset_scr(main_directory_const+"\SPR\MAIN\"+local.file,local.file,argument0,1,false,false,0,0);
        local.file = filename_change_ext(file_find_next(),"");
        local.i += 1;
        // Draw
        draw_load_scr("Loading main sprites ("+string(local.i)+")...");
    }
    file_find_close();
// Get the first file in the monster directory
    local.i = 0;
    local.file = filename_change_ext(file_find_first(main_directory_const+"\SPR\MON\*.gml",-1),"");
    while (local.file != "")
    {
        // Not sure why, but it doesn't include the path.
        globalvar_scr(main_directory_const+"\SPR\MON\"+local.file,local.file+"_path",argument0);
        local.file = filename_change_ext(file_find_next(),"");
        local.i += 1;
        // Draw
        draw_load_scr("Loading monster sprites ("+string(local.i)+")...");
    }
    file_find_close();
// Get the first file in the room directory
    local.i = 0;
    local.file = filename_change_ext(file_find_first(main_directory_const+"\SPR\RM\*.gml",-1),"");
    while (local.file != "")
    {
        // Not sure why, but it doesn't include the path.
        globalvar_scr(main_directory_const+"\SPR\RM\"+local.file,local.file+"_path",argument0);
        local.file = filename_change_ext(file_find_next(),"");
        local.i += 1;
        // Draw
        draw_load_scr("Loading room sprites ("+string(local.i)+")...");
    }
    file_find_close();
// Get the first file in the death screen directory
    local.i = 0;
    local.file = filename_change_ext(file_find_first(main_directory_const+"\SPR\DEAD\*.gml",-1),"");
    while (local.file != "")
    {
        // Not sure why, but it doesn't include the path.
        globalvar_scr(main_directory_const+"\SPR\DEAD\"+local.file,local.file+"_path",argument0);
        local.file = filename_change_ext(file_find_next(),"");
        local.i += 1;
        // Draw
        draw_load_scr("Loading death screen sprites ("+string(local.i)+")...");
    }
    file_find_close();
// Get the first file in the UI directory
    local.i = 0;
    local.file = filename_change_ext(file_find_first(main_directory_const+"\SPR\UI\*.gml",-1),"");
    while (local.file != "")
    {
        // Not sure why, but it doesn't include the path.
        globalvar_scr(main_directory_const+"\SPR\UI\"+local.file,local.file+"_path",argument0);
        local.file = filename_change_ext(file_find_next(),"");
        local.i += 1;
        // Draw
        draw_load_scr("Loading user interface sprites ("+string(local.i)+")...");
    }
    file_find_close();
// Get the first file in the minigame directory
    local.i = 0;
    local.file = filename_change_ext(file_find_first(main_directory_const+"\SPR\MINI\*.gml",-1),"");
    while (local.file != "")
    {
        // Not sure why, but it doesn't include the path.
        globalvar_scr(main_directory_const+"\SPR\MINI\"+local.file,local.file+"_path",argument0);
        local.file = filename_change_ext(file_find_next(),"");
        local.i += 1;
        // Draw
        draw_load_scr("Loading minigame sprites ("+string(local.i)+")...");
    }
    file_find_close();
// Get the first file in the Karamari directory
    if global.kh_var
    {
        local.i = 0;
        local.file = filename_change_ext(file_find_first(main_directory_const+"\SPR\KH\*.gml",-1),"");
        while (local.file != "")
        {
            // Not sure why, but it doesn't include the path.
            globalvar_scr(main_directory_const+"\SPR\KH\"+local.file,local.file+"_path",argument0);
            local.file = filename_change_ext(file_find_next(),"");
            local.i += 1;
            // Draw
            draw_load_scr("Loading Karamari Hospital sprites ("+string(local.i)+")...");
        }
        file_find_close();
    }
// Get the first file in the Dollhouse directory
    if global.dh_var
    {
        local.i = 0;
        local.file = filename_change_ext(file_find_first(main_directory_const+"\SPR\DH\*.gml",-1),"");
        while (local.file != "")
        {
            // Not sure why, but it doesn't include the path.
            globalvar_scr(main_directory_const+"\SPR\DH\"+local.file,local.file+"_path",argument0);
            local.file = filename_change_ext(file_find_next(),"");
            local.i += 1;
            // Draw
            draw_load_scr("Loading Doll House sprites ("+string(local.i)+")...");
        }
        file_find_close();
    }
// Stored so it can easily be replaced
globalvar light_wall_obj_spr;
globalvar light_floor_obj_spr;
light_wall_obj_spr = light_wall_spr;
light_floor_obj_spr = light_floor_spr;
// Draw
draw_load_scr("Loaded sprites!");