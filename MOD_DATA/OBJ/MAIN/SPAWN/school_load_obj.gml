// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,load_par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Locker Collision
    p3dc_set_trimask_scr(mask_metal_const);
    globalvar school_locker_coll;
    school_locker_coll[1] = 28;
    school_locker_coll[2] = 4;
    school_locker_coll[3] = 28;
    school_locker_coll[0] = prop_to_coll_scr(7,'',school_locker_coll[2],school_locker_coll[3],school_locker_coll[1]);
    p3dc_set_trimask_scr(mask_basic_const);
// Desk Collision
    globalvar school_desk_coll;
    school_desk_coll[1] = 9.5;
    school_desk_coll[2] = 9;
    school_desk_coll[3] = 12;
    school_desk_coll[0] = p3dc_begin_mdl_scr();
    p3dc_set_trimask_scr(mask_metal_const);
    p3dc_add_block_scr(-3.8,-5.4,9,-4.2,-5.8,0);
    p3dc_add_block_scr(-3.8,5.8,9,-4.2,5.4,0);
    p3dc_add_block_scr(4.2,-5.4,9,3.8,-5.8,0);
    p3dc_add_block_scr(4.2,5.8,9,3.8,5.4,0);
    p3dc_set_trimask_scr(mask_basic_const);
    p3dc_add_block_scr(3.5,5,9,-3.5,-5,7.5);
    p3dc_add_block_scr(4.5,6,9.5,-4.5,-6,9);
    p3dc_end_mdl_scr();
// Teacher Desk Collision
    globalvar school_desk_teacher_coll;
    school_desk_teacher_coll[1] = 9.5;
    school_desk_teacher_coll[2] = 10;
    school_desk_teacher_coll[3] = 16;
    local.width = school_desk_teacher_coll[2]/2;
    local.length = school_desk_teacher_coll[3]/2;
    local.legwidth = 2;
    school_desk_teacher_coll[0] = p3dc_begin_mdl_scr();
    p3dc_add_block_scr(local.width,-local.length+local.legwidth,school_desk_teacher_coll[1]-local.legwidth,-local.width,-local.length,0);
    p3dc_add_block_scr(local.width,local.length,school_desk_teacher_coll[1]-local.legwidth,-local.width,local.length-local.legwidth,0);
    p3dc_add_block_scr(local.width,local.length-local.legwidth,school_desk_teacher_coll[1]-local.legwidth,local.width-local.legwidth,-local.length+local.legwidth,0);
    p3dc_add_block_scr(local.width,local.length,school_desk_teacher_coll[1],-local.width,-local.length,school_desk_teacher_coll[1]-local.legwidth);
    p3dc_end_mdl_scr();
// Create Event
object_event_add
(argument0,ev_create,0,'
    menu_var = false;
    // Backgrounds
        bg_len_var = 14;
        bg_arr_var[0,1] = school_floor_bg_path;
        bg_arr_var[0,2] = false;
        bg_arr_var[0,3] = false;
        bg_arr_var[1,1] = school_wall_bg_path;
        bg_arr_var[1,2] = false;
        bg_arr_var[1,3] = false;
        bg_arr_var[2,1] = school_wall_up_bg_path;
        bg_arr_var[2,2] = false;
        bg_arr_var[2,3] = false;
        bg_arr_var[3,1] = school_ceil_bg_path;
        bg_arr_var[3,2] = false;
        bg_arr_var[3,3] = false;
        bg_arr_var[4,1] = school_door_bg_path;
        bg_arr_var[4,2] = false;
        bg_arr_var[4,3] = false;
        bg_arr_var[5,1] = school_window_bg_path;
        bg_arr_var[5,2] = false;
        bg_arr_var[5,3] = false;
        bg_arr_var[6,1] = school_blind_bg_path;
        bg_arr_var[6,2] = false;
        bg_arr_var[6,3] = false;
        bg_arr_var[7,1] = school_locker_01_bg_path;
        bg_arr_var[7,2] = false;
        bg_arr_var[7,3] = false;
        bg_arr_var[8,1] = school_desk_top_bg_path;
        bg_arr_var[8,2] = false;
        bg_arr_var[8,3] = false;
        bg_arr_var[9,1] = school_desk_metal_bg_path;
        bg_arr_var[9,2] = false;
        bg_arr_var[9,3] = false;
        bg_arr_var[10,1] = school_desk_wood_bg_path;
        bg_arr_var[10,2] = false;
        bg_arr_var[10,3] = false;
        bg_arr_var[11,1] = school_chalk_bg_path;
        bg_arr_var[11,2] = false;
        bg_arr_var[11,3] = false;
        bg_arr_var[12,1] = school_locker_02_bg_path;
        bg_arr_var[12,2] = false;
        bg_arr_var[12,3] = false;
        bg_arr_var[13,1] = lab_note_bg_path;
        bg_arr_var[13,2] = false;
        bg_arr_var[13,3] = false;
    // Sprites
        spr_len_var = 1;
        spr_arr_var[0,1] = school_decor_spr_path;
        spr_arr_var[0,2] = 8;
        spr_arr_var[0,3] = false;
        spr_arr_var[0,4] = false;
        spr_arr_var[0,5] = 0;
        spr_arr_var[0,6] = 0;
    // Models
        mdl_len_var = 1;
        mdl_arr_var[0,1] = school_door_mdl_path;
    // Sounds
        snd_len_var = 4;
        snd_arr_var[0,1] = ghost_01_snd_path;
        snd_arr_var[0,2] = true;
        snd_arr_var[0,3] = snd_group_mon_const;
        snd_arr_var[0,4] = 1;
        snd_arr_var[0,5] = 0;
        snd_arr_var[0,6] = 0;
        snd_arr_var[1,1] = ghost_02_snd_path;
        snd_arr_var[1,2] = true;
        snd_arr_var[1,3] = snd_group_mon_const;
        snd_arr_var[1,4] = 1;
        snd_arr_var[1,5] = 0;
        snd_arr_var[1,6] = 0;
        snd_arr_var[2,1] = ghost_03_snd_path;
        snd_arr_var[2,2] = true;
        snd_arr_var[2,3] = snd_group_mon_const;
        snd_arr_var[2,4] = 1;
        snd_arr_var[2,5] = 0;
        snd_arr_var[2,6] = 0;
        snd_arr_var[3,1] = ghost_04_snd_path;
        snd_arr_var[3,2] = true;
        snd_arr_var[3,3] = snd_group_mon_const;
        snd_arr_var[3,4] = 1;
        snd_arr_var[3,5] = 0;
        snd_arr_var[3,6] = 0;
    // Objects
        obj_len_var = 23;
        // Walls
            obj_arr_var[0,1] = spawn_wall_obj_path;
            obj_arr_var[0,2] = "school_wall_obj";
            obj_arr_var[0,3] = 2;
            obj_arr_var[0,4] = 1; // Background (Index)
            obj_arr_var[0,5] = true; // Horizontal and vertical
            obj_arr_var[1,1] = spawn_wall_obj_path;
            obj_arr_var[1,2] = "school_wall_up_obj";
            obj_arr_var[1,3] = 5;
            obj_arr_var[1,4] = 2; // Background (Index)
            obj_arr_var[1,5] = true; // Horizontal and vertical
            obj_arr_var[1,6] = 0; // Width (Default)
            obj_arr_var[1,7] = 16; // Height
            obj_arr_var[1,8] = 32; // Z
            obj_arr_var[2,1] = spawn_wall_obj_path;
            obj_arr_var[2,2] = "school_window_obj";
            obj_arr_var[2,3] = 10;
            obj_arr_var[2,4] = 5; // Background (Index)
            obj_arr_var[2,5] = true; // Horizontal and vertical
            obj_arr_var[2,6] = 0; // Width (Default)
            obj_arr_var[2,7] = 0; // Height (Default)
            obj_arr_var[2,8] = 0; // Z (Default)
            obj_arr_var[2,9] = 0; // Texture Width (Default)
            obj_arr_var[2,10] = 0; // Texture Height (Default)
            obj_arr_var[2,11] = 0; // Mask (Default)
            obj_arr_var[2,12] = false; // No Grid
            obj_arr_var[2,13] = -4; // Depth
            obj_arr_var[3,1] = spawn_wall_obj_path;
            obj_arr_var[3,2] = "school_blind_obj";
            obj_arr_var[3,3] = 2;
            obj_arr_var[3,4] = 6; // Background (Index)
            obj_arr_var[3,5] = true; // Horizontal and vertical
        // Floors & Ceilings
            obj_arr_var[4,1] = spawn_floor_obj_path;
            obj_arr_var[4,2] = "school_floor_obj";
            obj_arr_var[4,3] = 1;
            obj_arr_var[4,4] = 0; // Background (Index)
            obj_arr_var[5,1] = spawn_ceil_obj_path;
            obj_arr_var[5,2] = "school_ceil_obj";
            obj_arr_var[5,3] = 4;
            obj_arr_var[5,4] = 3; // Background (Index)
            obj_arr_var[5,5] = 0; // Width (Default)
            obj_arr_var[5,6] = 0; // Height (Default)
            obj_arr_var[5,7] = 48; // Z
        // Props
            obj_arr_var[6,1] = school_chalk_obj_path;
            obj_arr_var[6,2] = -1;
            obj_arr_var[6,3] = 1;
            obj_arr_var[6,4] = 11; // Background (Index)
            obj_arr_var[7,1] = school_desk_obj_path;
            obj_arr_var[7,2] = -1;
            obj_arr_var[7,3] = 3;
            obj_arr_var[7,4] = 8; // Background (Index)
            obj_arr_var[7,5] = 9;
            obj_arr_var[7,6] = 10;
            obj_arr_var[8,1] = school_desk_teacher_obj_path;
            obj_arr_var[8,2] = -1;
            obj_arr_var[8,3] = 3;
            obj_arr_var[8,4] = 8; // Background (Index)
            obj_arr_var[8,5] = 10;
            obj_arr_var[8,6] = 180; // Direction
            obj_arr_var[9,1] = school_door_obj_path;
            obj_arr_var[9,2] = -1;
            obj_arr_var[9,3] = 2;
            obj_arr_var[9,4] = 4; // Background (Index)
            obj_arr_var[9,5] = 0; // Model (Index)
            obj_arr_var[10,1] = school_locker_obj_path;
            obj_arr_var[10,2] = -1;
            obj_arr_var[10,3] = 3;
            obj_arr_var[10,4] = 12; // Background (Index)
            obj_arr_var[10,5] = 7;
            obj_arr_var[10,6] = true; // Directions
            obj_arr_var[11,1] = school_note_01_obj_path;
            obj_arr_var[11,2] = -1;
            obj_arr_var[11,3] = 1;
            obj_arr_var[11,4] = 13; // Background (Index)
            obj_arr_var[12,1] = school_note_02_obj_path;
            obj_arr_var[12,2] = -1;
            obj_arr_var[12,3] = 1;
            obj_arr_var[12,4] = 13; // Background (Index)
            obj_arr_var[13,1] = school_decor_obj_path;
            obj_arr_var[13,2] = "school_clock_obj";
            obj_arr_var[13,3] = 7;
            obj_arr_var[13,4] = 0; // Sprite
            obj_arr_var[13,5] = 0; // Sprite Index
            obj_arr_var[13,6] = 8; // Width
            obj_arr_var[13,7] = 8; // Height
            obj_arr_var[13,8] = 0.2; // Distance
            obj_arr_var[13,9] = 30; // Z
            obj_arr_var[13,10] = 180; // Direction
            obj_arr_var[14,1] = school_decor_obj_path;
            obj_arr_var[14,2] = "school_stickynote_obj";
            obj_arr_var[14,3] = 7;
            obj_arr_var[14,4] = 0; // Sprite
            obj_arr_var[14,5] = 1; // Sprite Index
            obj_arr_var[14,6] = 8; // Width
            obj_arr_var[14,7] = 8; // Height
            obj_arr_var[14,8] = 0.3; // Distance
            obj_arr_var[14,9] = 12; // Z
            obj_arr_var[14,10] = 180; // Direction
            obj_arr_var[15,1] = school_decor_obj_path;
            obj_arr_var[15,2] = "school_poster_01_obj";
            obj_arr_var[15,3] = 7;
            obj_arr_var[15,4] = 0; // Sprite
            obj_arr_var[15,5] = 2; // Sprite Index
            obj_arr_var[15,6] = 12; // Width
            obj_arr_var[15,7] = 12; // Height
            obj_arr_var[15,8] = 0.2; // Distance
            obj_arr_var[15,9] = 10; // Z
            obj_arr_var[15,10] = 180; // Direction
            obj_arr_var[16,1] = school_decor_obj_path;
            obj_arr_var[16,2] = "school_poster_02_obj";
            obj_arr_var[16,3] = 7;
            obj_arr_var[16,4] = 0; // Sprite
            obj_arr_var[16,5] = 3; // Sprite Index
            obj_arr_var[16,6] = 12; // Width
            obj_arr_var[16,7] = 12; // Height
            obj_arr_var[16,8] = 0.2; // Distance
            obj_arr_var[16,9] = 6; // Z
            obj_arr_var[16,10] = 0; // Direction
            obj_arr_var[17,1] = school_decor_obj_path;
            obj_arr_var[17,2] = "school_poster_03_obj";
            obj_arr_var[17,3] = 7;
            obj_arr_var[17,4] = 0; // Sprite
            obj_arr_var[17,5] = 4; // Sprite Index
            obj_arr_var[17,6] = 12; // Width
            obj_arr_var[17,7] = 12; // Height
            obj_arr_var[17,8] = 0.2; // Distance
            obj_arr_var[17,9] = 10; // Z
            obj_arr_var[17,10] = 180; // Direction
            obj_arr_var[18,1] = school_decor_obj_path;
            obj_arr_var[18,2] = "school_poster_04_obj";
            obj_arr_var[18,3] = 7;
            obj_arr_var[18,4] = 0; // Sprite
            obj_arr_var[18,5] = 5; // Sprite Index
            obj_arr_var[18,6] = 12; // Width
            obj_arr_var[18,7] = 12; // Height
            obj_arr_var[18,8] = 0.2; // Distance
            obj_arr_var[18,9] = 6; // Z
            obj_arr_var[18,10] = 180; // Direction
            obj_arr_var[19,1] = school_decor_obj_path;
            obj_arr_var[19,2] = "school_poster_05_obj";
            obj_arr_var[19,3] = 7;
            obj_arr_var[19,4] = 0; // Sprite
            obj_arr_var[19,5] = 6; // Sprite Index
            obj_arr_var[19,6] = 12; // Width
            obj_arr_var[19,7] = 12; // Height
            obj_arr_var[19,8] = 0.2; // Distance
            obj_arr_var[19,9] = 6; // Z
            obj_arr_var[19,10] = 90; // Direction
            obj_arr_var[20,1] = school_decor_obj_path;
            obj_arr_var[20,2] = "school_poster_06_obj";
            obj_arr_var[20,3] = 7;
            obj_arr_var[20,4] = 0; // Sprite
            obj_arr_var[20,5] = 7; // Sprite Index
            obj_arr_var[20,6] = 12; // Width
            obj_arr_var[20,7] = 12; // Height
            obj_arr_var[20,8] = 0.2; // Distance
            obj_arr_var[20,9] = 6; // Z
            obj_arr_var[20,10] = 90; // Direction
        // Effects
            obj_arr_var[21,1] = school_color_obj_path;
            obj_arr_var[21,2] = -1;
            obj_arr_var[21,3] = 0;
            obj_arr_var[22,1] = mon_spawn_trig_obj_path;
            obj_arr_var[22,2] = "school_trig_obj";
            obj_arr_var[22,3] = 1;
            obj_arr_var[22,4] = ringu_obj;
    // Rooms
        rm_len_var = 6;
        rm_arr_var[0,1] = school_01_rm_path;
        rm_arr_var[0,2] = -1;
        rm_arr_var[0,3] = 0;
        rm_arr_var[1,1] = school_02_rm_path;
        rm_arr_var[1,2] = -1;
        rm_arr_var[1,3] = 0;
        rm_arr_var[2,1] = school_class_01_rm_path;
        rm_arr_var[2,2] = -1;
        rm_arr_var[2,3] = 0;
        rm_arr_var[3,1] = school_class_02_rm_path;
        rm_arr_var[3,2] = -1;
        rm_arr_var[3,3] = 0;
        rm_arr_var[4,1] = school_class_03_rm_path;
        rm_arr_var[4,2] = -1;
        rm_arr_var[4,3] = 0;
        rm_arr_var[5,1] = school_class_04_rm_path;
        rm_arr_var[5,2] = -1;
        rm_arr_var[5,3] = 0;
    rm_var = 0;
    instance_create(0,0,flashlight_obj);
    event_inherited();
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    with flashlight_obj { instance_destroy(); }
');