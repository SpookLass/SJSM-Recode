// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,load_par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Collisions
globalvar mad_clock_coll;
mad_clock_coll[1] = 24;
mad_clock_coll[2] = 9;
mad_clock_coll[3] = 9;
mad_clock_coll[0] = prop_to_coll_scr(7,'',mad_clock_coll[2],mad_clock_coll[3],mad_clock_coll[1]);
// Collisions
globalvar mad_clock_big_coll;
mad_clock_big_coll[1] = mad_clock_coll[1]*15;
mad_clock_big_coll[2] = mad_clock_coll[2]*15;
mad_clock_big_coll[3] = mad_clock_coll[3]*15;
mad_clock_big_coll[0] = prop_to_coll_scr(7,'',mad_clock_big_coll[2],mad_clock_big_coll[3],mad_clock_big_coll[1]);
// Create Event
object_event_add
(argument0,ev_create,0,'
    menu_var = false;
    // Backgrounds
        bg_len_var = 32;
        bg_arr_var[0,1] = mad_wall_bg_path;
        bg_arr_var[0,2] = false;
        bg_arr_var[0,3] = false;
        bg_arr_var[1,1] = mad_blood_wall_01_bg_path;
        bg_arr_var[1,2] = false;
        bg_arr_var[1,3] = false;
        bg_arr_var[2,1] = mad_blood_wall_02_bg_path;
        bg_arr_var[2,2] = false;
        bg_arr_var[2,3] = false;
        bg_arr_var[3,1] = mad_floor_bg_path;
        bg_arr_var[3,2] = false;
        bg_arr_var[3,3] = false;
        bg_arr_var[4,1] = mad_blood_floor_bg_path;
        bg_arr_var[4,2] = false;
        bg_arr_var[4,3] = false;
        bg_arr_var[5,1] = mad_ceil_bg_path;
        bg_arr_var[5,2] = false;
        bg_arr_var[5,3] = false;
        bg_arr_var[6,1] = mad_line_bg_path;
        bg_arr_var[6,2] = false;
        bg_arr_var[6,3] = false;
        bg_arr_var[7,1] = mad_clock_bg_path;
        bg_arr_var[7,2] = false;
        bg_arr_var[7,3] = false;
        bg_arr_var[8,1] = mad_door_bg_path;
        bg_arr_var[8,2] = false;
        bg_arr_var[8,3] = false;
        bg_arr_var[9,1] = mad_door_broke_bg_path;
        bg_arr_var[9,2] = false;
        bg_arr_var[9,3] = false;
        bg_arr_var[10,1] = mad_persona_wall_bg_path;
        bg_arr_var[10,2] = false;
        bg_arr_var[10,3] = false;
        bg_arr_var[11,1] = mad_persona_window_bg_path;
        bg_arr_var[11,2] = false;
        bg_arr_var[11,3] = false;
        bg_arr_var[12,1] = mad_persona_ceil_bg_path;
        bg_arr_var[12,2] = false;
        bg_arr_var[12,3] = false;
        bg_arr_var[13,1] = mad_persona_floor_bg_path;
        bg_arr_var[13,2] = false;
        bg_arr_var[13,3] = false;
        bg_arr_var[14,1] = mad_daycare_wall_01_bg_path;
        bg_arr_var[14,2] = false;
        bg_arr_var[14,3] = false;
        bg_arr_var[15,1] = mad_daycare_wall_02_bg_path;
        bg_arr_var[15,2] = false;
        bg_arr_var[15,3] = false;
        bg_arr_var[16,1] = mad_daycare_floor_01_bg_path;
        bg_arr_var[16,2] = false;
        bg_arr_var[16,3] = false;
        bg_arr_var[17,1] = mad_daycare_floor_02_bg_path;
        bg_arr_var[17,2] = false;
        bg_arr_var[17,3] = false;
        bg_arr_var[18,1] = mad_daycare_ceil_bg_path;
        bg_arr_var[18,2] = false;
        bg_arr_var[18,3] = false;
        bg_arr_var[19,1] = mad_spot_bg_path;
        bg_arr_var[19,2] = false;
        bg_arr_var[19,3] = false;
        bg_arr_var[20,1] = mad_arrow_bg_path;
        bg_arr_var[20,2] = false;
        bg_arr_var[20,3] = false;
        bg_arr_var[21,1] = mad_arrow_base_bg_path;
        bg_arr_var[21,2] = false;
        bg_arr_var[21,3] = false;
        bg_arr_var[22,1] = mad_space_bg_path;
        bg_arr_var[22,2] = false;
        bg_arr_var[22,3] = false;
        bg_arr_var[23,1] = mad_flesh_bg_path;
        bg_arr_var[23,2] = false;
        bg_arr_var[23,3] = false;
        bg_arr_var[24,1] = mad_trim_bg_path;
        bg_arr_var[24,2] = false;
        bg_arr_var[24,3] = false;
        bg_arr_var[25,1] = mad_blood_trim_01_bg_path;
        bg_arr_var[25,2] = false;
        bg_arr_var[25,3] = false;
        bg_arr_var[26,1] = mad_blood_trim_02_bg_path;
        bg_arr_var[26,2] = false;
        bg_arr_var[26,3] = false;
        bg_arr_var[27,1] = school_desk_top_bg_path;
        bg_arr_var[27,2] = false;
        bg_arr_var[27,3] = false;
        bg_arr_var[28,1] = school_desk_wood_bg_path;
        bg_arr_var[28,2] = false;
        bg_arr_var[28,3] = false;
        bg_arr_var[29,1] = mad_clock_top_bg_path;
        bg_arr_var[29,2] = false;
        bg_arr_var[29,3] = false;
        bg_arr_var[30,1] = mad_clock_hour_hand_bg_path;
        bg_arr_var[30,2] = false;
        bg_arr_var[30,3] = false;
        bg_arr_var[31,1] = mad_clock_minute_hand_bg_path;
        bg_arr_var[31,2] = false;
        bg_arr_var[31,3] = false;
    // Sprites
        spr_len_var = 5;
        spr_arr_var[0,1] = mad_clock_spr_path;
        spr_arr_var[0,2] = 9;
        spr_arr_var[0,3] = false;
        spr_arr_var[0,4] = false;
        spr_arr_var[0,5] = 0;
        spr_arr_var[0,6] = 0;
        spr_arr_var[1,1] = mad_pc_spr_path;
        spr_arr_var[1,2] = 6;
        spr_arr_var[1,3] = false;
        spr_arr_var[1,4] = false;
        spr_arr_var[1,5] = 0;
        spr_arr_var[1,6] = 0;
        spr_arr_var[2,1] = mad_slug_spr_path;
        spr_arr_var[2,2] = 6;
        spr_arr_var[2,3] = false;
        spr_arr_var[2,4] = false;
        spr_arr_var[2,5] = 0;
        spr_arr_var[2,6] = 0;
        spr_arr_var[3,1] = mad_cat_spr_path;
        spr_arr_var[3,2] = 9;
        spr_arr_var[3,3] = false;
        spr_arr_var[3,4] = false;
        spr_arr_var[3,5] = 0;
        spr_arr_var[3,6] = 0;
        spr_arr_var[4,1] = mad_cat_appear_spr_path;
        spr_arr_var[4,2] = 7;
        spr_arr_var[4,3] = false;
        spr_arr_var[4,4] = false;
        spr_arr_var[4,5] = 0;
        spr_arr_var[4,6] = 0;
    // Models
        mdl_len_var = 8;
        mdl_arr_var[0,1] = mad_trim_down_mdl_path;
        mdl_arr_var[1,1] = mad_trim_up_mdl_path;
        mdl_arr_var[2,1] = mad_trim_side_mdl_path;
        mdl_arr_var[3,1] = mad_trim_door_mdl_path;
        mdl_arr_var[4,1] = mad_trim_door_left_mdl_path;
        mdl_arr_var[5,1] = mad_trim_door_right_mdl_path;
        mdl_arr_var[6,1] = mad_trim_doorframe_mdl_path;
        mdl_arr_var[7,1] = mad_space_mdl_path;
    // Sounds
        snd_len_var = 12;
        snd_arr_var[0,1] = mad_persona_mus_snd_path;
        snd_arr_var[0,2] = false;
        snd_arr_var[0,3] = snd_group_mus_const;
        snd_arr_var[0,4] = 1;
        snd_arr_var[0,5] = 0;
        snd_arr_var[0,6] = 0;
        snd_arr_var[1,1] = mad_daycare_mus_snd_path;
        snd_arr_var[1,2] = false;
        snd_arr_var[1,3] = snd_group_mus_const;
        snd_arr_var[1,4] = 1;
        snd_arr_var[1,5] = 0;
        snd_arr_var[1,6] = 0;
        snd_arr_var[2,1] = mad_space_mus_snd_path;
        snd_arr_var[2,2] = false;
        snd_arr_var[2,3] = snd_group_mus_const;
        snd_arr_var[2,4] = 1;
        snd_arr_var[2,5] = 0;
        snd_arr_var[2,6] = 0;
        snd_arr_var[3,1] = mad_clock_01_snd_path;
        snd_arr_var[3,2] = true;
        snd_arr_var[3,3] = snd_group_sfx_const;
        snd_arr_var[3,4] = 1;
        snd_arr_var[3,5] = 0;
        snd_arr_var[3,6] = 0;
        snd_arr_var[4,1] = mad_clock_02_snd_path;
        snd_arr_var[4,2] = true;
        snd_arr_var[4,3] = snd_group_sfx_const;
        snd_arr_var[4,4] = 1;
        snd_arr_var[4,5] = 0;
        snd_arr_var[4,6] = 0;
        snd_arr_var[5,1] = mad_cat_pop_snd_path;
        snd_arr_var[5,2] = true;
        snd_arr_var[5,3] = snd_group_sfx_const;
        snd_arr_var[5,4] = 1;
        snd_arr_var[5,5] = 0;
        snd_arr_var[5,6] = 300;
        if global.diff_var != 0
        { snd_arr_var[6,1] = mad_cat_01_snd_path; }
        else { snd_arr_var[6,1] = mad_cat_01_easiest_snd_path; }
        snd_arr_var[6,2] = true;
        snd_arr_var[6,3] = snd_group_voice_const;
        snd_arr_var[6,4] = 1;
        snd_arr_var[6,5] = 0;
        snd_arr_var[6,6] = 300;
        if global.diff_var != 0
        { snd_arr_var[7,1] = mad_cat_02_snd_path; }
        else { snd_arr_var[7,1] = mad_cat_02_easiest_snd_path; }
        snd_arr_var[7,2] = true;
        snd_arr_var[7,3] = snd_group_voice_const;
        snd_arr_var[7,4] = 1;
        snd_arr_var[7,5] = 0;
        snd_arr_var[7,6] = 300;
        snd_arr_var[8,1] = mad_cat_03_snd_path;
        snd_arr_var[8,2] = true;
        snd_arr_var[8,3] = snd_group_voice_const;
        snd_arr_var[8,4] = 1;
        snd_arr_var[8,5] = 0;
        snd_arr_var[8,6] = 300;
        snd_arr_var[9,1] = mad_cat_04_snd_path;
        snd_arr_var[9,2] = true;
        snd_arr_var[9,3] = snd_group_voice_const;
        snd_arr_var[9,4] = 1;
        snd_arr_var[9,5] = 0;
        snd_arr_var[9,6] = 300;
        snd_arr_var[10,1] = mad_cat_05_snd_path;
        snd_arr_var[10,2] = true;
        snd_arr_var[10,3] = snd_group_voice_const;
        snd_arr_var[10,4] = 1;
        snd_arr_var[10,5] = 0;
        snd_arr_var[10,6] = 300;
        snd_arr_var[11,1] = mad_cat_06_snd_path;
        snd_arr_var[11,2] = true;
        snd_arr_var[11,3] = snd_group_voice_const;
        snd_arr_var[11,4] = 1;
        snd_arr_var[11,5] = 0;
        snd_arr_var[11,6] = 300;
    // Paths
        path_len_var = 1;
        path_arr_var[0,1] = "flesh_path";
        path_arr_var[0,2] = 1;
        path_arr_var[0,3] = false;
        path_arr_var[0,4] = 4;
    // Surfaces
        surf_len_var = 1;
        surf_arr_var[0,1] = "mad_surf";
        surf_arr_var[0,2] = 256;
        surf_arr_var[0,3] = 256;
    // Objects
        obj_len_var = 79;
        // Walls
            // Regular
                obj_arr_var[0,1] = spawn_wall_obj_path;
                obj_arr_var[0,2] = "mad_wall_obj";
                obj_arr_var[0,3] = 2;
                obj_arr_var[0,4] = 0; // Background (Index)
                obj_arr_var[0,5] = true; // Horizontal and vertical

                obj_arr_var[1,1] = spawn_wall_obj_path;
                obj_arr_var[1,2] = "mad_wall_high_obj";
                obj_arr_var[1,3] = 4;
                obj_arr_var[1,4] = 0; // Background (Index)
                obj_arr_var[1,5] = true; // Horizontal and vertical
                obj_arr_var[1,6] = 0; // Width (Default)
                obj_arr_var[1,7] = 64; // Height

                obj_arr_var[2,1] = spawn_wall_obj_path;
                obj_arr_var[2,2] = "mad_wall_pit_obj";
                obj_arr_var[2,3] = 9;
                obj_arr_var[2,4] = 0; // Background (Index)
                obj_arr_var[2,5] = true; // Horizontal and vertical
                obj_arr_var[2,6] = 0; // Width (Default)
                obj_arr_var[2,7] = 320; // Height
                obj_arr_var[2,8] = -320; // Z
                obj_arr_var[2,9] = 0; // Texture Width (Default)
                obj_arr_var[2,10] = 0; // Texture Height (Default)
                obj_arr_var[2,11] = 0; // Mask (Default)
                obj_arr_var[2,12] = true; // No Grid

                obj_arr_var[3,1] = spawn_wall_obj_path;
                obj_arr_var[3,2] = "mad_wall_2up_8high_obj";
                obj_arr_var[3,3] = 9;
                obj_arr_var[3,4] = 0; // Background (Index)
                obj_arr_var[3,5] = true; // Horizontal and vertical
                obj_arr_var[3,6] = 0; // Width (Default)
                obj_arr_var[3,7] = 256; // Height
                obj_arr_var[3,8] = 64; // Z
                obj_arr_var[3,9] = 0; // Texture Width (Default)
                obj_arr_var[3,10] = 0; // Texture Height (Default)
                obj_arr_var[3,11] = 0; // Mask (Default)
                obj_arr_var[3,12] = true; // No Grid
            // Side
                obj_arr_var[4,1] = spawn_wall_obj_path;
                obj_arr_var[4,2] = "mad_persona_wall_obj";
                obj_arr_var[4,3] = 2;
                obj_arr_var[4,4] = 10; // Background (Index)
                obj_arr_var[4,5] = true; // Horizontal and vertical

                obj_arr_var[5,1] = spawn_wall_obj_path;
                obj_arr_var[5,2] = "mad_persona_window_obj";
                obj_arr_var[5,3] = 2;
                obj_arr_var[5,4] = 11; // Background (Index)
                obj_arr_var[5,5] = true; // Horizontal and vertical

                obj_arr_var[6,1] = spawn_wall_obj_path;
                obj_arr_var[6,2] = "mad_daycare_wall_01_obj";
                obj_arr_var[6,3] = 2;
                obj_arr_var[6,4] = 14; // Background (Index)
                obj_arr_var[6,5] = true; // Horizontal and vertical

                obj_arr_var[7,1] = spawn_wall_obj_path;
                obj_arr_var[7,2] = "mad_daycare_wall_02_obj";
                obj_arr_var[7,3] = 2;
                obj_arr_var[7,4] = 15; // Background (Index)
                obj_arr_var[7,5] = true; // Horizontal and vertical
            // Blood 1
                obj_arr_var[8,1] = spawn_wall_obj_path;
                obj_arr_var[8,2] = "mad_blood_wall_01_obj";
                obj_arr_var[8,3] = 2;
                obj_arr_var[8,4] = 1; // Background (Index)
                obj_arr_var[8,5] = true; // Horizontal and vertical

                obj_arr_var[9,1] = spawn_wall_obj_path;
                obj_arr_var[9,2] = "mad_blood_wall_01_high_obj";
                obj_arr_var[9,3] = 4;
                obj_arr_var[9,4] = 1; // Background (Index)
                obj_arr_var[9,5] = true; // Horizontal and vertical
                obj_arr_var[9,6] = 0; // Width (Default)
                obj_arr_var[9,7] = 64; // Height

                obj_arr_var[10,1] = spawn_wall_obj_path;
                obj_arr_var[10,2] = "mad_blood_wall_01_pit_obj";
                obj_arr_var[10,3] = 9;
                obj_arr_var[10,4] = 1; // Background (Index)
                obj_arr_var[10,5] = true; // Horizontal and vertical
                obj_arr_var[10,6] = 0; // Width (Default)
                obj_arr_var[10,7] = 320; // Height
                obj_arr_var[10,8] = -320; // Z
                obj_arr_var[10,9] = 0; // Texture Width (Default)
                obj_arr_var[10,10] = 0; // Texture Height (Default)
                obj_arr_var[10,11] = 0; // Mask (Default)
                obj_arr_var[10,12] = true; // No Grid

                obj_arr_var[11,1] = spawn_wall_obj_path;
                obj_arr_var[11,2] = "mad_blood_wall_01_2up_8high_obj";
                obj_arr_var[11,3] = 9;
                obj_arr_var[11,4] = 1; // Background (Index)
                obj_arr_var[11,5] = true; // Horizontal and vertical
                obj_arr_var[11,6] = 0; // Width (Default)
                obj_arr_var[11,7] = 256; // Height
                obj_arr_var[11,8] = 64; // Z
                obj_arr_var[11,9] = 0; // Texture Width (Default)
                obj_arr_var[11,10] = 0; // Texture Height (Default)
                obj_arr_var[11,11] = 0; // Mask (Default)
                obj_arr_var[11,12] = true; // No Grid
            // Blood 2
                obj_arr_var[12,1] = spawn_wall_obj_path;
                obj_arr_var[12,2] = "mad_blood_wall_02_obj";
                obj_arr_var[12,3] = 2;
                obj_arr_var[12,4] = 2; // Background (Index)
                obj_arr_var[12,5] = true; // Horizontal and vertical

                obj_arr_var[13,1] = spawn_wall_obj_path;
                obj_arr_var[13,2] = "mad_blood_wall_02_high_obj";
                obj_arr_var[13,3] = 4;
                obj_arr_var[13,4] = 2; // Background (Index)
                obj_arr_var[13,5] = true; // Horizontal and vertical
                obj_arr_var[13,6] = 0; // Width (Default)
                obj_arr_var[13,7] = 64; // Height

                obj_arr_var[14,1] = spawn_wall_obj_path;
                obj_arr_var[14,2] = "mad_blood_wall_02_pit_obj";
                obj_arr_var[14,3] = 9;
                obj_arr_var[14,4] = 2; // Background (Index)
                obj_arr_var[14,5] = true; // Horizontal and vertical
                obj_arr_var[14,6] = 0; // Width (Default)
                obj_arr_var[14,7] = 320; // Height
                obj_arr_var[14,8] = -320; // Z
                obj_arr_var[14,9] = 0; // Texture Width (Default)
                obj_arr_var[14,10] = 0; // Texture Height (Default)
                obj_arr_var[14,11] = 0; // Mask (Default)
                obj_arr_var[14,12] = true; // No Grid

                obj_arr_var[15,1] = spawn_wall_obj_path;
                obj_arr_var[15,2] = "mad_blood_wall_02_2up_8high_obj";
                obj_arr_var[15,3] = 9;
                obj_arr_var[15,4] = 2; // Background (Index)
                obj_arr_var[15,5] = true; // Horizontal and vertical
                obj_arr_var[15,6] = 0; // Width (Default)
                obj_arr_var[15,7] = 256; // Height
                obj_arr_var[15,8] = 64; // Z
                obj_arr_var[15,9] = 0; // Texture Width (Default)
                obj_arr_var[15,10] = 0; // Texture Height (Default)
                obj_arr_var[15,11] = 0; // Mask (Default)
                obj_arr_var[15,12] = true; // No Grid
        // Trims
            // Regular
                obj_arr_var[16,1] = mad_trim_obj_path;
                obj_arr_var[16,2] = "mad_trim_down_obj";
                obj_arr_var[16,3] = 8;
                obj_arr_var[16,4] = 24; // Background (Index)
                obj_arr_var[16,5] = 0; // Model (Index)
                obj_arr_var[16,6] = true; // Horizontal & Vertical
                obj_arr_var[16,7] = 1.5; // Width
                obj_arr_var[16,8] = 32; // Length
                obj_arr_var[16,9] = 32; // Height
                obj_arr_var[16,10] = 0; // Z
                obj_arr_var[16,11] = false; // Loop

                obj_arr_var[17,1] = mad_trim_obj_path;
                obj_arr_var[17,2] = "mad_trim_up_obj";
                obj_arr_var[17,3] = 8;
                obj_arr_var[17,4] = 24; // Background (Index)
                obj_arr_var[17,5] = 1; // Model (Index)
                obj_arr_var[17,6] = true; // Horizontal & Vertical
                obj_arr_var[17,7] = 1; // Width
                obj_arr_var[17,8] = 32; // Length
                obj_arr_var[17,9] = 32; // Height
                obj_arr_var[17,10] = 0; // Z
                obj_arr_var[17,11] = false; // Loop

                obj_arr_var[18,1] = mad_trim_obj_path;
                obj_arr_var[18,2] = "mad_trim_up_high_obj";
                obj_arr_var[18,3] = 8;
                obj_arr_var[18,4] = 24; // Background (Index)
                obj_arr_var[18,5] = 1; // Model (Index)
                obj_arr_var[18,6] = true; // Horizontal & Vertical
                obj_arr_var[18,7] = 1; // Width
                obj_arr_var[18,8] = 32; // Length
                obj_arr_var[18,9] = 32; // Height
                obj_arr_var[18,10] = 32; // Z
                obj_arr_var[18,11] = false; // Loop

                obj_arr_var[19,1] = mad_trim_obj_path;
                obj_arr_var[19,2] = "mad_trim_side_obj";
                obj_arr_var[19,3] = 8;
                obj_arr_var[19,4] = 24; // Background (Index)
                obj_arr_var[19,5] = 2; // Model (Index)
                obj_arr_var[19,6] = false; // Horizontal & Vertical
                obj_arr_var[19,7] = 2; // Width
                obj_arr_var[19,8] = 2; // Length
                obj_arr_var[19,9] = 32; // Height
                obj_arr_var[19,10] = 0; // Z
                obj_arr_var[19,11] = false; // Loop

                obj_arr_var[20,1] = mad_trim_obj_path;
                obj_arr_var[20,2] = "mad_trim_side_high_obj";
                obj_arr_var[20,3] = 8;
                obj_arr_var[20,4] = 24; // Background (Index)
                obj_arr_var[20,5] = 2; // Model (Index)
                obj_arr_var[20,6] = false; // Horizontal & Vertical
                obj_arr_var[20,7] = 2; // Width
                obj_arr_var[20,8] = 2; // Length
                obj_arr_var[20,9] = 32; // Height
                obj_arr_var[20,10] = 32; // Z
                obj_arr_var[20,11] = false; // Loop

                obj_arr_var[21,1] = mad_trim_obj_path;
                obj_arr_var[21,2] = "mad_trim_side_pit_obj";
                obj_arr_var[21,3] = 8;
                obj_arr_var[21,4] = 24; // Background (Index)
                obj_arr_var[21,5] = 2; // Model (Index)
                obj_arr_var[21,6] = false; // Horizontal & Vertical
                obj_arr_var[21,7] = 2; // Width
                obj_arr_var[21,8] = 2; // Length
                obj_arr_var[21,9] = 640; // Height
                obj_arr_var[21,10] = -320; // Z
                obj_arr_var[21,11] = true; // Loop

                obj_arr_var[22,1] = mad_trim_obj_path;
                obj_arr_var[22,2] = "mad_trim_door_obj";
                obj_arr_var[22,3] = 8;
                obj_arr_var[22,4] = 24; // Background (Index)
                obj_arr_var[22,5] = 3; // Model (Index)
                obj_arr_var[22,6] = true; // Horizontal & Vertical
                obj_arr_var[22,7] = 1.5; // Width
                obj_arr_var[22,8] = 32; // Length
                obj_arr_var[22,9] = 32; // Height
                obj_arr_var[22,10] = 0; // Z
                obj_arr_var[22,11] = false; // Loop

                obj_arr_var[23,1] = mad_trim_obj_path;
                obj_arr_var[23,2] = "mad_trim_door_left_obj";
                obj_arr_var[23,3] = 8;
                obj_arr_var[23,4] = 24; // Background (Index)
                obj_arr_var[23,5] = 4; // Model (Index)
                obj_arr_var[23,6] = true; // Horizontal & Vertical
                obj_arr_var[23,7] = 1.5; // Width
                obj_arr_var[23,8] = 32; // Length
                obj_arr_var[23,9] = 32; // Height
                obj_arr_var[23,10] = 0; // Z
                obj_arr_var[23,11] = false; // Loop

                obj_arr_var[24,1] = mad_trim_obj_path;
                obj_arr_var[24,2] = "mad_trim_door_right_obj";
                obj_arr_var[24,3] = 8;
                obj_arr_var[24,4] = 24; // Background (Index)
                obj_arr_var[24,5] = 5; // Model (Index)
                obj_arr_var[24,6] = true; // Horizontal & Vertical
                obj_arr_var[24,7] = 1.5; // Width
                obj_arr_var[24,8] = 32; // Length
                obj_arr_var[24,9] = 32; // Height
                obj_arr_var[24,10] = 0; // Z
                obj_arr_var[24,11] = false; // Loop

                obj_arr_var[25,1] = mad_trim_obj_path;
                obj_arr_var[25,2] = "mad_trim_doorframe_obj";
                obj_arr_var[25,3] = 8;
                obj_arr_var[25,4] = 24; // Background (Index)
                obj_arr_var[25,5] = 6; // Model (Index)
                obj_arr_var[25,6] = true; // Horizontal & Vertical
                obj_arr_var[25,7] = 1.5; // Width
                obj_arr_var[25,8] = 32; // Length
                obj_arr_var[25,9] = 32; // Height
                obj_arr_var[25,10] = 0; // Z
                obj_arr_var[25,11] = false; // Loop
            // Blood 1
                obj_arr_var[26,1] = mad_trim_obj_path;
                obj_arr_var[26,2] = "mad_blood_trim_01_down_obj";
                obj_arr_var[26,3] = 8;
                obj_arr_var[26,4] = 25; // Background (Index)
                obj_arr_var[26,5] = 0; // Model (Index)
                obj_arr_var[26,6] = true; // Horizontal & Vertical
                obj_arr_var[26,7] = 1.5; // Width
                obj_arr_var[26,8] = 32; // Length
                obj_arr_var[26,9] = 32; // Height
                obj_arr_var[26,10] = 0; // Z
                obj_arr_var[26,11] = false; // Loop

                obj_arr_var[27,1] = mad_trim_obj_path;
                obj_arr_var[27,2] = "mad_blood_trim_01_up_obj";
                obj_arr_var[27,3] = 8;
                obj_arr_var[27,4] = 25; // Background (Index)
                obj_arr_var[27,5] = 1; // Model (Index)
                obj_arr_var[27,6] = true; // Horizontal & Vertical
                obj_arr_var[27,7] = 1; // Width
                obj_arr_var[27,8] = 32; // Length
                obj_arr_var[27,9] = 32; // Height
                obj_arr_var[27,10] = 0; // Z
                obj_arr_var[27,11] = false; // Loop

                obj_arr_var[28,1] = mad_trim_obj_path;
                obj_arr_var[28,2] = "mad_blood_trim_01_up_high_obj";
                obj_arr_var[28,3] = 8;
                obj_arr_var[28,4] = 25; // Background (Index)
                obj_arr_var[28,5] = 1; // Model (Index)
                obj_arr_var[28,6] = true; // Horizontal & Vertical
                obj_arr_var[28,7] = 1; // Width
                obj_arr_var[28,8] = 32; // Length
                obj_arr_var[28,9] = 32; // Height
                obj_arr_var[28,10] = 32; // Z
                obj_arr_var[28,11] = false; // Loop

                obj_arr_var[29,1] = mad_trim_obj_path;
                obj_arr_var[29,2] = "mad_blood_trim_01_side_obj";
                obj_arr_var[29,3] = 8;
                obj_arr_var[29,4] = 25; // Background (Index)
                obj_arr_var[29,5] = 2; // Model (Index)
                obj_arr_var[29,6] = false; // Horizontal & Vertical
                obj_arr_var[29,7] = 2; // Width
                obj_arr_var[29,8] = 2; // Length
                obj_arr_var[29,9] = 32; // Height
                obj_arr_var[29,10] = 0; // Z
                obj_arr_var[29,11] = false; // Loop

                obj_arr_var[30,1] = mad_trim_obj_path;
                obj_arr_var[30,2] = "mad_blood_trim_01_side_high_obj";
                obj_arr_var[30,3] = 8;
                obj_arr_var[30,4] = 25; // Background (Index)
                obj_arr_var[30,5] = 2; // Model (Index)
                obj_arr_var[30,6] = false; // Horizontal & Vertical
                obj_arr_var[30,7] = 2; // Width
                obj_arr_var[30,8] = 2; // Length
                obj_arr_var[30,9] = 32; // Height
                obj_arr_var[30,10] = 32; // Z
                obj_arr_var[30,11] = false; // Loop

                obj_arr_var[31,1] = mad_trim_obj_path;
                obj_arr_var[31,2] = "mad_blood_trim_01_side_pit_obj";
                obj_arr_var[31,3] = 8;
                obj_arr_var[31,4] = 25; // Background (Index)
                obj_arr_var[31,5] = 2; // Model (Index)
                obj_arr_var[31,6] = false; // Horizontal & Vertical
                obj_arr_var[31,7] = 2; // Width
                obj_arr_var[31,8] = 2; // Length
                obj_arr_var[31,9] = 640; // Height
                obj_arr_var[31,10] = -320; // Z
                obj_arr_var[31,11] = true; // Loop

                obj_arr_var[32,1] = mad_trim_obj_path;
                obj_arr_var[32,2] = "mad_blood_trim_01_door_obj";
                obj_arr_var[32,3] = 8;
                obj_arr_var[32,4] = 25; // Background (Index)
                obj_arr_var[32,5] = 3; // Model (Index)
                obj_arr_var[32,6] = true; // Horizontal & Vertical
                obj_arr_var[32,7] = 1.5; // Width
                obj_arr_var[32,8] = 32; // Length
                obj_arr_var[32,9] = 32; // Height
                obj_arr_var[32,10] = 0; // Z
                obj_arr_var[32,11] = false; // Loop

                obj_arr_var[33,1] = mad_trim_obj_path;
                obj_arr_var[33,2] = "mad_blood_trim_01_door_left_obj";
                obj_arr_var[33,3] = 8;
                obj_arr_var[33,4] = 25; // Background (Index)
                obj_arr_var[33,5] = 4; // Model (Index)
                obj_arr_var[33,6] = true; // Horizontal & Vertical
                obj_arr_var[33,7] = 1.5; // Width
                obj_arr_var[33,8] = 32; // Length
                obj_arr_var[33,9] = 32; // Height
                obj_arr_var[33,10] = 0; // Z
                obj_arr_var[33,11] = false; // Loop

                obj_arr_var[34,1] = mad_trim_obj_path;
                obj_arr_var[34,2] = "mad_blood_trim_01_door_right_obj";
                obj_arr_var[34,3] = 8;
                obj_arr_var[34,4] = 25; // Background (Index)
                obj_arr_var[34,5] = 5; // Model (Index)
                obj_arr_var[34,6] = true; // Horizontal & Vertical
                obj_arr_var[34,7] = 1.5; // Width
                obj_arr_var[34,8] = 32; // Length
                obj_arr_var[34,9] = 32; // Height
                obj_arr_var[34,10] = 0; // Z
                obj_arr_var[34,11] = false; // Loop

                obj_arr_var[35,1] = mad_trim_obj_path;
                obj_arr_var[35,2] = "mad_blood_trim_01_doorframe_obj";
                obj_arr_var[35,3] = 8;
                obj_arr_var[35,4] = 25; // Background (Index)
                obj_arr_var[35,5] = 6; // Model (Index)
                obj_arr_var[35,6] = true; // Horizontal & Vertical
                obj_arr_var[35,7] = 1.5; // Width
                obj_arr_var[35,8] = 32; // Length
                obj_arr_var[35,9] = 32; // Height
                obj_arr_var[35,10] = 0; // Z
                obj_arr_var[35,11] = false; // Loop
            // Blood 2
                obj_arr_var[36,1] = mad_trim_obj_path;
                obj_arr_var[36,2] = "mad_blood_trim_02_down_obj";
                obj_arr_var[36,3] = 8;
                obj_arr_var[36,4] = 26; // Background (Index)
                obj_arr_var[36,5] = 0; // Model (Index)
                obj_arr_var[36,6] = true; // Horizontal & Vertical
                obj_arr_var[36,7] = 1.5; // Width
                obj_arr_var[36,8] = 32; // Length
                obj_arr_var[36,9] = 32; // Height
                obj_arr_var[36,10] = 0; // Z
                obj_arr_var[36,11] = false; // Loop

                obj_arr_var[37,1] = mad_trim_obj_path;
                obj_arr_var[37,2] = "mad_blood_trim_02_up_obj";
                obj_arr_var[37,3] = 8;
                obj_arr_var[37,4] = 26; // Background (Index)
                obj_arr_var[37,5] = 1; // Model (Index)
                obj_arr_var[37,6] = true; // Horizontal & Vertical
                obj_arr_var[37,7] = 1; // Width
                obj_arr_var[37,8] = 32; // Length
                obj_arr_var[37,9] = 32; // Height
                obj_arr_var[37,10] = 0; // Z
                obj_arr_var[37,11] = false; // Loop

                obj_arr_var[38,1] = mad_trim_obj_path;
                obj_arr_var[38,2] = "mad_blood_trim_02_up_high_obj";
                obj_arr_var[38,3] = 8;
                obj_arr_var[38,4] = 26; // Background (Index)
                obj_arr_var[38,5] = 1; // Model (Index)
                obj_arr_var[38,6] = true; // Horizontal & Vertical
                obj_arr_var[38,7] = 1; // Width
                obj_arr_var[38,8] = 32; // Length
                obj_arr_var[38,9] = 32; // Height
                obj_arr_var[38,10] = 32; // Z
                obj_arr_var[38,11] = false; // Loop

                obj_arr_var[39,1] = mad_trim_obj_path;
                obj_arr_var[39,2] = "mad_blood_trim_02_side_obj";
                obj_arr_var[39,3] = 8;
                obj_arr_var[39,4] = 26; // Background (Index)
                obj_arr_var[39,5] = 2; // Model (Index)
                obj_arr_var[39,6] = false; // Horizontal & Vertical
                obj_arr_var[39,7] = 2; // Width
                obj_arr_var[39,8] = 2; // Length
                obj_arr_var[39,9] = 32; // Height
                obj_arr_var[39,10] = 0; // Z
                obj_arr_var[39,11] = false; // Loop

                obj_arr_var[40,1] = mad_trim_obj_path;
                obj_arr_var[40,2] = "mad_blood_trim_02_side_high_obj";
                obj_arr_var[40,3] = 8;
                obj_arr_var[40,4] = 26; // Background (Index)
                obj_arr_var[40,5] = 2; // Model (Index)
                obj_arr_var[40,6] = false; // Horizontal & Vertical
                obj_arr_var[40,7] = 2; // Width
                obj_arr_var[40,8] = 2; // Length
                obj_arr_var[40,9] = 32; // Height
                obj_arr_var[40,10] = 32; // Z
                obj_arr_var[40,11] = false; // Loop

                obj_arr_var[41,1] = mad_trim_obj_path;
                obj_arr_var[41,2] = "mad_blood_trim_02_side_pit_obj";
                obj_arr_var[41,3] = 8;
                obj_arr_var[41,4] = 26; // Background (Index)
                obj_arr_var[41,5] = 2; // Model (Index)
                obj_arr_var[41,6] = false; // Horizontal & Vertical
                obj_arr_var[41,7] = 2; // Width
                obj_arr_var[41,8] = 2; // Length
                obj_arr_var[41,9] = 640; // Height
                obj_arr_var[41,10] = -320; // Z
                obj_arr_var[41,11] = true; // Loop

                obj_arr_var[42,1] = mad_trim_obj_path;
                obj_arr_var[42,2] = "mad_blood_trim_02_door_obj";
                obj_arr_var[42,3] = 8;
                obj_arr_var[42,4] = 26; // Background (Index)
                obj_arr_var[42,5] = 3; // Model (Index)
                obj_arr_var[42,6] = true; // Horizontal & Vertical
                obj_arr_var[42,7] = 1.5; // Width
                obj_arr_var[42,8] = 32; // Length
                obj_arr_var[42,9] = 32; // Height
                obj_arr_var[42,10] = 0; // Z
                obj_arr_var[42,11] = false; // Loop

                obj_arr_var[43,1] = mad_trim_obj_path;
                obj_arr_var[43,2] = "mad_blood_trim_02_door_left_obj";
                obj_arr_var[43,3] = 8;
                obj_arr_var[43,4] = 26; // Background (Index)
                obj_arr_var[43,5] = 4; // Model (Index)
                obj_arr_var[43,6] = true; // Horizontal & Vertical
                obj_arr_var[43,7] = 1.5; // Width
                obj_arr_var[43,8] = 32; // Length
                obj_arr_var[43,9] = 32; // Height
                obj_arr_var[43,10] = 0; // Z
                obj_arr_var[43,11] = false; // Loop

                obj_arr_var[44,1] = mad_trim_obj_path;
                obj_arr_var[44,2] = "mad_blood_trim_02_door_right_obj";
                obj_arr_var[44,3] = 8;
                obj_arr_var[44,4] = 26; // Background (Index)
                obj_arr_var[44,5] = 5; // Model (Index)
                obj_arr_var[44,6] = true; // Horizontal & Vertical
                obj_arr_var[44,7] = 1.5; // Width
                obj_arr_var[44,8] = 32; // Length
                obj_arr_var[44,9] = 32; // Height
                obj_arr_var[44,10] = 0; // Z
                obj_arr_var[44,11] = false; // Loop

                obj_arr_var[45,1] = mad_trim_obj_path;
                obj_arr_var[45,2] = "mad_blood_trim_02_doorframe_obj";
                obj_arr_var[45,3] = 8;
                obj_arr_var[45,4] = 26; // Background (Index)
                obj_arr_var[45,5] = 6; // Model (Index)
                obj_arr_var[45,6] = true; // Horizontal & Vertical
                obj_arr_var[45,7] = 1.5; // Width
                obj_arr_var[45,8] = 32; // Length
                obj_arr_var[45,9] = 32; // Height
                obj_arr_var[45,10] = 0; // Z
                obj_arr_var[45,11] = false; // Loop
        // Floors & Ceilings
            obj_arr_var[46,1] = spawn_floor_obj_path;
            obj_arr_var[46,2] = "mad_floor_obj";
            obj_arr_var[46,3] = 1;
            obj_arr_var[46,4] = 3; // Background (Index)

            obj_arr_var[47,1] = spawn_floor_obj_path;
            obj_arr_var[47,2] = "mad_blood_floor_obj";
            obj_arr_var[47,3] = 1;
            obj_arr_var[47,4] = 4; // Background (Index)

            obj_arr_var[48,1] = spawn_ceil_obj_path;
            obj_arr_var[48,2] = "mad_ceil_obj";
            obj_arr_var[48,3] = 1;
            obj_arr_var[48,4] = 5; // Background (Index)

            obj_arr_var[49,1] = spawn_ceil_obj_path;
            obj_arr_var[49,2] = "mad_ceil_high_obj";
            obj_arr_var[49,3] = 4;
            obj_arr_var[49,4] = 5; // Background (Index)
            obj_arr_var[49,5] = 0; // Width (Default)
            obj_arr_var[49,6] = 0; // Height (Default)
            obj_arr_var[49,7] = 64; // Z

            obj_arr_var[50,1] = spawn_floor_obj_path;
            obj_arr_var[50,2] = "mad_persona_floor_obj";
            obj_arr_var[50,3] = 1;
            obj_arr_var[50,4] = 13; // Background (Index)

            obj_arr_var[51,1] = spawn_ceil_obj_path;
            obj_arr_var[51,2] = "mad_persona_ceil_obj";
            obj_arr_var[51,3] = 1;
            obj_arr_var[51,4] = 12; // Background (Index)

            obj_arr_var[52,1] = spawn_floor_obj_path;
            obj_arr_var[52,2] = "mad_daycare_floor_01_obj";
            obj_arr_var[52,3] = 1;
            obj_arr_var[52,4] = 16; // Background (Index)

            obj_arr_var[53,1] = spawn_floor_obj_path;
            obj_arr_var[53,2] = "mad_daycare_floor_02_obj";
            obj_arr_var[53,3] = 1;
            obj_arr_var[53,4] = 17; // Background (Index)

            obj_arr_var[54,1] = spawn_ceil_obj_path;
            obj_arr_var[54,2] = "mad_daycare_ceil_obj";
            obj_arr_var[54,3] = 1;
            obj_arr_var[54,4] = 18; // Background (Index)
        // Misc
            obj_arr_var[55,1] = mad_arrow_obj_path;
            obj_arr_var[55,2] = -1;
            obj_arr_var[55,3] = 2;
            obj_arr_var[55,4] = 20; // Background (Index)
            obj_arr_var[55,5] = 21;

            obj_arr_var[56,1] = mad_cat_obj_path;
            obj_arr_var[56,2] = -1;
            obj_arr_var[56,3] = 3;
            obj_arr_var[56,4] = 3; // Sprite (Index)
            obj_arr_var[56,5] = 4; // Sprite (Index)
            obj_arr_var[56,6] = 5; // Sound (Index)

            obj_arr_var[57,1] = mad_clock_obj_path;
            obj_arr_var[57,2] = -1;
            obj_arr_var[57,3] = 7;
            obj_arr_var[57,4] = 0; // Sprite (Index)
            obj_arr_var[57,5] = 7; // Background (Index)
            obj_arr_var[57,6] = 29; // Background (Index)
            obj_arr_var[57,7] = 30; // Background (Index)
            obj_arr_var[57,8] = 31; // Background (Index)
            obj_arr_var[57,9] = 3; // Sound (Index)
            obj_arr_var[57,10] = 4; // Sound (Index)

            obj_arr_var[58,1] = mad_clock_big_obj_path;
            obj_arr_var[58,2] = -1;
            obj_arr_var[58,3] = 2;
            obj_arr_var[58,4] = 57; // Parent (Index)
            obj_arr_var[58,5] = 15; // Scale

            obj_arr_var[59,1] = school_desk_teacher_obj_path;
            obj_arr_var[59,2] = "mad_desk_obj";
            obj_arr_var[59,3] = 3;
            obj_arr_var[59,4] = 27;
            obj_arr_var[59,5] = 28;
            obj_arr_var[59,6] = 0;

            obj_arr_var[60,1] = mad_door_obj_path;
            obj_arr_var[60,2] = -1;
            obj_arr_var[60,3] = 1;
            obj_arr_var[60,4] = 8; // Background (Index)
            obj_arr_var[60,5] = 7; // Model (Index)

            obj_arr_var[61,1] = mad_door_obj_path;
            obj_arr_var[61,2] = "mad_door_broke_obj";
            obj_arr_var[61,3] = 1;
            obj_arr_var[61,4] = 9; // Background (Index)
            obj_arr_var[61,5] = 7; // Model (Index)

            obj_arr_var[62,1] = mad_door_trig_obj_path;
            obj_arr_var[62,2] = -1;
            obj_arr_var[62,3] = 0;

            obj_arr_var[63,1] = mad_flesh_ceil_obj_path;
            obj_arr_var[63,2] = -1;
            obj_arr_var[63,3] = 1;
            obj_arr_var[63,4] = 0; // Surface (Index)

            obj_arr_var[64,1] = mad_flesh_door_obj_path;
            obj_arr_var[64,2] = -1;
            obj_arr_var[64,3] = 1;
            obj_arr_var[64,4] = 0; // Surface (Index)

            obj_arr_var[65,1] = mad_flesh_floor_obj_path;
            obj_arr_var[65,2] = -1;
            obj_arr_var[65,3] = 1;
            obj_arr_var[65,4] = 0; // Surface (Index)

            obj_arr_var[66,1] = mad_flesh_wall_obj_path;
            obj_arr_var[66,2] = -1;
            obj_arr_var[66,3] = 2;
            obj_arr_var[66,4] = 0; // Surface (Index)
            obj_arr_var[66,5] = true; // Directional

            obj_arr_var[67,1] = mad_flesh_obj_path;
            obj_arr_var[67,2] = -1;
            obj_arr_var[67,3] = 3;
            obj_arr_var[67,4] = 0; // Surface (Index)
            obj_arr_var[67,5] = 0; // Path (Index)
            obj_arr_var[67,6] = 23; // Background (Index)

            obj_arr_var[68,1] = mad_fog_obj_path;
            obj_arr_var[68,2] = -1;
            obj_arr_var[68,3] = 0;

            obj_arr_var[69,1] = mad_line_obj_path;
            obj_arr_var[69,2] = -1;
            obj_arr_var[69,3] = 1;
            obj_arr_var[69,4] = 6; // Background (index)

            obj_arr_var[70,1] = mad_pc_obj_path;
            obj_arr_var[70,2] = -1;
            obj_arr_var[70,3] = 1;
            obj_arr_var[70,4] = 1; // Sprite (index)

            obj_arr_var[71,1] = mad_slug_obj_path;
            obj_arr_var[71,2] = -1;
            obj_arr_var[71,3] = 1;
            obj_arr_var[71,4] = 2; // Sprite (index)

            obj_arr_var[72,1] = mad_space_obj_path;
            obj_arr_var[72,2] = -1;
            obj_arr_var[72,3] = 4;
            obj_arr_var[72,4] = 0; // Surface (Index)
            obj_arr_var[72,5] = 0; // Path (Index)
            obj_arr_var[72,6] = 23; // Background (Index)
            obj_arr_var[72,7] = 7; // Model (Index)

            obj_arr_var[73,1] = mad_spot_obj_path;
            obj_arr_var[73,2] = -1;
            obj_arr_var[73,3] = 1;
            obj_arr_var[73,4] = 19; // Background (Index)

            obj_arr_var[74,1] = mad_trig_obj_path;
            obj_arr_var[74,2] = -1;
            obj_arr_var[74,3] = 0;

            obj_arr_var[75,1] = spawn_mus_obj_path;
            obj_arr_var[75,2] = "mad_persona_mus_obj";
            obj_arr_var[75,3] = 1;
            obj_arr_var[75,4] = 0;

            obj_arr_var[76,1] = spawn_mus_obj_path;
            obj_arr_var[76,2] = "mad_daycare_mus_obj";
            obj_arr_var[76,3] = 1;
            obj_arr_var[76,4] = 1;

            obj_arr_var[77,1] = spawn_mus_obj_path;
            obj_arr_var[77,2] = "mad_space_mus_obj";
            obj_arr_var[77,3] = 1;
            obj_arr_var[77,4] = 2;
        // Forgor
            obj_arr_var[78,1] = spawn_wall_obj_path;
            obj_arr_var[78,2] = "mad_wall_doorway_obj";
            obj_arr_var[78,3] = 9;
            obj_arr_var[78,4] = 0; // Background (Index)
            obj_arr_var[78,5] = true; // Horizontal and vertical
            obj_arr_var[78,6] = 0; // Width (Default)
            obj_arr_var[78,7] = 0; // Height (Default)
            obj_arr_var[78,8] = 32; // Z
            obj_arr_var[78,9] = 0; // Texture Width (Default)
            obj_arr_var[78,10] = 0; // Texture Height (Default)
            obj_arr_var[78,11] = 0; // Mask (Default)
            obj_arr_var[78,12] = true; // No Grid
    // Rooms
        rm_len_var = 6;
        rm_arr_var[0,1] = mad_01_rm_path;
        rm_arr_var[0,2] = -1;
        rm_arr_var[0,3] = 3;
        rm_arr_var[0,4] = 9;
        rm_arr_var[0,5] = 2;
        rm_arr_var[0,6] = 5;
        rm_arr_var[1,1] = mad_02_rm_path;
        rm_arr_var[1,2] = -1;
        rm_arr_var[1,3] = 0;
        rm_arr_var[2,1] = mad_03_rm_path;
        rm_arr_var[2,2] = -1;
        rm_arr_var[2,3] = 0;
        rm_arr_var[3,1] = mad_04_rm_path;
        rm_arr_var[3,2] = -1;
        rm_arr_var[3,3] = 0;
        rm_arr_var[4,1] = mad_05_rm_path;
        rm_arr_var[4,2] = -1;
        rm_arr_var[4,3] = 0;
        rm_arr_var[5,1] = mad_06_rm_path;
        rm_arr_var[5,2] = -1;
        rm_arr_var[5,3] = 0;
    rm_var = 0;
    event_inherited();
    path_add_point(path_arr_var[0,0],0,0,100);
    path_add_point(path_arr_var[0,0],-32,-32,100);
    path_add_point(path_arr_var[0,0],-80,-32,100);
    path_add_point(path_arr_var[0,0],-112,0,70);
    path_add_point(path_arr_var[0,0],-192,32,130);
    path_add_point(path_arr_var[0,0],-256,0,100);
    cat_var = false;
');