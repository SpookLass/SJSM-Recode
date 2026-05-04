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
    if instance_exists(load_par_obj) { bg_var = load_par_obj.bg_arr_var[11,0]; }
    ini_open(global.lang_var);
    if global.diff_var == 0 { str_var = ini_read_string("NOTE","lab_02_easy","NOTE_lab_02_easy"); }
    else { str_var = ini_read_string("NOTE","lab_02","NOTE_lab_02"); }
    ini_close();
    str_margin_x_var = 62;
    event_inherited();
');
// Put down note
object_event_add
(argument0,ev_other,ev_user3,'
    event_inherited();
    if instance_exists(lab_trig_obj)
    { with lab_trig_obj { event_user(0); instance_destroy(); }}
');