/*
Argument 0: Print
*/
fmod_load_scr();
fmod_ini_scr(100,false); // 100 is max sounds, second argument is web sounds
fmod_listen_set_num_scr(1);
fmod_set_world_scale_scr(pixel_meter_rate_const);
// Mod / Texture Pack stuff
    for (local.j=ds_list_size(global.mod_list)-1; local.j>=0; local.j-=1;)
    {
        // Get the first file in the main directory
            local.dir = ds_list_find_value(global.mod_list,local.j);
            local.i = 0;
            local.file = filename_change_ext(file_find_first(local.dir+"\SND\MAIN\*.gml",-1),"");
            while (local.file != "")
            {
                // Not sure why, but it doesn't include the path.
                file_to_asset_scr(local.dir+"\SND\MAIN\"+local.file,local.file,argument0,false,snd_group_sfx_const,1,0,0);
                local.file = filename_change_ext(file_find_next(),"");
                local.i += 1;
                // Draw
                draw_load_scr("Loading mod main sounds ("+string(local.i)+")...");
            }
            file_find_close();
        // Get the first file in the monster directory
            local.i = 0;
            local.file = filename_change_ext(file_find_first(local.dir+"\SND\MON\*.gml",-1),"");
            while (local.file != "")
            {
                // Not sure why, but it doesn't include the path.
                globalvar_scr(local.file+"_path",local.dir+"\SND\MON\"+local.file,argument0);
                local.file = filename_change_ext(file_find_next(),"");
                local.i += 1;
                // Draw
                draw_load_scr("Loading monster sounds ("+string(local.i)+")...");
            }
            file_find_close();
        // Get the first file in the room directory
            local.i = 0;
            local.file = filename_change_ext(file_find_first(local.dir+"\SND\RM\*.gml",-1),"");
            while (local.file != "")
            {
                // Not sure why, but it doesn't include the path.
                globalvar_scr(local.file+"_path",local.dir+"\SND\RM\"+local.file,argument0);
                local.file = filename_change_ext(file_find_next(),"");
                local.i += 1;
                // Draw
                draw_load_scr("Loading room sounds ("+string(local.i)+")...");
            }
            file_find_close();
        // Get the first file in the death screen directory
            local.i = 0;
            local.file = filename_change_ext(file_find_first(local.dir+"\SND\DEAD\*.gml",-1),"");
            while (local.file != "")
            {
                // Not sure why, but it doesn't include the path.
                globalvar_scr(local.file+"_path",local.dir+"\SND\DEAD\"+local.file,argument0);
                local.file = filename_change_ext(file_find_next(),"");
                local.i += 1;
                // Draw
                draw_load_scr("Loading death screen sounds ("+string(local.i)+")...");
            }
            file_find_close();
        // Get the first file in the UI directory
            local.i = 0;
            local.file = filename_change_ext(file_find_first(local.dir+"\SND\UI\*.gml",-1),"");
            while (local.file != "")
            {
                // Not sure why, but it doesn't include the path.
                globalvar_scr(local.file+"_path",local.dir+"\SND\UI\"+local.file,argument0);
                local.file = filename_change_ext(file_find_next(),"");
                local.i += 1;
                // Draw
                draw_load_scr("Loading user interface sounds ("+string(local.i)+")...");
            }
            file_find_close();
        // Get the first file in the minigamee directory
            local.i = 0;
            local.file = filename_change_ext(file_find_first(local.dir+"\SND\MINI\*.gml",-1),"");
            while (local.file != "")
            {
                // Not sure why, but it doesn't include the path.
                globalvar_scr(local.file+"_path",local.dir+"\SND\MINI\"+local.file,argument0);
                local.file = filename_change_ext(file_find_next(),"");
                local.i += 1;
                // Draw
                draw_load_scr("Loading minigame sounds ("+string(local.i)+")...");
            }
            file_find_close();
        // Get the first file in the Karamari directory
            if global.kh_var
            {
                local.i = 0;
                local.file = filename_change_ext(file_find_first(local.dir+"\SND\KH\*.gml",-1),"");
                while (local.file != "")
                {
                    // Not sure why, but it doesn't include the path.
                    globalvar_scr(local.file+"_path",local.dir+"\SND\KH\"+local.file,argument0);
                    local.file = filename_change_ext(file_find_next(),"");
                    local.i += 1;
                    // Draw
                    draw_load_scr("Loading Karamari Hospital sounds ("+string(local.i)+")...");
                }
                file_find_close();
            }
        // Get the first file in the Dollhouse directory
            if global.dh_var
            {
                local.i = 0;
                local.file = filename_change_ext(file_find_first(local.dir+"\SND\DH\*.gml",-1),"");
                while (local.file != "")
                {
                    // Not sure why, but it doesn't include the path.
                    globalvar_scr(local.file+"_path",local.dir+"\SND\DH\"+local.file,argument0);
                    local.file = filename_change_ext(file_find_next(),"");
                    local.i += 1;
                    // Draw
                    draw_load_scr("Loading Doll House sounds ("+string(local.i)+")...");
                }
                file_find_close();
            }
    }
// Get the first file in the main directory
    local.i = 0;
    local.file = filename_change_ext(file_find_first(main_directory_const+"\SND\MAIN\*.gml",-1),"");
    while (local.file != "")
    {
        // Not sure why, but it doesn't include the path.
        file_to_asset_scr(main_directory_const+"\SND\MAIN\"+local.file,local.file,argument0,false,snd_group_sfx_const,1,0,0);
        local.file = filename_change_ext(file_find_next(),"");
        local.i += 1;
        // Draw
        draw_load_scr("Loading main sounds ("+string(local.i)+")...");
    }
    file_find_close();
// Get the first file in the monster directory
    local.i = 0;
    local.file = filename_change_ext(file_find_first(main_directory_const+"\SND\MON\*.gml",-1),"");
    while (local.file != "")
    {
        // Not sure why, but it doesn't include the path.
        globalvar_scr(local.file+"_path",main_directory_const+"\SND\MON\"+local.file,argument0);
        local.file = filename_change_ext(file_find_next(),"");
        local.i += 1;
        // Draw
        draw_load_scr("Loading monster sounds ("+string(local.i)+")...");
    }
    file_find_close();
// Get the first file in the room directory
    local.i = 0;
    local.file = filename_change_ext(file_find_first(main_directory_const+"\SND\RM\*.gml",-1),"");
    while (local.file != "")
    {
        // Not sure why, but it doesn't include the path.
        globalvar_scr(local.file+"_path",main_directory_const+"\SND\RM\"+local.file,argument0);
        local.file = filename_change_ext(file_find_next(),"");
        local.i += 1;
        // Draw
        draw_load_scr("Loading room sounds ("+string(local.i)+")...");
    }
    file_find_close();
// Get the first file in the death screen directory
    local.i = 0;
    local.file = filename_change_ext(file_find_first(main_directory_const+"\SND\DEAD\*.gml",-1),"");
    while (local.file != "")
    {
        // Not sure why, but it doesn't include the path.
        globalvar_scr(local.file+"_path",main_directory_const+"\SND\DEAD\"+local.file,argument0);
        local.file = filename_change_ext(file_find_next(),"");
        local.i += 1;
        // Draw
        draw_load_scr("Loading death screen sounds ("+string(local.i)+")...");
    }
    file_find_close();
// Get the first file in the UI directory
    local.i = 0;
    local.file = filename_change_ext(file_find_first(main_directory_const+"\SND\UI\*.gml",-1),"");
    while (local.file != "")
    {
        // Not sure why, but it doesn't include the path.
        globalvar_scr(local.file+"_path",main_directory_const+"\SND\UI\"+local.file,argument0);
        local.file = filename_change_ext(file_find_next(),"");
        local.i += 1;
        // Draw
        draw_load_scr("Loading user interface sounds ("+string(local.i)+")...");
    }
    file_find_close();
// Get the first file in the minigamee directory
    local.i = 0;
    local.file = filename_change_ext(file_find_first(main_directory_const+"\SND\MINI\*.gml",-1),"");
    while (local.file != "")
    {
        // Not sure why, but it doesn't include the path.
        globalvar_scr(local.file+"_path",main_directory_const+"\SND\MINI\"+local.file,argument0);
        local.file = filename_change_ext(file_find_next(),"");
        local.i += 1;
        // Draw
        draw_load_scr("Loading minigame sounds ("+string(local.i)+")...");
    }
    file_find_close();
// Get the first file in the Karamari directory
    if global.kh_var
    {
        local.i = 0;
        local.file = filename_change_ext(file_find_first(main_directory_const+"\SND\KH\*.gml",-1),"");
        while (local.file != "")
        {
            // Not sure why, but it doesn't include the path.
            globalvar_scr(local.file+"_path",main_directory_const+"\SND\KH\"+local.file,argument0);
            local.file = filename_change_ext(file_find_next(),"");
            local.i += 1;
            // Draw
            draw_load_scr("Loading Karamari Hospital sounds ("+string(local.i)+")...");
        }
        file_find_close();
    }
// Get the first file in the Dollhouse directory
    if global.dh_var
    {
        local.i = 0;
        local.file = filename_change_ext(file_find_first(main_directory_const+"\SND\DH\*.gml",-1),"");
        while (local.file != "")
        {
            // Not sure why, but it doesn't include the path.
            globalvar_scr(local.file+"_path",main_directory_const+"\SND\DH\"+local.file,argument0);
            local.file = filename_change_ext(file_find_next(),"");
            local.i += 1;
            // Draw
            draw_load_scr("Loading Doll House sounds ("+string(local.i)+")...");
        }
        file_find_close();
    }
// Draw
draw_load_scr("Loaded sounds!");