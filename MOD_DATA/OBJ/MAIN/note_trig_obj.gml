// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,interact_trig_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    ini_open(global.lang_var);
    str_var = ini_read_string("UI","read","UI_read");
    ini_close();
    read_var = false;
    interact_target_var = noone;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if !on_var && read_var
    {
        local.active = false;
        with interact_target_var
        {
            if on_var && !in_door_var && !dead_var
            {
                // p3dc_check_scr(coll_var[0],x,y,z,other.coll_var[0],other.x,other.y,other.z)
                if box_coll_scr(x,y,z,coll_var[2],coll_var[2],coll_var[1],other.x,other.y,other.z,other.coll_var[2],other.coll_var[2],other.coll_var[1])
                { local.active = true; }
            }
        }
        if !local.active
        {
            with par_var
            {
                event_user(3);
            }
        }
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
        d3d_set_hidden(false);

        draw_set_halign(fa_center);
        draw_set_valign(fa_bottom);

        local.xtmp = view_wview[view_current]/2;
        local.ytmp = view_hview[view_current]*0.9;

        local.shadow = shadow_off_var*local.scale;

        draw_set_color(make_color_rgb(30,0,50));
        draw_text_transformed(local.xtmp-(local.shadow*2),local.ytmp+(local.shadow*2),str_var,local.scale,local.scale,0);
        draw_text_transformed(local.xtmp-local.shadow,local.ytmp+local.shadow,str_var,local.scale,local.scale,0);
        
        draw_set_color(c_white);
        draw_text_transformed(local.xtmp,local.ytmp,str_var,local.scale,local.scale,0);

        draw_set_halign(fa_left);
        draw_set_valign(fa_top);

        d3d_set_hidden(true);
    }
');