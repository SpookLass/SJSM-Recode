object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_var);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create
object_event_add
(argument0,ev_create,0,'
    ini_open(global.lang_var);
    str_01_var = ini_read_string("UI","harp_01","UI_harp_01");
    str_02_var = ini_read_string("UI","harp_02","UI_harp_02");
    ini_close();
    len_var = 4;
    if global.main_type_var == 2
    {
        for (local.i=0; local.i<len_var; local.i+=1;)
        { arr_var[local.i] = irandom(2); }
    }
    else
    {
        switch irandom(5)
        {
            case 0:
            {
                arr_var[0] = 0; // L
                arr_var[1] = 0; // L
                arr_var[2] = 1; // F
                arr_var[3] = 0; // L
                break;
            }
            case 1:
            {
                arr_var[0] = 1; // F
                arr_var[1] = 1; // F
                arr_var[2] = 1; // F
                arr_var[3] = 0; // L
                break;
            }
            case 2:
            {
                arr_var[0] = 1; // F
                arr_var[1] = 2; // R
                arr_var[2] = 1; // F
                arr_var[3] = 0; // L
                break;
            }
            case 3:
            {
                arr_var[0] = 2; // R
                arr_var[1] = 2; // R
                arr_var[2] = 1; // F
                arr_var[3] = 0; // L
                break;
            }
            case 4:
            {
                arr_var[0] = 0; // L
                arr_var[1] = -1; // A
                arr_var[2] = 1; // F
                arr_var[3] = 1; // F
                break;
            }
            case 5:
            {
                arr_var[0] = 0; // L
                arr_var[1] = 1; // F
                arr_var[2] = 1; // F
                arr_var[3] = 0; // L
                break;
            }
        }
    }
    reset_prog_var = false;
');
// Room Start
object_event_add
(argument0,ev_other,ev_room_start,'
    if global.player_len_var > 1
    {
        with maze_tp_obj
        {
            local.wall = instance_create(x+lengthdir_x(16,direction),y+lengthdir_y(16,direction),wall_par_obj);
            local.wall.direction = direction;
            local.door = instance_create(x+lengthdir_x(16,direction),y+lengthdir_y(16,direction),door_obj);
            local.door.direction = direction;
            with instance_create(x+lengthdir_x(8,direction),y+lengthdir_y(8,direction),door_trig_obj)
            { event_perform(ev_other,ev_room_start); }
            instance_destroy();
        }
        with color_par_obj { event_user(0); }
    }
');
// Ding Event
object_event_add
(argument0,ev_other,ev_user0,'
    with txt_obj { if par_var == other.id { instance_destroy(); }}
    if arr_var[prog_var] == id_var || arr_var[prog_var] == -1
    {
        fmod_snd_play_scr(harp_01_snd);
        prog_var += 1;
        with instance_create(0,0,txt_obj)
        {
            cam_id_var = -1;
            par_var = other.id;
            str_var = other.str_01_var;
        }
        if prog_var == len_var
        {
            with maze_tp_obj
            {
                local.wall = instance_create(x+lengthdir_x(16,direction),y+lengthdir_y(16,direction),wall_par_obj);
                local.wall.direction = direction;
                local.door = instance_create(x+lengthdir_x(16,direction),y+lengthdir_y(16,direction),door_obj);
                local.door.direction = direction;
                with instance_create(x+lengthdir_x(8,direction),y+lengthdir_y(8,direction),door_trig_obj)
                { event_perform(ev_other,ev_room_start); }
                instance_destroy();
            }
            with color_par_obj { event_user(0); }
        }
    }
    else
    {
        fmod_snd_play_scr(harp_02_snd);
        if reset_prog_var { prog_var = 0; }
        with instance_create(0,0,txt_obj)
        {
            cam_id_var = -1;
            par_var = other.id;
            str_var = other.str_02_var;
        }
    }
');