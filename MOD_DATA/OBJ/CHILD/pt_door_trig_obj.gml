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
    // Translations
    ini_open("lang_"+global.lang_var+".ini");
    prog_str_var = ini_read_string("UI","remain","UI_remain");
    ini_close();
    // Variables
    prog_var = 3;
    prog_press_var = true;
    note_var = false;
    prog_txt_var = false;
    // Type
    if global.howard_type_var == -1 { local.type = irandom(2); }
    else { local.type = global.howard_type_var; }
    switch local.type
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
    // Text
    if prog_txt_var
    { txt_lock_var = string(prog_var)+" "+prog_str_var; }
    if global.player_len_var <= 1 { lock_var = true; }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if lock_var
    {
        local.note = true;
        if note_var && instance_exists(pt_note_obj) { if !pt_note_obj.read_var { local.note = false; }}
        if prog_var <= 0 && local.note { lock_var = false; }
    }
    event_inherited();
');
// Lock Event
object_event_add
(argument0,ev_other,ev_user3,'
    if prog_press_var && (!instance_exists(txt_obj) || prog_press_var == 2)
    {
        if prog_press_var == 2
        { with txt_obj { instance_destroy(); }}
        event_inherited();
        event_user(5);
    }
    else { event_inherited(); }
');
// Progress Event
object_event_add
(argument0,ev_other,ev_user5,'
    prog_var -= 1;
    if prog_txt_var { txt_lock_var = string(prog_var)+" "+prog_str_var; }
');