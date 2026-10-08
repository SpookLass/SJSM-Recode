// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,load_par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Fake wall
globalvar fd_dead_wall_coll;
global.fd_dead_wall_coll[1] = 40;
global.fd_dead_wall_coll[2] = 0;
global.fd_dead_wall_coll[3] = 32;
local.radius = global.fd_dead_wall_coll[3]/2;
global.fd_dead_wall_coll[0] = p3dc_begin_mdl_scr();
p3dc_add_wall_scr(0,-local.radius,global.fd_dead_wall_coll[1],0,local.radius,0)
p3dc_end_mdl_scr();
// Create Event
object_event_add
(argument0,ev_create,0,'
    menu_var = true;
    // Backgrounds
        bg_len_var = 3;
        bg_arr_var[0,1] = fd_wall_bg_path;
        bg_arr_var[0,2] = false;
        bg_arr_var[0,3] = false;
        bg_arr_var[1,1] = fd_floor_bg_path;
        bg_arr_var[1,2] = false;
        bg_arr_var[1,3] = false;
        bg_arr_var[2,1] = fd_ceil_bg_path;
        bg_arr_var[2,2] = false;
        bg_arr_var[2,3] = false;
    // Sprites
        spr_len_var = 1;
        spr_arr_var[0,1] = fd_spr_path;
        spr_arr_var[0,2] = 12;
        spr_arr_var[0,3] = false;
        spr_arr_var[0,4] = false;
        spr_arr_var[0,5] = 0;
        spr_arr_var[0,6] = 0;
    // Sounds
        snd_len_var = 1;
        snd_arr_var[0,1] = fd_dead_snd_path;
        snd_arr_var[0,2] = false;
        snd_arr_var[0,3] = snd_group_mus_const;
        snd_arr_var[0,4] = 1;
        snd_arr_var[0,5] = 0;
        snd_arr_var[0,6] = 0;
    // Objects
        obj_len_var = 7;
        obj_arr_var[0,1] = spawn_wall_obj_path;
        obj_arr_var[0,2] = "fd_dead_wall_obj";
        obj_arr_var[0,3] = 4;
        obj_arr_var[0,4] = 0;
        obj_arr_var[0,5] = true;
        obj_arr_var[0,6] = 0;
        obj_arr_var[0,7] = 40;
        obj_arr_var[1,1] = spawn_floor_obj_path;
        obj_arr_var[1,2] = "fd_dead_floor_obj";
        obj_arr_var[1,3] = 1;
        obj_arr_var[1,4] = 1;
        obj_arr_var[2,1] = spawn_ceil_obj_path;
        obj_arr_var[2,2] = "fd_dead_ceil_obj";
        obj_arr_var[2,3] = 4;
        obj_arr_var[2,4] = 2;
        obj_arr_var[2,5] = 0;
        obj_arr_var[2,6] = 0;
        obj_arr_var[2,7] = 40;
        obj_arr_var[3,1] = fd_dead_3d_obj_path;
        obj_arr_var[3,2] = -1;
        obj_arr_var[3,3] = 1;
        obj_arr_var[3,4] = 0;
        obj_arr_var[4,1] = fd_dead_wall_fake_obj_path;
        obj_arr_var[4,2] = -1;
        obj_arr_var[4,3] = 1;
        obj_arr_var[4,3] = 0;
        obj_arr_var[5,1] = fd_dead_overlay_obj_path;
        obj_arr_var[5,2] = -1;
        obj_arr_var[5,3] = 0;
        obj_arr_var[6,1] = fd_dead_tp_trig_obj_path;
        obj_arr_var[6,2] = -1;
        obj_arr_var[6,3] = 0;
    // Rooms
        rm_len_var = 1;
        rm_arr_var[0,1] = fd_dead_3d_rm_path;
        rm_arr_var[0,2] = -1;
        rm_arr_var[0,3] = 0;
    rm_var = 0;
    global.can_pause_var = false;
    event_inherited();
    fmod_snd_loop_scr(snd_arr_var[0,0]);
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    global.can_pause_var = true;
    event_inherited();
');