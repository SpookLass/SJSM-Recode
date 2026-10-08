// Builtin Variables
object_set_depth(argument0,-99);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    image_blend = c_dkgray;
    scale_var = 360; // 512
    bob_mult_var = 0.03125;
    // Surface
    load_var = true;
    surf_var = surface_create(scale_var,scale_var);
    surface_set_target(surf_var);
    d3d_set_projection_ortho(0,0,scale_var,scale_var,0); d3d_set_fog(false,c_black,0,0); d3d_set_hidden(false);
    draw_clear_alpha(c_white-image_blend,0);
    draw_set_color(c_white-image_blend); draw_rectangle(0,0,scale_var,scale_var,false); draw_set_color(c_white);
    draw_set_blend_mode(bm_subtract); draw_background_stretched(flash_bg,0,0,scale_var,scale_var); draw_set_blend_mode(bm_normal);
    d3d_set_hidden(true);
    surface_reset_target();
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    visible = instance_exists(color_par_obj);
    if visible
    {
        // Draw
        image_blend = color_par_obj.image_blend;
        surface_set_target(surf_var);
        d3d_set_projection_ortho(0,0,scale_var,scale_var,0); d3d_set_fog(false,c_black,0,0); d3d_set_hidden(false);
        draw_clear_alpha(c_white-image_blend,0);
        draw_set_color(c_white-image_blend); draw_rectangle(0,0,scale_var,scale_var,false); draw_set_color(c_white);
        draw_set_blend_mode(bm_subtract); draw_background_stretched(flash_bg,0,0,scale_var,scale_var); draw_set_blend_mode(bm_normal);
        d3d_set_hidden(true);
        surface_reset_target();
        // Reset colors
        with color_par_obj { instance_destroy(); }
        if global.color_var < 2
        {
            with par_3d_obj
            {
                if color_var == 1 || (color_var > 0 && global.color_var != 1)
                { image_blend = c_white; }
            }
            with axe_obj
            {
                if color_var == 1 || (color_var > 0 && global.color_var != 1)
                { image_blend = c_white; }
            }
        }
    }
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_user(0);
');
// Room End Event
object_event_add
(argument0,ev_other,ev_room_end,'
    if !persistent { event_user(0); }
');
// User Event
object_event_add
(argument0,ev_other,ev_user0,'
    if load_var
    {
        surface_free(surf_var);
        load_var = false;
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false); draw_set_blend_mode(bm_subtract); //draw_set_blend_mode_ext(bm_dest_color,bm_src_color);
    // Bob
        local.boboff = 0.5;
        if instance_exists(global.player_arr[view_current])
        { local.boboff = 0.5+(global.player_arr[view_current].bob_var*bob_mult_var); }
    // Math
        local.scale = view_hview[view_current]/720;
        local.centerx = round(view_wview[view_current]*0.5); local.centery = round(view_hview[view_current]*local.boboff);
        local.offset = round(scale_var*0.5*local.scale);
        local.xtmp1 = local.centerx-local.offset;
        local.ytmp1 = local.centery-local.offset;
        local.xtmp2 = local.centerx+local.offset;
        local.ytmp2 = local.centery+local.offset;
    // Middle
        draw_surface_ext(surf_var,local.xtmp1,local.ytmp1,local.scale,local.scale,0,c_white,image_alpha);
        draw_set_color(c_white-image_blend);
        draw_rectangle(0,local.ytmp1,local.xtmp1-1,local.ytmp2-1,false);
        draw_rectangle(local.xtmp2,local.ytmp1,view_wview[view_current]-1,local.ytmp2-1,false);
    // Top
        draw_rectangle(0,0,local.xtmp1-1,local.ytmp1-1,false);
        draw_rectangle(local.xtmp1,0,local.xtmp2-1,local.ytmp1-1,false);
        draw_rectangle(local.xtmp2,0,view_wview[view_current]-1,local.ytmp1-1,false);
    // Bottom
        draw_rectangle(0,local.ytmp2,local.xtmp1-1,view_hview[view_current]-1,false);
        draw_rectangle(local.xtmp1,local.ytmp2,local.xtmp2-1,view_hview[view_current]-1,false);
        draw_rectangle(local.xtmp2,local.ytmp2,view_wview[view_current]-1,view_hview[view_current]-1,false);
    draw_set_color(c_white-image_blend)
    d3d_set_hidden(true); draw_set_blend_mode(bm_normal);
');