// Builtin Variables
object_set_depth(argument0,-2);
object_set_mask(argument0,noone);
object_set_parent(argument0,note_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    if instance_exists(load_par_obj) { bg_var = load_par_obj.bg_arr_var[13,0]; }
    ini_open("lang_"+global.lang_var+".ini");
    if global.diff_var == 0 { str_var = ini_read_string("NOTE","school_02_easy","NOTE_school_02_easy"); }
    else { str_var = ini_read_string("NOTE","school_02","NOTE_school_02"); }
    ini_close();
    str_margin_x_var = 62;
    event_inherited();
    z += 9.5;
');