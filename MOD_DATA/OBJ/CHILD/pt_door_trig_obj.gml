// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,door_trig_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    prog_var = 3;
    prog_press_var = true;
    note_var = false;
    prog_txt_var = false;
    switch global.howard_type_var
    {
        case 0:
        {
            prog_press_var = false;
            prog_txt_var = true;
            break;
        }
        case 2:
        {
            prog_press_var = false;
            note_var = true;
            break;
        }
    }
    if prog_txt_var
    {
        ini_open(global.lang_var);
        prog_str_var = ini_read_string("UI","remain","UI_remain");
        ini_close();
        txt_lock_var = string(prog_var)+" "+prog_str_var;
    }
    if global.player_len_var <= 1 { lock_var = true; }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if lock_var
    {
        local.note = true;
        if note_var { if !pt_note_obj.read_var { local.note = false; }}
        if prog_var <= 0 && local.note { lock_var = false; }
    }
');
// Interact Event
object_event_add
(argument0,ev_other,ev_user3,'
    if !instance_exists(txt_obj) && prog_press_var
    { event_user(5); }
    event_inherited();
');
// Progress Event
object_event_add
(argument0,ev_other,ev_user5,'
    prog_var -= 1;
    if prog_txt_var { txt_lock_var = string(prog_var)+" "+prog_str_var; }
');