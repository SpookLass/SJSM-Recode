/*
Argument 0: Print
*/
// Mod / Texture Pack stuff
    for (local.j=ds_list_size(global.mod_list)-1; local.j>=0; local.j-=1;)
    {
        // Get the first file in the main directory
            local.dir = ds_list_find_value(global.mod_list,local.j);
            local.i = 0;
            local.file = filename_change_ext(file_find_first(local.dir+"\MDL\MAIN\*.gmmod",-1),"");
            while (local.file != "")
            {
                // Not sure why, but it doesn't include the path.
                file_to_mdl_scr(local.dir+"\MDL\MAIN\"+local.file,local.file,argument0);
                local.file = filename_change_ext(file_find_next(),"");
                local.i += 1;
                // Draw
                draw_load_scr("Loading mod main models ("+string(local.i)+")...");
            }
            file_find_close();
        // Get the first file in the monster directory
            local.i = 0;
            local.file = filename_change_ext(file_find_first(local.dir+"\MDL\MON\*.gmmod",-1),"");
            while (local.file != "")
            {
                // Not sure why, but it doesn't include the path.
                globalvar_scr(local.file+"_path",local.dir+"\MDL\MON\"+local.file,argument0);
                local.file = filename_change_ext(file_find_next(),"");
                local.i += 1;
                // Draw
                draw_load_scr("Loading monster models ("+string(local.i)+")...");
            }
            file_find_close();
        // Get the first file in the room directory
            local.i = 0;
            local.file = filename_change_ext(file_find_first(local.dir+"\MDL\RM\*.gmmod",-1),"");
            while (local.file != "")
            {
                // Not sure why, but it doesn't include the path.
                globalvar_scr(local.file+"_path",local.dir+"\MDL\RM\"+local.file,argument0);
                local.file = filename_change_ext(file_find_next(),"");
                local.i += 1;
                // Draw
                draw_load_scr("Loading room models ("+string(local.i)+")...");
            }
            file_find_close();
        // Get the first file in the death screen directory
            local.i = 0;
            local.file = filename_change_ext(file_find_first(local.dir+"\MDL\DEAD\*.gmmod",-1),"");
            while (local.file != "")
            {
                // Not sure why, but it doesn't include the path.
                globalvar_scr(local.file+"_path",local.dir+"\MDL\DEAD\"+local.file,argument0);
                local.file = filename_change_ext(file_find_next(),"");
                local.i += 1;
                // Draw
                draw_load_scr("Loading death screen models ("+string(local.i)+")...");
            }
            file_find_close();
        // Get the first file in the UI directory
            local.i = 0;
            local.file = filename_change_ext(file_find_first(local.dir+"\MDL\UI\*.gmmod",-1),"");
            while (local.file != "")
            {
                // Not sure why, but it doesn't include the path.
                globalvar_scr(local.file+"_path",local.dir+"\MDL\UI\"+local.file,argument0);
                local.file = filename_change_ext(file_find_next(),"");
                local.i += 1;
                // Draw
                draw_load_scr("Loading user interface models ("+string(local.i)+")...");
            }
            file_find_close();
        // Get the first file in the minigamee directory
            local.i = 0;
            local.file = filename_change_ext(file_find_first(local.dir+"\MDL\MINI\*.gmmod",-1),"");
            while (local.file != "")
            {
                // Not sure why, but it doesn't include the path.
                globalvar_scr(local.file+"_path",local.dir+"\MDL\MINI\"+local.file,argument0);
                local.file = filename_change_ext(file_find_next(),"");
                local.i += 1;
                // Draw
                draw_load_scr("Loading minigame models ("+string(local.i)+")...");
            }
            file_find_close();
        // Get the first file in the Karamari directory
            if global.kh_var
            {
                local.i = 0;
                local.file = filename_change_ext(file_find_first(local.dir+"\MDL\KH\*.gmmod",-1),"");
                while (local.file != "")
                {
                    // Not sure why, but it doesn't include the path.
                    globalvar_scr(local.file+"_path",local.dir+"\MDL\KH\"+local.file,argument0);
                    local.file = filename_change_ext(file_find_next(),"");
                    local.i += 1;
                    // Draw
                    draw_load_scr("Loading Karamari Hospital models ("+string(local.i)+")...");
                }
                file_find_close();
            }
        // Get the first file in the Dollhouse directory
            if global.dh_var
            {
                local.i = 0;
                local.file = filename_change_ext(file_find_first(local.dir+"\MDL\DH\*.gmmod",-1),"");
                while (local.file != "")
                {
                    // Not sure why, but it doesn't include the path.
                    globalvar_scr(local.file+"_path",local.dir+"\MDL\DH\"+local.file,argument0);
                    local.file = filename_change_ext(file_find_next(),"");
                    local.i += 1;
                    // Draw
                    draw_load_scr("Loading Doll House models ("+string(local.i)+")...");
                }
                file_find_close();
            }
    }
// Get the first file in the main directory
    local.i = 0;
    local.file = filename_change_ext(file_find_first(main_directory_const+"\MDL\MAIN\*.gmmod",-1),"");
    while (local.file != "")
    {
        // Not sure why, but it doesn't include the path.
        file_to_mdl_scr(main_directory_const+"\MDL\MAIN\"+local.file,local.file,argument0);
        local.file = filename_change_ext(file_find_next(),"");
        local.i += 1;
        // Draw
        draw_load_scr("Loading main models ("+string(local.i)+")...");
    }
    file_find_close();
// Get the first file in the monster directory
    local.i = 0;
    local.file = filename_change_ext(file_find_first(main_directory_const+"\MDL\MON\*.gmmod",-1),"");
    while (local.file != "")
    {
        // Not sure why, but it doesn't include the path.
        globalvar_scr(local.file+"_path",main_directory_const+"\MDL\MON\"+local.file,argument0);
        local.file = filename_change_ext(file_find_next(),"");
        local.i += 1;
        // Draw
        draw_load_scr("Loading monster models ("+string(local.i)+")...");
    }
    file_find_close();
// Get the first file in the room directory
    local.i = 0;
    local.file = filename_change_ext(file_find_first(main_directory_const+"\MDL\RM\*.gmmod",-1),"");
    while (local.file != "")
    {
        // Not sure why, but it doesn't include the path.
        globalvar_scr(local.file+"_path",main_directory_const+"\MDL\RM\"+local.file,argument0);
        local.file = filename_change_ext(file_find_next(),"");
        local.i += 1;
        // Draw
        draw_load_scr("Loading room models ("+string(local.i)+")...");
    }
    file_find_close();
// Get the first file in the death screen directory
    local.i = 0;
    local.file = filename_change_ext(file_find_first(main_directory_const+"\MDL\DEAD\*.gmmod",-1),"");
    while (local.file != "")
    {
        // Not sure why, but it doesn't include the path.
        globalvar_scr(local.file+"_path",main_directory_const+"\MDL\DEAD\"+local.file,argument0);
        local.file = filename_change_ext(file_find_next(),"");
        local.i += 1;
        // Draw
        draw_load_scr("Loading death screen models ("+string(local.i)+")...");
    }
    file_find_close();
// Get the first file in the UI directory
    local.i = 0;
    local.file = filename_change_ext(file_find_first(main_directory_const+"\MDL\UI\*.gmmod",-1),"");
    while (local.file != "")
    {
        // Not sure why, but it doesn't include the path.
        globalvar_scr(local.file+"_path",main_directory_const+"\MDL\UI\"+local.file,argument0);
        local.file = filename_change_ext(file_find_next(),"");
        local.i += 1;
        // Draw
        draw_load_scr("Loading user interface models ("+string(local.i)+")...");
    }
    file_find_close();
// Get the first file in the minigamee directory
    local.i = 0;
    local.file = filename_change_ext(file_find_first(main_directory_const+"\MDL\MINI\*.gmmod",-1),"");
    while (local.file != "")
    {
        // Not sure why, but it doesn't include the path.
        globalvar_scr(local.file+"_path",main_directory_const+"\MDL\MINI\"+local.file,argument0);
        local.file = filename_change_ext(file_find_next(),"");
        local.i += 1;
        // Draw
        draw_load_scr("Loading minigame models ("+string(local.i)+")...");
    }
    file_find_close();
// Get the first file in the Karamari directory
    if global.kh_var
    {
        local.i = 0;
        local.file = filename_change_ext(file_find_first(main_directory_const+"\MDL\KH\*.gmmod",-1),"");
        while (local.file != "")
        {
            // Not sure why, but it doesn't include the path.
            globalvar_scr(local.file+"_path",main_directory_const+"\MDL\KH\"+local.file,argument0);
            local.file = filename_change_ext(file_find_next(),"");
            local.i += 1;
            // Draw
            draw_load_scr("Loading Karamari Hospital models ("+string(local.i)+")...");
        }
        file_find_close();
    }
// Get the first file in the Dollhouse directory
    if global.dh_var
    {
        local.i = 0;
        local.file = filename_change_ext(file_find_first(main_directory_const+"\MDL\DH\*.gmmod",-1),"");
        while (local.file != "")
        {
            // Not sure why, but it doesn't include the path.
            globalvar_scr(local.file+"_path",main_directory_const+"\MDL\DH\"+local.file,argument0);
            local.file = filename_change_ext(file_find_next(),"");
            local.i += 1;
            // Draw
            draw_load_scr("Loading Doll House models ("+string(local.i)+")...");
        }
        file_find_close();
    }
// Draw
draw_load_scr("Loaded models!");