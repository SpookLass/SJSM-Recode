// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    // Translation
    ini_open(global.lang_var);
    str_var = ini_read_string("DEAD","crash","DEAD_crash");
    str_var = string_replace(str_var,"@1",string(obj_name_arr[global.dead_mon_var]));
    str_var = string_replace(str_var,"@2",string(irandom(999)));
    str_var = string_replace(str_var,"@3",string(irandom(99)));
    ini_close();
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if global.input_press_arr[interact_input_const,global.menu_player_var] == 1
    || global.input_press_arr[back_input_const,global.menu_player_var] == 1
    || global.input_press_arr[pause_input_const,global.menu_player_var] == 1
    {
        fmod_update_take_over_when_lock_scr();
        highscore_show_ext(global.rm_count_var,menu_score_bg,true,c_yellow,c_purple,"Lunchtime Doubly So",16);
        global.last_time_var = current_time;
        fmod_update_take_over_done_scr();
        rm_goto_menu_scr(menu_rm);
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    draw_str_scr(str_var,54,54,0.5,0.5,0.125,fa_left,fa_top,0);
    d3d_set_hidden(true);
');