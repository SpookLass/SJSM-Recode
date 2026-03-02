// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,player_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    cam_id_var = 0;
    player_id_var = global.menu_player_var;
    do_taker_var = false;
    invuln_var = true;
    do_stam_var = false;
    switch global.player_type_var
    {
        case 1:
        {
            back_var = false;
            do_sprint_var = false;
            spd_base_var = 1.2;
            acc_var = 0.6;
            break;
        }
        case 2:
        {
            do_sprint_var = false;
            break;
        }
    }
');