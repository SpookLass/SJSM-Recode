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
        bg_len_var = 14;
        bg_arr_var[0,1] = lab_ceil_bg_path;
        bg_arr_var[0,2] = false;
        bg_arr_var[0,3] = false;
        bg_arr_var[1,1] = lab_wall_down_bg_path;
        bg_arr_var[1,2] = false;
        bg_arr_var[1,3] = false;
        bg_arr_var[2,1] = lab_wall_up_bg_path;
        bg_arr_var[2,2] = false;
        bg_arr_var[2,3] = false;
        bg_arr_var[3,1] = lab_door_bg_path;
        bg_arr_var[3,2] = false;
        bg_arr_var[3,3] = false;
        bg_arr_var[4,1] = lab_wall_bg_path;
        bg_arr_var[4,2] = false;
        bg_arr_var[4,3] = false;
        bg_arr_var[5,1] = lab_tank_bg_path;
        bg_arr_var[5,2] = false;
        bg_arr_var[5,3] = false;
        bg_arr_var[6,1] = lab_tank_back_bg_path;
        bg_arr_var[6,2] = false;
        bg_arr_var[6,3] = false;
        bg_arr_var[7,1] = lab_tank_broke_bg_path;
        bg_arr_var[7,2] = false;
        bg_arr_var[7,3] = false;
        bg_arr_var[8,1] = lab_floor_bg_path;
        bg_arr_var[8,2] = false;
        bg_arr_var[8,3] = false;
        bg_arr_var[9,1] = lab_light_bg_path;
        bg_arr_var[9,2] = false;
        bg_arr_var[9,3] = false;
        bg_arr_var[10,1] = lab_key_bg_path;
        bg_arr_var[10,2] = false;
        bg_arr_var[10,3] = false;
        bg_arr_var[11,1] = lab_note_bg_path;
        bg_arr_var[11,2] = false;
        bg_arr_var[11,3] = false;
        bg_arr_var[12,1] = bug_hole_bg_path;
        bg_arr_var[12,2] = false;
        bg_arr_var[12,3] = false;
        bg_arr_var[13,1] = lab_subject_05_bg_path;
        bg_arr_var[13,2] = false;
        bg_arr_var[13,3] = false;
    // Sprites
        spr_len_var = 1;
        spr_arr_var[0,1] = lab_subject_spr_path;
        spr_arr_var[0,2] = 4;
        spr_arr_var[0,3] = false;
        spr_arr_var[0,4] = false;
        spr_arr_var[0,5] = 0;
        spr_arr_var[0,6] = 0;
    // Sounds
        snd_len_var = 3;
        snd_arr_var[0,1] = brain_rm_mus_snd_path;
        snd_arr_var[0,2] = false;
        snd_arr_var[0,3] = snd_group_mus_const;
        snd_arr_var[0,4] = 1;
        snd_arr_var[0,5] = 0;
        snd_arr_var[0,6] = 0;
        snd_arr_var[1,1] = bug_light_snd_path;
        snd_arr_var[1,2] = true;
        snd_arr_var[1,3] = snd_group_sfx_const;
        snd_arr_var[1,4] = 1;
        snd_arr_var[1,5] = 10;
        snd_arr_var[1,6] = 100;
        snd_arr_var[2,1] = bug_light_blink_snd_path;
        snd_arr_var[2,2] = true;
        snd_arr_var[2,3] = snd_group_sfx_const;
        snd_arr_var[2,4] = 1;
        snd_arr_var[2,5] = 10;
        snd_arr_var[2,6] = 100;
    // Models
        mdl_len_var = 4;
        mdl_arr_var[0,1] = lab_door_mdl_path;
        mdl_arr_var[1,1] = lab_doorframe_mdl_path;
        mdl_arr_var[2,1] = lab_door_down_mdl_path;
        mdl_arr_var[3,1] = lab_doorframe_down_mdl_path;
    // Objects
        obj_len_var = 21;
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
            obj_arr_var[2,1] = spawn_wall_obj_path;
            obj_arr_var[2,2] = "lab_wall_obj";
            obj_arr_var[2,3] = 8;
            obj_arr_var[2,4] = 4; // Background (Index)
            obj_arr_var[2,5] = true; // Horizontal and vertical
            obj_arr_var[2,6] = 0; // Width (Default)
            obj_arr_var[2,7] = 0; // Height (Default)
            obj_arr_var[2,8] = 0; // Z (Default)
            obj_arr_var[2,9] = 0; // Texture Width (Default)
            obj_arr_var[2,10] = 0; // Texture Height (Default)
            obj_arr_var[2,11] = mask_metal_const; // Mask
        // Floors & Ceilings
            obj_arr_var[3,1] = spawn_floor_obj_path;
            obj_arr_var[3,2] = "lab_floor_obj";
            obj_arr_var[3,3] = 7;
            obj_arr_var[3,4] = 8; // Background (Index)
            obj_arr_var[3,5] = 0; // Width (Default)
            obj_arr_var[3,6] = 0; // Height (Default)
            obj_arr_var[3,7] = 0; // Z (Default)
            obj_arr_var[3,8] = 0; // Texture Width (Default)
            obj_arr_var[3,9] = 0; // Texture Height (Default)
            obj_arr_var[3,10] = mask_metal_const; // Mask
            obj_arr_var[4,1] = spawn_ceil_obj_path;
            obj_arr_var[4,2] = "lab_ceil_obj";
            obj_arr_var[4,3] = 1;
            obj_arr_var[4,4] = 0;
            obj_arr_var[5,1] = spawn_ceil_obj_path;
            obj_arr_var[5,2] = "lab_ceil_high_obj";
            obj_arr_var[5,3] = 7;
            obj_arr_var[5,4] = 1; // Background (Index)
            obj_arr_var[5,5] = 0; // Width (Default)
            obj_arr_var[5,6] = 0; // Height (Default)
            obj_arr_var[5,7] = 64; // Z
            obj_arr_var[5,8] = 0; // Texture Width (Default)
            obj_arr_var[5,9] = 0; // Texture Height (Default)
            obj_arr_var[5,10] = mask_metal_const; // Mask
        // Props
            obj_arr_var[6,1] = lab_door_obj_path;
            obj_arr_var[6,2] = -1;
            obj_arr_var[6,3] = 1;
            obj_arr_var[6,4] = 3;
            obj_arr_var[7,1] = lab_light_obj_path;
            obj_arr_var[7,2] = -1;
            obj_arr_var[7,3] = 1;
            obj_arr_var[7,4] = 9;
            obj_arr_var[8,1] = brain_note_01_obj_path;
            obj_arr_var[8,2] = -1;
            obj_arr_var[8,3] = 1;
            obj_arr_var[8,4] = 11;
            obj_arr_var[9,1] = brain_note_02_obj_path;
            obj_arr_var[9,2] = -1;
            obj_arr_var[9,3] = 1;
            obj_arr_var[9,4] = 11;
            obj_arr_var[10,1] = brain_note_03_obj_path;
            obj_arr_var[10,2] = -1;
            obj_arr_var[10,3] = 1;
            obj_arr_var[10,4] = 11;
            obj_arr_var[11,1] = bug_dead_light_obj_path;
            obj_arr_var[11,2] = -1;
            obj_arr_var[11,3] = 1;
            obj_arr_var[11,4] = 9;
            obj_arr_var[12,1] = lab_subject_obj_path;
            obj_arr_var[12,2] = -1;
            obj_arr_var[12,3] = 1;
            obj_arr_var[12,4] = 0;
            obj_arr_var[13,1] = lab_subject_05_obj_path;
            obj_arr_var[13,2] = -1;
            obj_arr_var[13,3] = 1;
            obj_arr_var[13,4] = 13;
            obj_arr_var[14,1] = lab_tank_back_obj_path;
            obj_arr_var[14,2] = -1;
            obj_arr_var[14,3] = 1;
            obj_arr_var[14,4] = 6;
            obj_arr_var[15,1] = lab_tank_obj_path;
            obj_arr_var[15,2] = -1;
            obj_arr_var[15,3] = 2;
            obj_arr_var[15,4] = 5;
            obj_arr_var[15,5] = 0;
            obj_arr_var[16,1] = lab_tank_obj_path;
            obj_arr_var[16,2] = "lab_tank_broke_obj";
            obj_arr_var[16,3] = 2;
            obj_arr_var[16,4] = 5;
            obj_arr_var[16,5] = 2;
        // More Brain Stuff
            obj_arr_var[17,1] = brain_door_down_obj;
            obj_arr_var[17,2] = -1;
            obj_arr_var[17,3] = 3;
            obj_arr_var[17,4] = 6;
            obj_arr_var[17,5] = 2;
            obj_arr_var[17,6] = 3;
            obj_arr_var[18,1] = brain_doorframe_obj;
            obj_arr_var[18,2] = -1;
            obj_arr_var[18,3] = 2;
            obj_arr_var[18,4] = 3;
            obj_arr_var[18,5] = 3;
            obj_arr_var[19,1] = brain_door_trig_obj;
            obj_arr_var[19,2] = -1;
            obj_arr_var[19,3] = 0;
            obj_arr_var[20,1] = brain_trig_obj;
            obj_arr_var[20,2] = -1;
            obj_arr_var[20,3] = 0;
    // Rooms
        rm_len_var = 3;
        rm_arr_var[0,1] = brain_01_rm_path;
        rm_arr_var[0,2] = -1;
        rm_arr_var[0,3] = 0;
        rm_arr_var[1,1] = brain_02_rm_path;
        rm_arr_var[1,2] = -1;
        rm_arr_var[1,3] = 0;
        rm_arr_var[2,1] = brain_03_rm_path;
        rm_arr_var[2,2] = -1;
        rm_arr_var[2,3] = 0;
    rm_var = 0;
    event_inherited();
    door_var = false;
    broke_var = false;
');