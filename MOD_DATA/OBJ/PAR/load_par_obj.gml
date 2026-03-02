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
    // Array
    if !variable_local_exists("bg_len_var") { bg_len_var = 0; }
    if !variable_local_exists("snd_len_var") { snd_len_var = 0; }
    if !variable_local_exists("spr_len_var") { spr_len_var = 0; }
    if !variable_local_exists("mdl_len_var") { mdl_len_var = 0; }
    // Draw Text
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    set_automatic_draw(false);
    draw_set_halign(fa_center); draw_set_valign(fa_bottom);
    // Load BGs
    if bg_len_var > 0
    {
        for (local.i=0; local.i<bg_len_var; local.i+=1;)
        {
            draw_load_scr("Loading backgrounds ("+string(local.i+1)+" / "+string(bg_len_var)+")...");
            local.gml = filename_change_ext(bg_arr_var[local.i,1],".gml");
            if file_exists(local.gml) { bg_arr_var[local.i,0] = execute_file(local.gml,bg_arr_var[local.i,1]); }
            else { bg_arr_var[local.i,0] = background_add(bg_arr_var[local.i,1],bg_arr_var[local.i,2],bg_arr_var[local.i,3]); }
        }
        draw_load_scr("Loaded backgrounds!");
    }
    // Load sprites
    if spr_len_var > 0
    {
        for (local.i=0; local.i<spr_len_var; local.i+=1;)
        {
            draw_load_scr("Loading sprites ("+string(local.i+1)+" / "+string(spr_len_var)+")...");
            local.gml = filename_change_ext(spr_arr_var[local.i,1],".gml");
            if file_exists(local.gml) { spr_arr_var[local.i,0] = execute_file(local.gml,spr_arr_var[local.i,1]); }
            else { spr_arr_var[local.i,0] = sprite_add(spr_arr_var[local.i,1],spr_arr_var[local.i,2],spr_arr_var[local.i,3],spr_arr_var[local.i,4],spr_arr_var[local.i,5],spr_arr_var[local.i,6]); }
        }
        draw_load_scr("Loaded sprites!");
    }
    // Load sounds
    if snd_len_var > 0
    {
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        {
            draw_load_scr("Loading sounds ("+string(local.i+1)+" / "+string(snd_len_var)+")...");
            local.gml = filename_change_ext(snd_arr_var[local.i,1],".gml");
            if file_exists(local.gml) { snd_arr_var[local.i,0] = execute_file(local.gml,snd_arr_var[local.i,1]); }
            else { snd_arr_var[local.i,0] = fmod_snd_add_scr(snd_arr_var[local.i,1],snd_arr_var[local.i,2]); }
        }
        draw_load_scr("Loaded sounds!");
    }
    // Models
    if mdl_len_var > 0
    {
        for (local.i=0; local.i<mdl_len_var; local.i+=1;)
        {
            draw_load_scr("Loading models ("+string(local.i+1)+" / "+string(mdl_len_var)+")...");
            mdl_arr_var[local.i,0] = d3d_model_create();
            d3d_model_load(mdl_arr_var[local.i,0],mdl_arr_var[local.i,1])
        }
        draw_load_scr("Loaded models!");
    }
    // Stop drawing text
    draw_set_halign(fa_left); draw_set_valign(fa_top);
    set_automatic_draw(global.autodraw_var);
    d3d_set_hidden(true);
    // Leave
    rm_goto_scr(rm_var);
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
    // Load BGs
    if bg_len_var > 0
    {
        for (local.i=0; local.i<bg_len_var; local.i+=1;)
        {
            draw_load_scr("Unloading backgrounds ("+string(local.i+1)+" / "+string(bg_len_var)+")...");
            local.gml = filename_change_ext(bg_arr_var[local.i,1],".gml");
            background_delete(bg_arr_var[local.i,0]);
        }
        draw_load_scr("Unloaded backgrounds!");
    }
    // Load sprites
    if spr_len_var > 0
    {
        for (local.i=0; local.i<spr_len_var; local.i+=1;)
        {
            draw_load_scr("Unloading sprites ("+string(local.i+1)+" / "+string(spr_len_var)+")...");
            local.gml = filename_change_ext(spr_arr_var[local.i,1],".gml");
            sprite_delete(spr_arr_var[local.i,0]);
        }
        draw_load_scr("Unloaded sprites!");
    }
    // Load sounds
    if snd_len_var > 0
    {
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        {
            draw_load_scr("Unloading sounds ("+string(local.i+1)+" / "+string(snd_len_var)+")...");
            local.gml = filename_change_ext(snd_arr_var[local.i,1],".gml");
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
    // Stop drawing text
    draw_set_halign(fa_left); draw_set_valign(fa_top);
    set_automatic_draw(global.autodraw_var);
    d3d_set_hidden(true);
');