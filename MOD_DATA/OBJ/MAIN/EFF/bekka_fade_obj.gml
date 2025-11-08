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
    event_inherited();
    //Defaults
    image_blend = c_black;
    atk_var = false;
    dmg_var = 10;
    dmg_alarm_var = 30;
    mon_var = noone;
    dead_rm_var = gameover_rm;
    // Alarm
    alarm_len_var = 1;
    set_alarm_scr(0,300);
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    atk_var = true;
    image_alpha = 1;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if alarm_arr[0,0] > 0 { image_alpha = 1-(alarm_arr[0,0]/alarm_arr[0,1]); }
    if atk_var
    {
        local.dead = true;
        with player_obj
        {
            if !dead_var && !hurt_var && !in_door_var && !invuln_var && on_var
            {
                if hp_var > other.dmg_var
                {
                    hp_var -= other.dmg_var;
                    if other.dmg_alarm_var
                    {
                        hurt_var = true;
                        set_alarm_scr(0,other.dmg_alarm_var);
                    }
                    hurt_target_var = other.mon_var;
                    event_perform(ev_other,ev_user0);
                }
                else
                {
                    hp_var = 0;
                    dead_var = true;
                    do_coll_var = false;
                    grav_var = false;
                }
                local.success = true;
            }
            if !dead_var { local.dead = false; }
        }
        if local.success
        {
            if false//local.dead
            {
                global.dead_mon_var = mon_var.object_index;
                instance_destroy();
                room_goto_scr(dead_rm_var);
            }
        }
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if view_wview[view_current] >= view_hview[view_current]
    { local.scale = view_hview[view_current]/720; }
    else { local.scale = view_wview[view_current]/1280; }
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    draw_set_color(image_blend); draw_set_alpha(image_alpha);
    draw_rectangle(0,0,view_wview[view_current],view_hview[view_current],false);
    draw_set_color(c_white); draw_set_alpha(1);
    // Lazy
    if atk_var && !irandom(2) { draw_background_ext(bg_var,local.scale*-820,local.scale*-141,local.scale*4,local.scale*4,0,c_white,1); }
    d3d_set_hidden(true);
');