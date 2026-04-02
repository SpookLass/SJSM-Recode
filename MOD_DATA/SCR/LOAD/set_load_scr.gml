// Draw
draw_load_scr("Loading player settings...");
// Load
ini_open("settings.ini");
for (local.i=0; local.i<global.set_len_var; local.i+=1;)
{
    if set_arr[local.i,4] != 8 // Not category
    {
        if set_arr[local.i,9] // Player Specific
        {
            for (local.j=0; local.j<8; local.j+=1;) // Loop through players
            {
                switch set_arr[local.i,4]
                {
                    case 5: // String
                    {
                        execute_string
                        (
                            "global."+set_arr[local.i,0]+"_var[argument0] = argument1;",
                            local.j,ini_read_string("PLAYER",set_arr[local.i,0]+"_"+string(local.j),set_default_arr[local.i,local.j])
                        );
                        break;
                    }
                    case 6: // Pointer
                    {
                        execute_string
                        (
                            "global."+set_arr[local.i,0]+"_var[argument0] = argument1;",
                            local.j,set_pointer_arr[ini_read_real("PLAYER",set_arr[local.i,0]+"_"+string(local.j),set_default_arr[local.i,local.j])]
                        );
                        break;
                    }
                    case 7: // Input
                    {
                        // show_message(string(set_arr[local.i,10]));
                        global.input_key_arr[set_arr[local.i,10],local.j] = ini_read_real("PLAYER",set_arr[local.i,0]+"_"+string(local.j),set_default_arr[local.i,local.j]);
                        break;
                    }
                    default: // Other
                    {
                        execute_string
                        (
                            "global."+set_arr[local.i,0]+"_var[argument0] = argument1;",
                            local.j,ini_read_real("PLAYER",set_arr[local.i,0]+"_"+string(local.j),set_default_arr[local.i,local.j])
                        );
                        break;
                    }
                }
            }
        }
        else
        {
            switch set_arr[local.i,4]
            {
                case 5: // String
                {
                    execute_string
                    (
                        "global."+set_arr[local.i,0]+"_var = argument0;",
                        ini_read_string("MAIN",set_arr[local.i,0],set_default_arr[local.i,0])
                    );
                    break;
                }
                case 6: // Pointer
                {
                    execute_string
                    (
                        "global."+set_arr[local.i,0]+"_var = argument0;",
                        set_pointer_arr[ini_read_string("MAIN",set_arr[local.i,0],set_default_arr[local.i,0])]
                    );
                    break;
                }
                case 7: // Input
                {
                    global.input_key_arr[set_arr[local.i,10],0] = ini_read_real("MAIN",set_arr[local.i,0],set_default_arr[local.i,0]);
                    break;
                }
                default: // Other
                {
                    execute_string
                    (
                        "global."+set_arr[local.i,0]+"_var = argument0;",
                        ini_read_real("MAIN",set_arr[local.i,0],set_default_arr[local.i,0])
                    );
                    break;
                }
            }
        }
    }
}
// Multiplayer (I was lazy)
for (local.i=0; local.i<8; local.i+=1;)
{
    // Multiplayer
    global.player_name_var[local.i] = ini_read_string("MULTIPLAYER","name_"+string(local.i),"PLAYER "+string(local.i+1));
    switch local.i
    {
        case 0: { local.color = make_color_rgb(168,88,188); break; } // Purple
        case 1: { local.color = make_color_rgb(255,31,27); break; } // Red
        case 2: { local.color = make_color_rgb(255,255,28); break; } // Yellow
        case 3: { local.color = make_color_rgb(255,255,255); break; } // White
        case 4: { local.color = make_color_rgb(59,59,119); break; } // Blue
        case 5: { local.color = make_color_rgb(6,213,119); break; } // Stamina Green
        case 6: { local.color = make_color_rgb(226,205,124); break; } // Gold
        case 7: { local.color = make_color_rgb(40,3,47); break; } // Black
    }
    global.player_color_var[local.i] = ini_read_real("MULTIPLAYER","color_"+string(local.i),local.color);
    global.player_spr_var[local.i] = ini_read_real("MULTIPLAYER","spr_"+string(local.i),0);
    global.player_spr_id_var[local.i] = ini_read_real("MULTIPLAYER","spr_id_"+string(local.i),irandom(2));
}
ini_close();
// Set stuff
if window_get_fullscreen() != global.fullscreen_var
{ window_set_fullscreen(global.fullscreen_var); }
set_synchronization(global.vsync_var);
texture_set_interpolation(global.anti_alias_var);
fmod_set_all_vol_scr(global.vol_var/100);
fmod_set_group_vol_scr(snd_group_sfx_const,global.sfx_vol_var/100);
fmod_set_group_vol_scr(snd_group_mon_const,global.mon_vol_var/100);
fmod_set_group_vol_scr(snd_group_mus_const,global.mus_vol_var/100);
fmod_set_group_vol_scr(snd_group_voice_const,global.voice_vol_var/100);
if global.doppler_var { fmod_set_doppler_fps_scr(fps); }
else { fmod_set_doppler_fps_scr(0); }
// Draw (hope this works)
draw_load_scr("Loaded player settings!");