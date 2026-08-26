// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    with control_obj { event_perform(ev_other,ev_room_start); } // Prevent window shenanigans
    // Array
    if !variable_local_exists("menu_var") { menu_var = false; }
    if !variable_local_exists("bg_len_var") { bg_len_var = 0; }
    if !variable_local_exists("snd_len_var") { snd_len_var = 0; }
    if !variable_local_exists("spr_len_var") { spr_len_var = 0; }
    if !variable_local_exists("mdl_len_var") { mdl_len_var = 0; }
    if !variable_local_exists("path_len_var") { path_len_var = 0; }
    if !variable_local_exists("surf_len_var") { surf_len_var = 0; }
    if !variable_local_exists("obj_len_var") { obj_len_var = 0; }
    if !variable_local_exists("rm_len_var") { rm_len_var = 0; }
    // Generic Spawn stuff
    if !variable_local_exists("mon_var") { mon_var = noone; }
    if !variable_local_exists("mon_x_var") { mon_x_var = 0; }
    if !variable_local_exists("mon_y_var") { mon_y_var = 0; }
    if !variable_local_exists("mon_z_var") { mon_z_var = 0; }
    if !variable_local_exists("mon_pos_var") { mon_pos_var = 0; }
    // Draw Text
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    set_automatic_draw(false);
    draw_set_halign(fa_center); draw_set_valign(fa_bottom);
    // Backgrounds
    if bg_len_var > 0
    {
        for (local.i=0; local.i<bg_len_var; local.i+=1;)
        {
            draw_load_scr("Loading backgrounds ("+string(local.i+1)+" / "+string(bg_len_var)+")...");
            bg_arr_var[local.i,0] = bg_add_scr(bg_arr_var[local.i,1],bg_arr_var[local.i,2],bg_arr_var[local.i,3]);
            bg_arr_var[local.i,4] = background_get_texture(bg_arr_var[local.i,0]);
            local.name = filename_name(bg_arr_var[local.i,1]);
            variable_local_set(local.name,bg_arr_var[local.i,0]);
            variable_local_set(local.name+"_tex",bg_arr_var[local.i,4]);
        }
        draw_load_scr("Loaded backgrounds!");
    }
    // Sprites
    if spr_len_var > 0
    {
        for (local.i=0; local.i<spr_len_var; local.i+=1;)
        {
            draw_load_scr("Loading sprites ("+string(local.i+1)+" / "+string(spr_len_var)+")...");
            spr_arr_var[local.i,0] = spr_add_scr(spr_arr_var[local.i,1],spr_arr_var[local.i,2],spr_arr_var[local.i,3],spr_arr_var[local.i,4],spr_arr_var[local.i,5],spr_arr_var[local.i,6]);
            variable_local_set(filename_name(spr_arr_var[local.i,1]),spr_arr_var[local.i,0]);
        }
        draw_load_scr("Loaded sprites!");
    }
    // Sounds
    if snd_len_var > 0
    {
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        {
            draw_load_scr("Loading sounds ("+string(local.i+1)+" / "+string(snd_len_var)+")...");
            snd_arr_var[local.i,0] = snd_add_scr(snd_arr_var[local.i,1],snd_arr_var[local.i,2],snd_arr_var[local.i,3],snd_arr_var[local.i,4],snd_arr_var[local.i,5],snd_arr_var[local.i,6]);
            variable_local_set(filename_name(snd_arr_var[local.i,1]),snd_arr_var[local.i,0]);
        }
        draw_load_scr("Loaded sounds!");
    }
    // Models
    if mdl_len_var > 0
    {
        for (local.i=0; local.i<mdl_len_var; local.i+=1;)
        {
            draw_load_scr("Loading models ("+string(local.i+1)+" / "+string(mdl_len_var)+")...");
            mdl_arr_var[local.i,0] = mdl_add_scr(mdl_arr_var[local.i,1]);
            variable_local_set(filename_name(mdl_arr_var[local.i,1]),mdl_arr_var[local.i,0]);
        }
        draw_load_scr("Loaded models!");
    }
    // Path
    if path_len_var > 0
    {
        for (local.i=0; local.i<path_len_var; local.i+=1;)
        {
            draw_load_scr("Loading paths ("+string(local.i+1)+" / "+string(path_len_var)+")...");
            path_arr_var[0] = path_add();
            path_set_kind(path_arr_var[local.i,0],path_arr_var[local.i,2]); // Smooth
            path_set_closed(path_arr_var[local.i,0],path_arr_var[local.i,3]);
            path_set_precision(path_arr_var[local.i,0],path_arr_var[local.i,4]);
            variable_local_set(path_arr_var[local.i,1],path_arr_var[local.i,0]); // Name
        }
        draw_load_scr("Loaded paths!");
    }
    // Surfaces
    if surf_len_var > 0
    {
        for (local.i=0; local.i<surf_len_var; local.i+=1;)
        {
            draw_load_scr("Loading surfaces ("+string(local.i+1)+" / "+string(surf_len_var)+")...");
            surf_arr_var[local.i,0] = surface_create(surf_arr_var[local.i,2],surf_arr_var[local.i,3]);
            surface_set_target(surf_arr_var[local.i,0]);
            draw_clear_alpha(c_black,0);
            surface_reset_target();
            surf_arr_var[local.i,4] = surface_get_texture(surf_arr_var[local.i,0]);
            variable_local_set(surf_arr_var[local.i,1],surf_arr_var[local.i,0]); // Name
            variable_local_set(surf_arr_var[local.i,1]+"_tex",surf_arr_var[local.i,4]);
        }
        draw_load_scr("Loaded surfaces!");
    }
    // Objects
    if obj_len_var > 0
    {
        for (local.i=0; local.i<obj_len_var; local.i+=1;)
        {
            draw_load_scr("Loading objects ("+string(local.i+1)+" / "+string(obj_len_var)+")...");
            obj_arr_var[local.i,0] = obj_add_scr(obj_arr_var[local.i,1]);
            variable_local_set(filename_name(obj_arr_var[local.i,1]),obj_arr_var[local.i,0]);
        }
        draw_load_scr("Loaded objects!");
    }
    // Rooms
    if rm_len_var > 0
    {
        for (local.i=0; local.i<rm_len_var; local.i+=1;)
        {
            draw_load_scr("Loading rooms ("+string(local.i+1)+" / "+string(rm_len_var)+")...");
            rm_arr_var[local.i,0] = rm_add_scr(rm_arr_var[local.i,1]);
            variable_local_set(filename_name(rm_arr_var[local.i,1]),rm_arr_var[local.i,0]);
        }
        draw_load_scr("Loaded rooms!");
    }
    // Stop drawing text
    draw_set_halign(fa_left); draw_set_valign(fa_top);
    set_automatic_draw(global.autodraw_var);
    d3d_set_hidden(true);
    // Leave
    if rm_var < rm_len_var { local.rm = rm_arr_var[rm_var,0]; }
    else { local.rm = rm_var; }
    if menu_var { rm_goto_menu_scr(local.rm,false); }
    else { rm_leave_menu_scr(local.rm); }
');
// Destroy
object_event_add
(argument0,ev_destroy,0,'
    // Draw Text
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    set_automatic_draw(false);
    draw_set_halign(fa_center); draw_set_valign(fa_bottom);
    // Backgrounds
    if bg_len_var > 0
    {
        for (local.i=0; local.i<bg_len_var; local.i+=1;)
        {
            draw_load_scr("Unloading backgrounds ("+string(local.i+1)+" / "+string(bg_len_var)+")...");
            background_delete(bg_arr_var[local.i,0]);
        }
        draw_load_scr("Unloaded backgrounds!");
    }
    // Sprites
    if spr_len_var > 0
    {
        for (local.i=0; local.i<spr_len_var; local.i+=1;)
        {
            draw_load_scr("Unloading sprites ("+string(local.i+1)+" / "+string(spr_len_var)+")...");
            sprite_delete(spr_arr_var[local.i,0]);
        }
        draw_load_scr("Unloaded sprites!");
    }
    // Sounds
    if snd_len_var > 0
    {
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        {
            draw_load_scr("Unloading sounds ("+string(local.i+1)+" / "+string(snd_len_var)+")...");
            fmod_snd_free_scr(snd_arr_var[local.i,0]);
        }
        draw_load_scr("Unloaded sounds!");
    }
    // Models
    if mdl_len_var > 0
    {
        for (local.i=0; local.i<mdl_len_var; local.i+=1;)
        {
            draw_load_scr("Unloading models ("+string(local.i+1)+" / "+string(mdl_len_var)+")...");
            d3d_model_destroy(mdl_arr_var[local.i,0]);
        }
        draw_load_scr("Unloaded models!");
    }
    // Paths
    if path_len_var > 0
    {
        for (local.i=0; local.i<path_len_var; local.i+=1;)
        {
            draw_load_scr("Unloading paths ("+string(local.i+1)+" / "+string(path_len_var)+")...");
            path_delete(path_arr_var[local.i,0]);
        }
        draw_load_scr("Unloaded paths!");
    }
    // Surfaces
    if surf_len_var > 0
    {
        for (local.i=0; local.i<surf_len_var; local.i+=1;)
        {
            draw_load_scr("Unloading surfaces ("+string(local.i+1)+" / "+string(surf_len_var)+")...");
            surface_free(surf_arr_var[local.i,0]);
        }
        draw_load_scr("Unloaded surfaces!");
    }
    // Objects
    if obj_len_var > 0
    {
        for (local.i=0; local.i<obj_len_var; local.i+=1;)
        {
            draw_load_scr("Unloading objects ("+string(local.i+1)+" / "+string(obj_len_var)+")...");
            object_delete(obj_arr_var[local.i,0]);
        }
        draw_load_scr("Unloaded objects!");
    }
    // Rooms
    if rm_len_var > 0
    {
        for (local.i=0; local.i<rm_len_var; local.i+=1;)
        {
            draw_load_scr("Unloading rooms ("+string(local.i+1)+" / "+string(rm_len_var)+")...");
            // Cant actually delete, damn you GM8.
            room_instance_clear(rm_arr_var[local.i,0])
        }
        draw_load_scr("Unloaded rooms!");
    }
    // Stop drawing text
    draw_set_halign(fa_left); draw_set_valign(fa_top);
    set_automatic_draw(global.autodraw_var);
    d3d_set_hidden(true);
');