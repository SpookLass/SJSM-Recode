// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_3d_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    on_var = true;
    weapon_var = false;
    // Collision
    coll_var[0] = global.trig_coll[0];
    coll_var[1] = global.trig_coll[1];
    coll_var[2] = global.trig_coll[2];
    // Text
    do_str_var = true;
    ini_open(global.lang_var)
    str_var = ini_read_string("UI","look","UI_look");
    ini_close();
    min_scale_var = 0.125;
    str_x_var = 0;
    str_y_var = -72;
    halign_var = fa_center;
    valign_var = fa_bottom;
    sep_var = -1;
    margin_var = 108;
    // Shadow
    shadow_x_var = -4;
    shadow_y_var = 4;
    shadow_var = 2;
    shadow_color_var = make_color_rgb(30,0,50);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if on_var && !global.pause_var
    {
        visible = false;
        local.active = false;
        with player_obj
        {
            if on_var && !in_door_var && !dead_var
            {
                // p3dc_check_scr(coll_var[0],x,y,z,other.coll_var[0],other.x,other.y,other.z)
                if box_coll_scr(x,y,z,coll_var[2],coll_var[2],coll_var[1],other.x,other.y,other.z,other.coll_var[2],other.coll_var[2],other.coll_var[1])
                {
                    other.visible = other.do_str_var && !instance_exists(txt_obj);
                    other.cam_id_var = cam_id_var
                    if global.input_press_arr[interact_input_const,player_id_var] == 1
                    {
                        local.active = true;
                        local.player = id;
                    }
                }
            }
        }
        if local.active
        {
            interact_target_var = local.player;
            with par_var
            {
                interact_target_var = local.player;
                event_user(0);
            }
        }
    }
');
// Axe Trigger Event
object_event_add
(argument0,ev_other,ev_user4,'
    with par_var
    {
        hurt_weapon_var = other.hurt_weapon_var;
        hurt_target_var = other.hurt_target_var;
        hurt_power_var = other.hurt_power_var;
        hurt_type_var = other.hurt_type_var;
        event_user(4);
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if view_current == cam_id_var && on_var
    {
        if view_wview[view_current] >= view_hview[view_current]
        { local.scale = view_hview[view_current]/720; }
        else { local.scale = view_wview[view_current]/1280; }

        d3d_set_fog(false,c_black,0,0);
        d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
        d3d_set_hidden(false); draw_set_alpha(image_alpha);
        draw_set_halign(halign_var); draw_set_valign(valign_var);
        draw_str_ext_shadow_scr(str_var,str_x_var,str_y_var,image_xscale,image_yscale,min_scale_var,halign_var,valign_var,sep_var,margin_var,shadow_x_var,shadow_y_var,shadow_color_var,image_blend,shadow_var,image_angle);
        draw_set_halign(fa_left); draw_set_valign(fa_top);
        draw_set_alpha(1); d3d_set_hidden(true);
    }
');