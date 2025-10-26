// Builtin Variables
object_set_depth(argument0,-101);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    store_spd_var = global.game_spd_var;
    global.game_spd_var = 0;
    global.mouse_free_var = true;
    action_set_cursor(-1,global.mouse_free_var);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_end,'
    if global.confirm_input_press_var //|| keyboard_check_pressed(vk_escape)
    {
        instance_destroy();
    }
');
// Room End Event
object_event_add
(argument0,ev_other,ev_room_end,'
    event_user(0);
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_user(0);
');
// Stop Event
object_event_add
(argument0,ev_other,ev_user0,'
    global.game_spd_var = store_spd_var;
    global.mouse_free_var = false;
    action_set_cursor(-1,global.mouse_free_var);
    display_mouse_set(display_get_width()/2,display_get_height()/2);
');