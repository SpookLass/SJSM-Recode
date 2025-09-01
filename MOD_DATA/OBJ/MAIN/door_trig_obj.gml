// Builtin Variables
object_set_depth(argument0,-101);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Draw Event
object_event_add
(argument0,ev_create,0,"
    // Collision
    coll_var[0] = global.trig_coll[0];
    coll_var[1] = global.trig_coll[1];
    coll_var[2] = global.trig_coll[2];
    // Text
    txt_var = 'Open';
    txt_lock_var = 'Locked.';
    // Function
    score_var = 1;
    delay_var = 20;
    switch irandom(18)
    {
        case 0: { rm_var = hall_01_rm; break; }
        case 1: { rm_var = hall_02_rm; break; }
        case 2: { rm_var = hall_02_b_rm; break; }
        case 3: { rm_var = hall_03_rm; break; }
        case 4: { rm_var = hall_04_rm; break; }
        case 5: { rm_var = hall_05_rm; break; }
        case 6: { rm_var = hall_13_rm; break; }
        case 7: { rm_var = hall_18_rm; break; }
        case 8: { rm_var = hall_19_rm; break; }
        case 9: { rm_var = hall_20_rm; break; }
        case 10: { rm_var = hall_21_rm; break; }
        case 11: { rm_var = hall_21_b_rm; break; }
        case 12: { rm_var = hall_22_rm; break; }
        case 13: { rm_var = hall_23_rm; break; }
        case 14: { rm_var = hall_31_rm; break; }
        case 15: { rm_var = hall_31_b_rm; break; }
        case 16: { rm_var = long_hall_05_rm; break; }
        case 17: { rm_var = test_01_rm; break; }
        case 18: { rm_var = test_02_rm; break; }
    }
    // Alarm
    alarm_len_var = 1;
    alarm_arr[0,2] = '';
");
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,"
    room_goto(rm_var);
")
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,"
    visible = false;
    local.door = id;
    local.indoor = true;
    local.active = false;
    with player_obj
    {
        local.player = id;
        // p3dc_check_scr(coll_var[0],x,y,z,other.coll_var[0],other.x,other.y,other.z)
        if box_coll_scr(x,y,z,coll_var[2],coll_var[1],other.x,other.y,other.z,other.coll_var[2],other.coll_var[1])
        {
            other.visible = true;
            other.cam_id_var = cam_id_var
            if global.interact_input_press_var == 1 && !in_door_var
            {
                if !other.lock_var
                {
                    on_var = false;
                    in_door_var = true;
                    local.active = true;
                    with instance_create(0,0,fade_eff_obj)
                    {
                        image_blend = c_black; 
                        set_alarm_scr(0,local.door.delay_var); 
                        invert_var = true;
                        stay_var = true;
                        cam_id_var = local.player.cam_id_var;
                    }
                }
                else if !instance_exists(txt_obj)
                {
                    local.txt = instance_create(0,0,txt_obj);
                    local.txt.txt_var = other.txt_lock_var;
                }
            }
        }
        if !in_door_var 
        { local.indoor = false; }
    }
    if local.active && local.indoor { set_alarm_scr(0,delay_var); }
")
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    if view_current == cam_id_var 
    {
        if lock_var { local.txt = txt_lock_var; }
        else {local.txt = txt_var; }

        d3d_set_projection_ortho(0,0,1280,720,0);
        d3d_set_hidden(false);

        draw_set_halign(fa_center);
        draw_set_valign(fa_bottom);

        draw_set_color(make_color_rgb(30,0,50));
        draw_text_transformed(638,650,local.txt,4,4,0);
        draw_text_transformed(636,652,local.txt,4,4,0);

        draw_set_color(c_white);
        draw_text_transformed(640,648,local.txt,4,4,0);

        draw_set_halign(fa_left);
        draw_set_valign(fa_top);

        d3d_set_hidden(true);
    }
");