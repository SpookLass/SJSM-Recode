/*
Argument 0: Print
*/
// Mod / Texture Pack stuff
    for (local.j=ds_list_size(global.mod_list)-1; local.j>=0; local.j-=1;)
    {
        // Get the first file in the main directory
            local.dir = ds_list_find_value(global.mod_list,local.j);
            local.i = 0;
            local.file = filename_change_ext(file_find_first(local.dir+"\BG\MAIN\*.gml",-1),"");
            while (local.file != "")
            {
                // Not sure why, but it doesn't include the path.
                file_to_asset_scr(local.dir+"\BG\MAIN\"+local.file,local.file,argument0,false,false);
                local.file = filename_change_ext(file_find_next(),"");
                local.i += 1;
                // Draw
                draw_load_scr("Loading mod main textures ("+string(local.i)+")...");
            }
            file_find_close();
        // Get the first file in the monster directory
            local.i = 0;
            local.file = filename_change_ext(file_find_first(local.dir+"\BG\MON\*.gml",-1),"");
            while (local.file != "")
            {
                // Not sure why, but it doesn't include the path.
                globalvar_scr(local.file+"_path",local.dir+"\BG\MON\"+local.file,argument0);
                local.file = filename_change_ext(file_find_next(),"");
                local.i += 1;
                // Draw
                draw_load_scr("Loading monster textures ("+string(local.i)+")...");
            }
            file_find_close();
        // Get the first file in the room directory
            local.i = 0;
            local.file = filename_change_ext(file_find_first(local.dir+"\BG\RM\*.gml",-1),"");
            while (local.file != "")
            {
                // Not sure why, but it doesn't include the path.
                globalvar_scr(local.file+"_path",local.dir+"\BG\RM\"+local.file,argument0);
                local.file = filename_change_ext(file_find_next(),"");
                local.i += 1;
                // Draw
                draw_load_scr("Loading room textures ("+string(local.i)+")...");
            }
            file_find_close();
        // Get the first file in the death screen directory
            local.i = 0;
            local.file = filename_change_ext(file_find_first(local.dir+"\BG\DEAD\*.gml",-1),"");
            while (local.file != "")
            {
                // Not sure why, but it doesn't include the path.
                globalvar_scr(local.file+"_path",local.dir+"\BG\DEAD\"+local.file,argument0);
                local.file = filename_change_ext(file_find_next(),"");
                local.i += 1;
                // Draw
                draw_load_scr("Loading death screen textures ("+string(local.i)+")...");
            }
            file_find_close();
        // Get the first file in the UI directory
            local.i = 0;
            local.file = filename_change_ext(file_find_first(local.dir+"\BG\UI\*.gml",-1),"");
            while (local.file != "")
            {
                // Not sure why, but it doesn't include the path.
                globalvar_scr(local.file+"_path",local.dir+"\BG\UI\"+local.file,argument0);
                local.file = filename_change_ext(file_find_next(),"");
                local.i += 1;
                // Draw
                draw_load_scr("Loading user interface textures ("+string(local.i)+")...");
            }
            file_find_close();
        // Get the first file in the minigamee directory
            local.i = 0;
            local.file = filename_change_ext(file_find_first(local.dir+"\BG\MINI\*.gml",-1),"");
            while (local.file != "")
            {
                // Not sure why, but it doesn't include the path.
                globalvar_scr(local.file+"_path",local.dir+"\BG\MINI\"+local.file,argument0);
                local.file = filename_change_ext(file_find_next(),"");
                local.i += 1;
                // Draw
                draw_load_scr("Loading minigame textures ("+string(local.i)+")...");
            }
            file_find_close();
        // Get the first file in the Karamari directory
            if global.kh_var
            {
                local.i = 0;
                local.file = filename_change_ext(file_find_first(local.dir+"\BG\KH\*.gml",-1),"");
                while (local.file != "")
                {
                    // Not sure why, but it doesn't include the path.
                    globalvar_scr(local.file+"_path",local.dir+"\BG\KH\"+local.file,argument0);
                    local.file = filename_change_ext(file_find_next(),"");
                    local.i += 1;
                    // Draw
                    draw_load_scr("Loading Karamari Hospital textures ("+string(local.i)+")...");
                }
                file_find_close();
            }
        // Get the first file in the Dollhouse directory
            if global.dh_var
            {
                local.i = 0;
                local.file = filename_change_ext(file_find_first(local.dir+"\BG\DH\*.gml",-1),"");
                while (local.file != "")
                {
                    // Not sure why, but it doesn't include the path.
                    globalvar_scr(local.file+"_path",local.dir+"\BG\DH\"+local.file,argument0);
                    local.file = filename_change_ext(file_find_next(),"");
                    local.i += 1;
                    // Draw
                    draw_load_scr("Loading Doll House textures ("+string(local.i)+")...");
                }
                file_find_close();
            }
    }
// Get the first file in the main directory
    local.i = 0;
    local.file = filename_change_ext(file_find_first(main_directory_const+"\BG\MAIN\*.gml",-1),"");
    while (local.file != "")
    {
        // Not sure why, but it doesn't include the path.
        file_to_asset_scr(main_directory_const+"\BG\MAIN\"+local.file,local.file,argument0,false,false);
        local.file = filename_change_ext(file_find_next(),"");
        local.i += 1;
        // Draw
        draw_load_scr("Loading main textures ("+string(local.i)+")...");
    }
    file_find_close();
// Get the first file in the monster directory
    local.i = 0;
    local.file = filename_change_ext(file_find_first(main_directory_const+"\BG\MON\*.gml",-1),"");
    while (local.file != "")
    {
        // Not sure why, but it doesn't include the path.
        globalvar_scr(local.file+"_path",main_directory_const+"\BG\MON\"+local.file,argument0);
        local.file = filename_change_ext(file_find_next(),"");
        local.i += 1;
        // Draw
        draw_load_scr("Loading monster textures ("+string(local.i)+")...");
    }
    file_find_close();
// Get the first file in the room directory
    local.i = 0;
    local.file = filename_change_ext(file_find_first(main_directory_const+"\BG\RM\*.gml",-1),"");
    while (local.file != "")
    {
        // Not sure why, but it doesn't include the path.
        globalvar_scr(local.file+"_path",main_directory_const+"\BG\RM\"+local.file,argument0);
        local.file = filename_change_ext(file_find_next(),"");
        local.i += 1;
        // Draw
        draw_load_scr("Loading room textures ("+string(local.i)+")...");
    }
    file_find_close();
// Get the first file in the death screen directory
    local.i = 0;
    local.file = filename_change_ext(file_find_first(main_directory_const+"\BG\DEAD\*.gml",-1),"");
    while (local.file != "")
    {
        // Not sure why, but it doesn't include the path.
        globalvar_scr(local.file+"_path",main_directory_const+"\BG\DEAD\"+local.file,argument0);
        local.file = filename_change_ext(file_find_next(),"");
        local.i += 1;
        // Draw
        draw_load_scr("Loading death screen textures ("+string(local.i)+")...");
    }
    file_find_close();
// Get the first file in the UI directory
    local.i = 0;
    local.file = filename_change_ext(file_find_first(main_directory_const+"\BG\UI\*.gml",-1),"");
    while (local.file != "")
    {
        // Not sure why, but it doesn't include the path.
        globalvar_scr(local.file+"_path",main_directory_const+"\BG\UI\"+local.file,argument0);
        local.file = filename_change_ext(file_find_next(),"");
        local.i += 1;
        // Draw
        draw_load_scr("Loading user interface textures ("+string(local.i)+")...");
    }
    file_find_close();
// Get the first file in the minigamee directory
    local.i = 0;
    local.file = filename_change_ext(file_find_first(main_directory_const+"\BG\MINI\*.gml",-1),"");
    while (local.file != "")
    {
        // Not sure why, but it doesn't include the path.
        globalvar_scr(local.file+"_path",main_directory_const+"\BG\MINI\"+local.file,argument0);
        local.file = filename_change_ext(file_find_next(),"");
        local.i += 1;
        // Draw
        draw_load_scr("Loading minigame textures ("+string(local.i)+")...");
    }
    file_find_close();
// Get the first file in the Karamari directory
    if global.kh_var
    {
        local.i = 0;
        local.file = filename_change_ext(file_find_first(main_directory_const+"\BG\KH\*.gml",-1),"");
        while (local.file != "")
        {
            // Not sure why, but it doesn't include the path.
            globalvar_scr(local.file+"_path",main_directory_const+"\BG\KH\"+local.file,argument0);
            local.file = filename_change_ext(file_find_next(),"");
            local.i += 1;
            // Draw
            draw_load_scr("Loading Karamari Hospital textures ("+string(local.i)+")...");
        }
        file_find_close();
    }
// Get the first file in the Dollhouse directory
    if global.dh_var
    {
        local.i = 0;
        local.file = filename_change_ext(file_find_first(main_directory_const+"\BG\DH\*.gml",-1),"");
        while (local.file != "")
        {
            // Not sure why, but it doesn't include the path.
            globalvar_scr(local.file+"_path",main_directory_const+"\BG\DH\"+local.file,argument0);
            local.file = filename_change_ext(file_find_next(),"");
            local.i += 1;
            // Draw
            draw_load_scr("Loading Doll House textures ("+string(local.i)+")...");
        }
        file_find_close();
    }
// Draw
    draw_load_scr("Loaded textures!");