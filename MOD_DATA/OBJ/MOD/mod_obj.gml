// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    bg_x_var = 0;
    bg_y_var = 0;
    bg_xspd_var = 1;
    bg_yspd_var = 1;
    margin_var = 96;
    txt_margin_var = 56;
    // Mod
    mod_var = 0;
    mod_load_var = 0;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'

');
// Create Event
object_event_add
(argument0,ev_create,0,'
    draw_bg_tiled_stretch_scr(settings_bg,bg_x_var,bg_y_var,512,0,2);
    draw_set_halign(fa_right);
    draw_str_shadow_scr
    (
        mod_str_var,
        -20,20,0.95,0.95,0.125,fa_right,fa_top,
        -4,4,str_bg_color_var,c_yellow,2,0
    );
    draw_set_halign(fa_left);
    // Rectangle
    draw_set_color(c_black); draw_set_alpha(0.5);
    local.viewscale = min(view_wview[view_current]/1280,view_hview[view_current]/720);
    local.center = view_wview[view_current]/2;
    local.margin = margin_var*local.viewscale
    draw_rectangle(local.margin,local.margin,local.center-local.margin,view_hview[view_current]-local.margin,false);
    draw_rectangle(local.center+local.margin,local.margin,view_wview[view_current]-local.margin,view_hview[view_current]-local.margin,false);
    draw_set_color(c_white); draw_set_alpha(0.5);
    // Text
    local.count = floor((view_hview[view_current]-(local.margin*2))/192);
    local.scroll = median(local.count,ds_list_size(global.mod_list)-1-local.count,mod_var);

    for (local.i=0; local.i<local.count*2; local.i+=1;)
    {
        local.index = local.i+local.scroll-local.count;
        local.str = filename_name(ds_list_find_value(global.mod_list,local.index));
        if local.index == mod_var
        {

        }
        else
        {
            draw_str_shadow_scr
            (
                local.str,
                96,144+(96*local.i)+scroll_var,0.75,0.75,0.125,fa_left,fa_top,
                -4,4,str_bg_color_var,c_yellow,2,0
            );
        }
    }
    

    local.scroll = median(local.count,ds_list_size(global.mod_load_list)-1-local.count,mod_load_var);
');
