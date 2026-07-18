// Builtin Variables
object_set_depth(argument0,-100);
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
    par_var = noone;
    //Defaults
    ini_open("lang_"+global.lang_var+".ini");
    str_var = ini_read_string("UI","interact","UI_interact");
    ini_close();
    str_x_var = 0;
    str_y_var = -128; // I think?
    scale_var = 0.5;
    min_scale_var = 0.125;
    offset_var = 380;
    margin_var = 108;
    sep_var = -1;
    dist_min_var = 0;
    dist_max_var = 0;
    // Shadow
    shadow_x_var = -2;
    shadow_y_var = 2;
    shadow_var = 1;
    shadow_color_var = make_color_rgb(30,0,50); // 100
    // Alarm
    alarm_len_var = 1;
    alarm_ini_scr();
    set_alarm_scr(0,120);
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    instance_destroy();
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    // Set
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false); draw_set_alpha(image_alpha);
    draw_set_halign(fa_center); draw_set_valign(fa_bottom);
    // Spin!
    if global.sub_var > 0
    {
        // Calculations
        local.viewscale = min(view_wview[view_current]/1280,view_hview[view_current]/720);
        local.hudscale = global.hud_scale_var*0.01;
        local.scale = max(min_scale_var,local.hudscale*scale_var*local.viewscale);
        local.xdist = (view_wview[view_current]-(offset_var*local.viewscale))*0.5;
        local.ydist = 128*local.viewscale;
        local.width = 2*offset_var/local.hudscale;
        // Shadows
        local.shadowx = shadow_x_var*local.viewscale*local.hudscale;
        local.shadowy = shadow_y_var*local.viewscale*local.hudscale;
        // Direction
        local.dir = global.cam_yaw_var[view_current]-point_direction(x,y,global.cam_x_var[view_current],global.cam_y_var[view_current])-90;
        local.xtmp = (view_wview[view_current]*0.5)-lengthdir_x(local.xdist,local.dir);
        local.ytmp = view_hview[view_current]-(120*local.viewscale)-local.ydist+lengthdir_y(local.ydist,local.dir); // 624
        // Distance
        local.dist = point_distance_3d_scr(x,y,z,global.cam_x_var[view_current],global.cam_y_var[view_current],global.cam_z_var[view_current]);
        if dist_max_var > 0
        { draw_set_alpha(anti_lerp_scr(dist_max_var,dist_min_var,local.dist)); }
        else { draw_set_alpha(1); }
        // Draw
        draw_set_color(shadow_color_var);
        draw_text_ext_transformed(local.xtmp+local.shadowx,local.ytmp+local.shadowy,str_var,sep_var,local.width,local.scale,local.scale,0);
        draw_set_color(image_blend);
        draw_text_ext_transformed(local.xtmp,local.ytmp,str_var,-1,local.width,local.scale,local.scale,0);
    }
    else { draw_str_ext_shadow_scr(str_var,str_x_var,str_y_var,scale_var,scale_var,min_scale_var,fa_center,fa_bottom,sep_var,margin_var,shadow_x_var,shadow_y_var,shadow_color_var,image_blend,shadow_var,image_angle); }
    // Reset
    draw_set_halign(fa_left); draw_set_valign(fa_top);
    draw_set_alpha(1); d3d_set_hidden(true);
');