// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
/*
state_var
    0 - Start
    1 - Scatter
    2 - Chase
*/
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    // Asset Loading
        load_var = true;
        // Backgrounds
            tile_bg_var = bg_add_scr(pac_tile_bg_path,false,false);
        // Sprites
            pac_spr_var = spr_add_scr(pac_spr_path,4,false,false,0,0);
            dead_spr_var = spr_add_scr(pac_dead_spr_path,6,false,false,0,0);
            ghost_spr_var = spr_add_scr(pac_ghost_spr_path,2,false,false,0,0);
            eye_spr_var = spr_add_scr(pac_eye_spr_path,2,false,false,0,0);
            mary_spr_var = spr_add_scr(pac_mary_eye_spr_path,2,false,false,0,0);
            spooky_spr_var = spr_add_scr(pac_spooky_spr_path,2,false,false,0,0);
            spooky_eye_spr_var = spr_add_scr(pac_spooky_eye_spr_path,2,false,false,0,0);
            scare_spr_var = spr_add_scr(pac_scare_spr_path,2,false,false,0,0);
            pellet_spr_var = spr_add_scr(pac_pellet_spr_path,1,false,false,0,0);
            power_pellet_spr_var = spr_add_scr(pac_power_pellet_spr_path,1,false,false,0,0);
            nail_spr_var = spr_add_scr(pac_nail_spr_path,1,false,false,0,0);
            // Custom Ghosts
                raddy_spr_var = spr_add_scr(pac_raddy_spr_path,2,false,false,0,0);
                gladdy_spr_var = spr_add_scr(pac_gladdy_spr_path,2,false,false,0,0);
                maddy_spr_var = spr_add_scr(pac_maddy_spr_path,2,false,false,0,0);
                maddy_angry_spr_var = spr_add_scr(pac_maddy_angry_spr_path,2,false,false,0,0);
                brave_spr_var = spr_add_scr(pac_brave_spr_path,2,false,false,0,0);
                brave_scare_spr_var = spr_add_scr(pac_brave_scare_spr_path,2,false,false,0,0);
        // Sounds
            eat_snd_var = snd_add_scr(pac_eat_snd_path,false,snd_group_sfx_const,1,0,300);
            start_snd_var = snd_add_scr(pac_start_snd_path,false,snd_group_sfx_const,1,0,300);
            ghost_snd_var = snd_add_scr(pac_ghost_snd_path,false,snd_group_sfx_const,1,0,300);
            dead_snd_var = snd_add_scr(pac_dead_snd_path,false,snd_group_sfx_const,1,0,300);
        // Paths
            path_var = path_add();
            path_set_kind(path_var,0); // Not smooth
            path_set_precision(path_var,1);
        // Objects
            pac_obj_var = obj_add_scr(pac_obj_path);
            pac_ghost_obj_var = obj_add_scr(pac_ghost_obj_path);
            pac_inky_obj_var = obj_add_scr(pac_inky_obj_path);
            pac_blinky_obj_var = obj_add_scr(pac_blinky_obj_path);
            pac_pinky_obj_var = obj_add_scr(pac_pinky_obj_path);
            pac_clyde_obj_var = obj_add_scr(pac_clyde_obj_path);
            pac_edgar_obj_var = obj_add_scr(pac_edgar_obj_path);
            pac_mary_obj_var = obj_add_scr(pac_mary_obj_path);
            pac_bram_obj_var = obj_add_scr(pac_bram_obj_path);
            pac_spooky_obj_var = obj_add_scr(pac_spooky_obj_path);
            pac_raddy_obj_var = obj_add_scr(pac_raddy_obj_path);
            pac_gladdy_obj_var = obj_add_scr(pac_gladdy_obj_path);
            pac_maddy_obj_var = obj_add_scr(pac_maddy_obj_path);
            pac_brave_obj_var = obj_add_scr(pac_brave_obj_path);
    // Minigame variables
        classic_var = false;
        highscore_var = 0;
        score_var = 0;
        lvl_var = 0;
        state_var = 0;
        debug_var = true;
        pellet_max_var = 0;
        pellet_var = 0;
        start_alarm_var = 240;
        restart_alarm_var = 60;
        restart_pos_var = 0.75;
        pellet_score_var = 1;
        power_pellet_score_var = 5;
        ghost_score_var = 20;
        dead_alarm_01_var = 8;
        dead_alarm_02_var = 360;
        if classic_var { live_max_var = 1; }
        else { live_max_var = 3; }
        live_var = live_max_var;
    // Ghost Stuff
        move_alarm_var = 8;
        scatter_alarm_max_var = 420; // 390?
        scatter_alarm_min_var = 300;
        scatter_alarm_var = scatter_alarm_max_var;
        scatter_rate_var = 60;
        scatter_lvl_rate_var = 60;
        chase_alarm_var = 1200;
        scare_alarm_max_var = 360;
        scare_alarm_var = 360;
        scare_rate_var = 20;
        scare_color_var = make_color_rgb(102,102,255);
        ghost_len_var = 3;
        ghost_len_arr_var[0] = 4;
        ghost_arr_var[0,0] = pac_edgar_obj_var;
        ghost_arr_var[0,2] = pac_bram_obj_var;
        if classic_var
        {
            ghost_arr_var[0,1] = pac_mary_obj_var;
            ghost_arr_var[0,3] = pac_spooky_obj_var;
        }
        else
        {
            ghost_arr_var[0,1] = pac_spooky_obj_var;
            ghost_arr_var[0,3] = pac_mary_obj_var;
        }
        ghost_len_arr_var[1] = 4;
        ghost_arr_var[1,0] = pac_blinky_obj_var;
        ghost_arr_var[1,1] = pac_inky_obj_var;
        ghost_arr_var[1,2] = pac_pinky_obj_var;
        ghost_arr_var[1,3] = pac_clyde_obj_var;
        ghost_len_arr_var[2] = 4;
        ghost_arr_var[2,0] = pac_raddy_obj_var;
        ghost_arr_var[2,1] = pac_gladdy_obj_var;
        ghost_arr_var[2,2] = pac_maddy_obj_var;
        ghost_arr_var[2,3] = pac_brave_obj_var;
        if classic_var { ghost_var = 0; }
        else { ghost_var = irandom_range(-1,ghost_len_var-1); }
    // Maps
        map_color_var = make_color_rgb(180,0,255);
        map_len_var = 2;
        scale_var = 16;
        if classic_var { map_var = 0; }
        else { map_var = irandom(map_len_var-1); }
        // Ms. Spook
            map_arr_var[0] = ds_grid_create(24,24);
            map_surf_var[0] = surface_create(24*scale_var,24*scale_var);
            map_bg_var[0,0] = bg_add_scr(pac_outline_bg_path,false,false);
            map_bg_var[0,1] = bg_add_scr(pac_glow_bg_path,false,false);
            map_mp_arr_var[0] = mp_grid_create(0,0,24,24,1,1);
            // Pac Spawn
                map_spawn_var[0,0] = 11;
                map_spawn_var[0,1] = 21;
            // Ghost Spawn
                map_ghost_len_var[0] = 4;
                map_ghost_var[0,0] = 10;
                map_ghost_var[0,1] = 12;
                map_ghost_var[0,2] = 11;
                map_ghost_var[0,3] = 12;
                map_ghost_var[0,4] = 12;
                map_ghost_var[0,5] = 12;
                map_ghost_var[0,6] = 13;
                map_ghost_var[0,7] = 12;
            // Ghost Scatter
                map_scatter_var[0,0] = 22; // 1
                map_scatter_var[0,1] = 3; // 3
                map_scatter_var[0,2] = 22;
                map_scatter_var[0,3] = 21;
                map_scatter_var[0,4] = 1;
                map_scatter_var[0,5] = 3;
                map_scatter_var[0,6] = 1;
                map_scatter_var[0,7] = 21;
            // Ghost Exit
                map_exit_var[0,0] = 11;
                map_exit_var[0,1] = 9;
            // Pellets
                ds_grid_set_region(map_arr_var[0],1,3,22,7,3);
                ds_grid_set_region(map_arr_var[0],0,8,7,14,3);
                ds_grid_set_region(map_arr_var[0],16,8,23,14,3);
                ds_grid_set_region(map_arr_var[0],1,15,10,21,3);
                ds_grid_set_region(map_arr_var[0],13,15,22,21,3);
                ds_grid_set_region(map_arr_var[0],11,17,12,17,3);
            // Power Pellets
                ds_grid_set(map_arr_var[0],1,5,4);
                ds_grid_set(map_arr_var[0],22,5,4);
                ds_grid_set(map_arr_var[0],1,16,4);
                ds_grid_set(map_arr_var[0],22,16,4);
            // Solid
                // Top
                    ds_grid_set_region(map_arr_var[0],0,0,23,2,1);
                    ds_grid_set_region(map_arr_var[0],11,3,12,7,1);
                    ds_grid_set_region(map_arr_var[0],8,8,15,8,1);
                    ds_grid_set_region(map_arr_var[0],0,3,0,7,1);
                    ds_grid_set_region(map_arr_var[0],23,3,23,7,1);
                    ds_grid_set_region(map_arr_var[0],0,8,4,11,1);
                    ds_grid_set_region(map_arr_var[0],19,8,23,11,1);
                // Blocks
                    ds_grid_set_region(map_arr_var[0],2,4,4,6,1);
                    ds_grid_set_region(map_arr_var[0],19,4,21,6,1);
                    ds_grid_set_region(map_arr_var[0],6,4,9,6,1);
                    ds_grid_set_region(map_arr_var[0],14,4,17,6,1);
                    ds_grid_set_region(map_arr_var[0],6,8,6,18,1);
                    ds_grid_set_region(map_arr_var[0],17,8,17,18,1);
                    ds_grid_set_region(map_arr_var[0],2,17,4,20,1);
                    ds_grid_set_region(map_arr_var[0],19,17,21,20,1);
                // Ghost Box
                    ds_grid_set_region(map_arr_var[0],8,10,10,10,1);
                    ds_grid_set_region(map_arr_var[0],13,10,15,10,1);
                    ds_grid_set_region(map_arr_var[0],8,11,8,13,1);
                    ds_grid_set_region(map_arr_var[0],15,11,15,13,1);
                    ds_grid_set_region(map_arr_var[0],8,14,15,14,1);
                    ds_grid_set_region(map_arr_var[0],11,10,12,10,2); // Ghost Border
                    ds_grid_set_region(map_arr_var[0],11,15,12,16,1);
                // Weird
                    ds_grid_set_region(map_arr_var[0],8,16,9,17,1);
                    ds_grid_set_region(map_arr_var[0],14,16,15,17,1);
                    ds_grid_set_region(map_arr_var[0],8,18,15,20,1);
                // Bottom
                    ds_grid_set_region(map_arr_var[0],0,22,23,23,1);
                    ds_grid_set_region(map_arr_var[0],6,20,6,21,1);
                    ds_grid_set_region(map_arr_var[0],17,20,17,21,1);
                    ds_grid_set_region(map_arr_var[0],0,16,0,21,1);
                    ds_grid_set_region(map_arr_var[0],23,16,23,21,1);
                    ds_grid_set_region(map_arr_var[0],0,13,4,15,1);
                    ds_grid_set_region(map_arr_var[0],19,13,23,15,1);
        // Classic
            map_arr_var[1] = ds_grid_create(28,36);
            map_surf_var[1] = surface_create(28*scale_var,36*scale_var);
            map_bg_var[1,0] = bg_add_scr(pac_classic_outline_bg_path,false,false);
            map_bg_var[1,1] = bg_add_scr(pac_classic_glow_bg_path,false,false);
            map_mp_arr_var[1] = mp_grid_create(0,0,28,36,1,1);
            // Pac Spawn
                map_spawn_var[1,0] = 13;
                map_spawn_var[1,1] = 26;
            // Ghost Spawn
                map_ghost_len_var[1] = 4;
                map_ghost_var[1,0] = 12;
                map_ghost_var[1,1] = 17;
                map_ghost_var[1,2] = 13;
                map_ghost_var[1,3] = 17;
                map_ghost_var[1,4] = 14;
                map_ghost_var[1,5] = 17;
                map_ghost_var[1,6] = 15;
                map_ghost_var[1,7] = 17;
            // Ghost Scatter
                map_scatter_var[1,0] = 26;
                map_scatter_var[1,1] = 4;
                map_scatter_var[1,2] = 26;
                map_scatter_var[1,3] = 32;
                map_scatter_var[1,4] = 1;
                map_scatter_var[1,5] = 4;
                map_scatter_var[1,6] = 1;
                map_scatter_var[1,7] = 32;
            // Ghost Exit
                map_exit_var[1,0] = 13;
                map_exit_var[1,1] = 14;
            // Pellets
                ds_grid_set_region(map_arr_var[1],1,4,26,11,3);
                ds_grid_set_region(map_arr_var[1],6,12,6,22,3);
                ds_grid_set_region(map_arr_var[1],21,12,21,22,3);
                ds_grid_set_region(map_arr_var[1],1,23,12,32,3);
                ds_grid_set_region(map_arr_var[1],15,23,26,32,3);
                ds_grid_set_region(map_arr_var[1],13,32,14,32,3);
            // Power Pellets
                ds_grid_set(map_arr_var[1],1,6,4);
                ds_grid_set(map_arr_var[1],26,6,4);
                ds_grid_set(map_arr_var[1],1,26,4);
                ds_grid_set(map_arr_var[1],26,26,4);
            // Solid
                // Top
                    ds_grid_set_region(map_arr_var[1],0,0,27,3,1);
                    ds_grid_set_region(map_arr_var[1],13,4,14,7,1);
                // Row 1
                    // Sides
                        ds_grid_set_region(map_arr_var[1],0,4,0,11,1);
                        ds_grid_set_region(map_arr_var[1],27,4,27,11,1);
                        ds_grid_set_region(map_arr_var[1],0,12,5,16,1);
                        ds_grid_set_region(map_arr_var[1],22,12,27,16,1);
                    // Blocks
                        ds_grid_set_region(map_arr_var[1],2,5,5,7,1);
                        ds_grid_set_region(map_arr_var[1],22,5,25,7,1);
                        ds_grid_set_region(map_arr_var[1],7,5,11,7,1);
                        ds_grid_set_region(map_arr_var[1],16,5,20,7,1);
                        ds_grid_set_region(map_arr_var[1],2,9,5,10,1);
                        ds_grid_set_region(map_arr_var[1],22,9,25,10,1);
                    // T
                        ds_grid_set_region(map_arr_var[1],7,9,8,16,1);
                        ds_grid_set_region(map_arr_var[1],9,12,11,13,1);
                        ds_grid_set_region(map_arr_var[1],19,9,20,16,1);
                        ds_grid_set_region(map_arr_var[1],16,12,18,13,1);
                        ds_grid_set_region(map_arr_var[1],10,9,17,10,1);
                        ds_grid_set_region(map_arr_var[1],13,11,14,13,1);
                // Ghost Box
                    ds_grid_set_region(map_arr_var[1],10,15,12,15,1);
                    ds_grid_set_region(map_arr_var[1],15,15,17,15,1);
                    ds_grid_set_region(map_arr_var[1],10,16,10,18,1);
                    ds_grid_set_region(map_arr_var[1],17,16,17,18,1);
                    ds_grid_set_region(map_arr_var[1],10,19,17,19,1);
                    ds_grid_set_region(map_arr_var[1],13,15,14,15,2); // Ghost Border
                // Row 2
                    // Sides
                        ds_grid_set_region(map_arr_var[1],0,18,5,22,1);
                        ds_grid_set_region(map_arr_var[1],0,23,0,32,1);
                        ds_grid_set_region(map_arr_var[1],1,27,2,28,1);
                        ds_grid_set_region(map_arr_var[1],22,18,27,22,1);
                        ds_grid_set_region(map_arr_var[1],27,23,27,32,1);
                        ds_grid_set_region(map_arr_var[1],25,27,26,28,1);
                    // Blocks
                        ds_grid_set_region(map_arr_var[1],7,18,8,22,1);
                        ds_grid_set_region(map_arr_var[1],19,18,20,22,1);
                        ds_grid_set_region(map_arr_var[1],7,24,11,25,1);
                        ds_grid_set_region(map_arr_var[1],16,24,20,25,1);
                    // L
                        ds_grid_set_region(map_arr_var[1],2,24,3,25,1);
                        ds_grid_set_region(map_arr_var[1],4,24,5,28,1);
                        ds_grid_set_region(map_arr_var[1],24,24,25,25,1);
                        ds_grid_set_region(map_arr_var[1],22,24,23,28,1);
                    // T
                        ds_grid_set_region(map_arr_var[1],10,21,17,22,1);
                        ds_grid_set_region(map_arr_var[1],13,23,14,25,1);
                        ds_grid_set_region(map_arr_var[1],10,27,17,28,1);
                        ds_grid_set_region(map_arr_var[1],13,29,14,31,1);
                    // Weird
                        ds_grid_set_region(map_arr_var[1],7,27,8,29,1);
                        ds_grid_set_region(map_arr_var[1],2,30,11,31,1);
                        ds_grid_set_region(map_arr_var[1],19,27,20,29,1);
                        ds_grid_set_region(map_arr_var[1],16,30,25,31,1);
                // Bottom
                    ds_grid_set_region(map_arr_var[1],0,33,27,35,1);
    // Alarms
        alarm_len_var = 3;
        alarm_ini_scr();
        set_alarm_scr(0,start_alarm_var);
    // Initialize
        // Map
            for (local.i=0; local.i<map_len_var; local.i+=1;)
            {
                mp_grid_clear_all(map_mp_arr_var[local.i]);
                map_pellet_var[local.i] = 0;
                for (local.j=0; local.j<ds_grid_width(map_arr_var[local.i]); local.j+=1;)
                {
                    for (local.k=0; local.k<ds_grid_height(map_arr_var[local.i]); local.k+=1;)
                    {
                        local.coll = ds_grid_get(map_arr_var[local.i],local.j,local.k);
                        if local.coll == 1
                        { mp_grid_add_cell(map_mp_arr_var[local.i],local.j,local.k); }
                        if local.coll == 3 || local.coll == 4 { map_pellet_var[local.i] += 1; }
                    }
                }
            }
            pellet_var = map_pellet_var[map_var];
            map_grid_var = ds_grid_create(1,1);
            ds_grid_copy(map_grid_var,map_arr_var[map_var]);
            map_mp_grid_var = map_mp_arr_var[map_var];
            surf_var = map_surf_var[map_var];
        // Ghosts
            for (local.i=0; local.i<map_ghost_len_var[map_var]; local.i+=1;)
            {
                local.index = local.i*2;
                if ghost_var < 0 { local.ghost = irandom(ghost_len_var-1); }
                else { local.ghost = ghost_var; }
                with instance_create(map_ghost_var[map_var,local.index],map_ghost_var[map_var,local.index+1],ghost_arr_var[local.ghost,mod_scr(local.i,ghost_len_arr_var[local.ghost])])
                {
                    par_var = other.id;
                    id_var = local.i;
                    state_var = 0;
                    on_var = false;
                    if other.classic_var
                    {
                        // if local.i+1 < global.player_len_var { player_id_var = local.i+1; }
                        if local.i==other.map_ghost_len_var[other.map_var]-1 { player_id_var = 0; }
                        if player_id_var == -1 { scare_state_var = 1; }
                    }
                }
            }
        // Pac
            fmod_snd_play_scr(start_snd_var);
            with instance_create(map_spawn_var[map_var,0],map_spawn_var[map_var,1],pac_obj_var)
            {
                par_var = other.id;
                on_var = false;
                set_alarm_scr(1,other.start_alarm_var);
            }
');
// Step
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    surface_set_target(surf_var);
    draw_clear_alpha(c_black,0);
    d3d_set_hidden(false);
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,surface_get_width(surf_var),surface_get_height(surf_var),0);
    draw_background_tiled(tile_bg_var,0,0);
    draw_background_stretched(map_bg_var[map_var,1],0,0,surface_get_width(surf_var),surface_get_height(surf_var));
    draw_background_stretched_ext(map_bg_var[map_var,0],0,0,surface_get_width(surf_var),surface_get_height(surf_var),map_color_var,1);
    for (local.i=0; local.i<live_var; local.i+=1;)
    {
        draw_sprite(pac_spr_var,local.i,((local.i*2)+1)*scale_var,surface_get_height(surf_var)-(scale_var*1));
    }
    draw_text_transformed(0,0,"Lives: "+string(live_var)+" Level: "+string(lvl_var)+" Score: "+string(score_var),0.25,0.25,0);
    for (local.i=0; local.i<ds_grid_width(map_arr_var[map_var]); local.i+=1;)
    {
        for (local.j=0; local.j<ds_grid_height(map_arr_var[map_var]); local.j+=1;)
        {
            local.draw = ds_grid_get(map_grid_var,local.i,local.j);
            switch local.draw
            {
                case 3: { draw_sprite(pellet_spr_var,0,scale_var*(local.i+0.5),scale_var*(local.j+0.5)); break; }
                case 4: { draw_sprite(power_pellet_spr_var,0,scale_var*(local.i+0.5),scale_var*(local.j+0.5)); break; }
            }
        }
    }
    with pac_obj_var
    {
        local.xtmp = x;
        local.ytmp = y;
        local.sprid = 0;
        if move_var
        {
            local.per = alarm_arr[0,0]/alarm_arr[0,1];
            local.xtmp = lerp_scr(x,x_prev_var,local.per);
            local.ytmp = lerp_scr(y,y_prev_var,local.per);
            local.sprid = lerp_scr(sprite_get_number(spr_var),0,local.per);
        }
        local.xtmp = (local.xtmp+0.5)*other.scale_var;
        local.ytmp = (local.ytmp+0.5)*other.scale_var;
        switch dead_var
        {
            case 2: { draw_sprite_ext(dead_spr_var,spr_id_var,local.xtmp,local.ytmp,1,1,0,image_blend,1); break; }
            case 1:
            {
                local.per = alarm_arr[2,0]/alarm_arr[2,1];
                local.xtmp2 = local.xtmp+lengthdir_x(local.per*160,45);
                local.ytmp2 = local.ytmp+lengthdir_y(local.per*160,45);
                draw_sprite_ext(nail_spr_var,0,local.xtmp2,local.ytmp2,1,1,-45,c_white,1);
            }
            default:
            {
                draw_sprite_ext(spr_var,local.sprid,local.xtmp,local.ytmp,1,1,dir_var*90,image_blend,1);
                break;
            }
        }
    }
    with pac_ghost_obj_var
    {
        local.turn = 1;
        local.xtmp = x;
        local.ytmp = y;
        local.sprid = 0;
        if move_var
        {
            local.per = alarm_arr[0,0]/alarm_arr[0,1];
            local.xtmp = lerp_scr(x,x_prev_var,local.per);
            local.ytmp = lerp_scr(y,y_prev_var,local.per);
            local.sprid = lerp_scr(sprite_get_number(base_spr_var),0,local.per);
        }
        if dir_var == 0 || dir_var == 3 { local.turn = -1; }
        local.xtmp = (local.xtmp+0.5)*other.scale_var;
        local.ytmp = (local.ytmp+0.5)*other.scale_var;
        if state_var == 4 // Scared
        {
            draw_sprite_ext(scare_base_spr_var,local.sprid,local.xtmp,local.ytmp,local.turn,1,0,scare_color_var,1);
            draw_sprite_ext(scare_eye_spr_var,local.sprid,local.xtmp,local.ytmp,local.turn,1,0,c_white,1);
        }
        else
        {
            if state_var != 5 // Not eaten
            { draw_sprite_ext(base_spr_var,local.sprid,local.xtmp,local.ytmp,local.turn,1,0,image_blend,1); }
            draw_sprite_ext(eye_spr_var,local.sprid,local.xtmp,local.ytmp,local.turn,1,0,c_white,1);
        }
        if other.debug_var
        {
            draw_text_transformed(local.xtmp,local.ytmp,string(state_var),0.25,0.25,0);
            draw_sprite_ext(other.pellet_spr_var,0,(target_x_var+0.5)*other.scale_var,(target_y_var+0.5)*other.scale_var,1,1,0,image_blend,1);
            if smart_var
            {
                d3d_transform_set_identity();
                d3d_transform_set_scaling(other.scale_var,other.scale_var,other.scale_var);
                draw_path(path_var,x,y,true);
                d3d_transform_set_identity();
            }
        }
    }
    surface_reset_target();
    d3d_set_hidden(global.draw_3d_var);
    d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
');
// State Alarm
object_event_add
(argument0,ev_alarm,0,'
    if scatter_alarm_var <= 0 { state_var = 2; }
    else { state_var = mod_scr(state_var,2)+1; }
    switch state_var
    {
        case 1:
        {
            with pac_ghost_obj_var
            {
                switch state_var
                {
                    case 0:
                    {
                        on_var = true;
                        state_var = 3;
                        break;
                    }
                    case 2:
                    {
                        dir_var = mod_scr(dir_var+2,4);
                        state_var = other.state_var;
                        break;
                    }
                }
            }
            set_alarm_scr(0,scatter_alarm_var);
            scatter_alarm_var -= scatter_rate_var;
            break;
        }
        case 2:
        {
            with pac_ghost_obj_var
            {
                switch state_var
                {
                    case 0:
                    {
                        on_var = false;
                        state_var = 3;
                        break;
                    }
                    case 1:
                    {
                        dir_var = mod_scr(dir_var+2,4);
                        state_var = other.state_var;
                        break;
                    }
                }
            }
            if scatter_alarm_var > 0
            { set_alarm_scr(0,chase_alarm_var); }
            break;
        }
    }
');
// Dead Alarm
object_event_add
(argument0,ev_alarm,1,'
    if live_var > 0
    {
        // Level
            set_alarm_scr(0,restart_alarm_var);
            state_var = 0;
        // Ghosts
            with pac_ghost_obj_var
            {
                local.index = id_var*2;
                x = other.map_ghost_var[other.map_var,local.index];
                y = other.map_ghost_var[other.map_var,local.index+1];
                x_prev_var = x;
                y_prev_var = y;
                reset_alarm_scr();
                move_var = false;
                state_var = 0;
                on_var = false;
            }
        // Pac
            local.inst = fmod_snd_play_scr(start_snd_var);
            fmod_inst_set_pos_scr(local.inst,restart_pos_var);
            with pac_obj_var
            {
                x = other.map_spawn_var[other.map_var,0];
                y = other.map_spawn_var[other.map_var,1];
                x_prev_var = x;
                y_prev_var = y;
                dead_var = false;
                move_var = false;
                on_var = false;
                reset_alarm_scr();
                set_alarm_scr(1,other.restart_alarm_var);
            }
    }
    else { set_alarm_scr(2,dead_alarm_02_var); }
');
// Dead Alarm 2
object_event_add
(argument0,ev_alarm,2,'
    live_var = live_max_var;
    lvl_var = 0;
    highscore_var = max(highscore_var,score_var);
    score_var = 0;
    event_user(0);
');
// Level Event
object_event_add
(argument0,ev_other,ev_user0,'
    // Level
        set_alarm_scr(0,start_alarm_var);
        state_var = 0;
        scare_alarm_var = scare_alarm_max_var-(scare_rate_var*lvl_var);
        scatter_alarm_var = max(scatter_alarm_min_var,scatter_alarm_max_var-(lvl_var*scatter_lvl_rate_var));
    // Map
        if classic_var
        {
            map_var = 0;
            ghost_var = 0;
        }
        else
        {
            map_var = irandom(map_len_var-1);
            ghost_var = irandom_range(-1,ghost_len_var-1);
        }
        ds_grid_copy(map_grid_var,map_arr_var[map_var]);
        map_mp_grid_var = map_mp_arr_var[map_var];
        surf_var = map_surf_var[map_var];
        pellet_var = map_pellet_var[map_var];
        
    // Ghosts
        with pac_ghost_obj_var { instance_destroy(); }
        for (local.i=0; local.i<map_ghost_len_var[map_var]; local.i+=1;)
        {
            local.index = local.i*2;
            if ghost_var < 0 { local.ghost = irandom(ghost_len_var-1); }
            else { local.ghost = ghost_var; }
            with instance_create(map_ghost_var[map_var,local.index],map_ghost_var[map_var,local.index+1],ghost_arr_var[local.ghost,mod_scr(local.i,ghost_len_arr_var[local.ghost])])
            {
                par_var = other.id;
                id_var = local.i;
                state_var = 0;
                on_var = false;
                if other.classic_var
                {
                    // if local.i+1 < global.player_len_var { player_id_var = local.i+1; }
                    if local.i==other.map_ghost_len_var[other.map_var]-1 { player_id_var = 0; }
                    if player_id_var == -1 { scare_state_var = 1; }
                }
            }
        }
    // Pac
        fmod_snd_play_scr(start_snd_var);
        with pac_obj_var
        {
            x = other.map_spawn_var[other.map_var,0];
            y = other.map_spawn_var[other.map_var,1];
            x_prev_var = x;
            y_prev_var = y;
            dead_var = false;
            move_var = false;
            on_var = false;
            reset_alarm_scr();
            set_alarm_scr(1,other.start_alarm_var);
        }
');
// Die Event
object_event_add
(argument0,ev_other,ev_user1,'
    live_var -= 1;
    // Not in multiplayer
    scatter_alarm_var = max(scatter_alarm_min_var,scatter_alarm_max_var-(lvl_var*scatter_lvl_rate_var));
    with pac_ghost_obj_var
    {
        reset_alarm_scr();
        state_var = 0;
    }
    set_alarm_scr(1,dead_alarm_01_var);
');
// Draw
object_event_add
(argument0,ev_draw,0,'
    if view_wview[view_current] > view_hview[view_current]
    {
        local.width = surface_get_width(surf_var); local.height = surface_get_height(surf_var);
        local.scale = min(view_wview[view_current]/local.width,view_hview[view_current]/local.height);
        local.width *= local.scale; local.height *= local.scale;
        local.xtmp = (view_wview[view_current]-local.width)*0.5;
        local.ytmp = (view_hview[view_current]-local.height)*0.5;
        draw_surface_stretched(surf_var,local.xtmp,local.ytmp,local.width,local.height)
    }
');