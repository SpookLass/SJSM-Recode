// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,load_par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create Event
object_event_add
(argument0,ev_create,0,'
    menu_var = false;
    // Backgrounds
        bg_len_var = 7;
        bg_arr_var[0,1] = lab_wall_down_bg_path;
        bg_arr_var[0,2] = false;
        bg_arr_var[0,3] = false;
        bg_arr_var[1,1] = lab_floor_bg_path;
        bg_arr_var[1,2] = false;
        bg_arr_var[1,3] = false;
        bg_arr_var[2,1] = lab_ceil_bg_path;
        bg_arr_var[2,2] = false;
        bg_arr_var[2,3] = false;
        bg_arr_var[3,1] = lab_wall_up_bg_path;
        bg_arr_var[3,2] = false;
        bg_arr_var[3,3] = false;
        bg_arr_var[4,1] = lab_door_bg_path;
        bg_arr_var[4,2] = false;
        bg_arr_var[4,3] = false;
        bg_arr_var[5,1] = lab_light_bg_path;
        bg_arr_var[5,2] = false;
        bg_arr_var[5,3] = false;
        bg_arr_var[6,1] = bug_hole_bg_path;
        bg_arr_var[6,2] = false;
        bg_arr_var[6,3] = false;
    // Sprites
        spr_len_var = 3;
        spr_arr_var[0,1] = bug_spr_path;
        spr_arr_var[0,2] = 8;
        spr_arr_var[0,3] = false;
        spr_arr_var[0,4] = false;
        spr_arr_var[0,5] = 0;
        spr_arr_var[0,6] = 0;
        spr_arr_var[1,1] = bug_bod_spr_path;
        spr_arr_var[1,2] = 7;
        spr_arr_var[1,3] = false;
        spr_arr_var[1,4] = false;
        spr_arr_var[1,5] = 0;
        spr_arr_var[1,6] = 0;
        spr_arr_var[2,1] = bug_head_spr_path;
        spr_arr_var[2,2] = 8;
        spr_arr_var[2,3] = false;
        spr_arr_var[2,4] = false;
        spr_arr_var[2,5] = 0;
        spr_arr_var[2,6] = 0;
    // Sounds
        snd_len_var = 4;
        snd_arr_var[0,1] = wf_static_snd_path;
        snd_arr_var[0,2] = false;
        snd_arr_var[0,3] = snd_group_sfx_const;
        snd_arr_var[0,4] = 1;
        snd_arr_var[0,5] = 0;
        snd_arr_var[0,6] = 0;
        snd_arr_var[1,1] = bug_light_snd_path;
        snd_arr_var[1,2] = true;
        snd_arr_var[1,3] = snd_group_sfx_const;
        snd_arr_var[1,4] = 1;
        snd_arr_var[1,5] = 20;
        snd_arr_var[1,6] = 200;
        snd_arr_var[2,1] = bug_light_blink_snd_path;
        snd_arr_var[2,2] = true;
        snd_arr_var[2,3] = snd_group_sfx_const;
        snd_arr_var[2,4] = 1;
        snd_arr_var[2,5] = 20;
        snd_arr_var[2,6] = 200;
        snd_arr_var[3,1] = bug_loop_snd_path;
        snd_arr_var[3,2] = true;
        snd_arr_var[3,3] = snd_group_mon_const;
        snd_arr_var[3,4] = 1;
        snd_arr_var[3,5] = 0;
        snd_arr_var[3,6] = 200;
    // Models
        mdl_len_var = 2;
        mdl_arr_var[0,1] = lab_door_mdl_path;
        mdl_arr_var[1,1] = lab_doorframe_mdl_path;
    // Objects
        obj_len_var = 12;
        // Walls
            obj_arr_var[0,1] = spawn_wall_obj_path;
            obj_arr_var[0,2] = "lab_wall_down_obj";
            obj_arr_var[0,3] = 8;
            obj_arr_var[0,4] = 1; // Background (Index)
            obj_arr_var[0,5] = true; // Horizontal and vertical
            obj_arr_var[0,6] = 0; // Width (Default)
            obj_arr_var[0,7] = 0; // Height (Default)
            obj_arr_var[0,8] = 0; // Z (Default)
            obj_arr_var[0,9] = 0; // Texture Width (Default)
            obj_arr_var[0,10] = 0; // Texture Height (Default)
            obj_arr_var[0,11] = mask_metal_const; // Mask
            obj_arr_var[1,1] = spawn_wall_obj_path;
            obj_arr_var[1,2] = "lab_wall_up_obj";
            obj_arr_var[1,3] = 8;
            obj_arr_var[1,4] = 2; // Background (Index)
            obj_arr_var[1,5] = true; // Horizontal and vertical
            obj_arr_var[1,6] = 0; // Width (Default)
            obj_arr_var[1,7] = 0; // Height (Default)
            obj_arr_var[1,8] = 32; // Z
            obj_arr_var[1,9] = 0; // Texture Width (Default)
            obj_arr_var[1,10] = 0; // Texture Height (Default)
            obj_arr_var[1,12] = mask_metal_const; // Mask
        // Floors & Ceilings
            obj_arr_var[2,1] = spawn_floor_obj_path;
            obj_arr_var[2,2] = "lab_floor_obj";
            obj_arr_var[2,3] = 10;
            obj_arr_var[2,4] = 8; // Background (Index)
            obj_arr_var[2,5] = 0; // Width (Default)
            obj_arr_var[2,6] = 0; // Height (Default)
            obj_arr_var[2,7] = 0; // Z (Default)
            obj_arr_var[2,8] = 0; // Texture Width (Default)
            obj_arr_var[2,9] = 0; // Texture Height (Default)
            obj_arr_var[2,10] = mask_metal_const; // Mask
            obj_arr_var[2,11] = false; // No Grid
            obj_arr_var[2,12] = 0; // Depth (Default)
            obj_arr_var[2,13] = 0.6; // Alpha
            obj_arr_var[3,1] = spawn_ceil_obj_path;
            obj_arr_var[3,2] = "lab_ceil_high_obj";
            obj_arr_var[3,3] = 7;
            obj_arr_var[3,4] = 1; // Background (Index)
            obj_arr_var[3,5] = 0; // Width (Default)
            obj_arr_var[3,6] = 0; // Height (Default)
            obj_arr_var[3,7] = 64; // Z
            obj_arr_var[3,8] = 0; // Texture Width (Default)
            obj_arr_var[3,9] = 0; // Texture Height (Default)
            obj_arr_var[3,10] = mask_metal_const; // Mask
        // Props
            obj_arr_var[4,1] = lab_door_obj_path;
            obj_arr_var[4,2] = -1;
            obj_arr_var[4,3] = 1;
            obj_arr_var[4,4] = 3;
            obj_arr_var[5,1] = lab_hole_obj_path;
            obj_arr_var[5,2] = -1;
            obj_arr_var[5,3] = 1;
            obj_arr_var[5,4] = 6;
            obj_arr_var[6,1] = bug_dead_light_obj_path;
            obj_arr_var[6,2] = -1;
            obj_arr_var[6,3] = 1;
            obj_arr_var[6,4] = 9;
            obj_arr_var[7,1] = bug_dead_hole_obj_path;
            obj_arr_var[7,2] = "bug_dead_hole_big_obj";
            obj_arr_var[7,3] = 2;
            obj_arr_var[7,4] = 5;
            obj_arr_var[7,5] = 1.5;
            obj_arr_var[8,1] = bug_dead_hole_obj_path;
            obj_arr_var[8,2] = "bug_dead_hole_small_obj";
            obj_arr_var[8,3] = 2;
            obj_arr_var[8,4] = 5;
            obj_arr_var[8,5] = 0.6;
            obj_arr_var[9,1] = bug_dead_hole_wall_obj_path;
            obj_arr_var[9,2] = -1;
            obj_arr_var[9,3] = 1;
            obj_arr_var[9,4] = 6;
        // Dead
            obj_arr_var[10,1] = bug_dead_3d_obj_path;
            obj_arr_var[10,2] = -1;
            obj_arr_var[10,3] = 3;
            obj_arr_var[10,4] = 0;
            obj_arr_var[10,5] = 1;
            obj_arr_var[10,6] = 3;
            obj_arr_var[11,1] = bug_dead_obj_path;
            obj_arr_var[11,2] = -1;
            obj_arr_var[11,3] = 0;
    // Rooms
        rm_len_var = 3;
        rm_arr_var[0,1] = bug_dead_rm_path;
        rm_arr_var[0,2] = -1;
        rm_arr_var[0,3] = 0;
    rm_var = bug_dead_rm;
    global.can_pause_var = false;
    event_inherited();
    key_var = false;
    broke_var = (global.diff_var != 0);
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    global.can_pause_var = true;
    event_inherited();
');