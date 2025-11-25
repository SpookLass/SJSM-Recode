// Builtin Variables
object_set_depth(argument0,98);
object_set_mask(argument0,noone);
object_set_parent(argument0,skybox_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    bg_color_var = make_color_rgb(47,33,88);
    background_color = bg_color_var;
    mdl_01_var = d3d_model_create();
    d3d_model_load(mdl_01_var,main_directory_const+"\MDL\DH\dh_sky_01_mdl.gmmod");
    mdl_02_var = d3d_model_create();
    d3d_model_load(mdl_02_var,main_directory_const+"\MDL\DH\dh_sky_02_mdl.gmmod");
    bg_01_var = background_add(dh_directory_const+"\TEX\DOLL\MODELS\SKY.png",false,false);
    tex_01_var = background_get_texture(bg_01_var);
    bg_02_var = background_add(dh_directory_const+"\TEX\DOLL\MODELS\SKY2.png",false,false);
    tex_02_var = background_get_texture(bg_02_var);
    z_off_var = -10; // Rough estimate
    load_var = true;
    with rain_part_obj { instance_destroy(); }
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    event_user(1);
');
// Room Start
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    background_color = bg_color_var;
');
// Room End
object_event_add
(argument0,ev_other,ev_room_end,'
    event_inherited();
    event_user(1);
');
// Draw Skybox
object_event_add
(argument0,ev_other,ev_user0,'
    d3d_transform_add_translation(0,0,z_off_var);
    d3d_model_draw(mdl_01_var,0,0,0,tex_01_var);
    d3d_model_draw(mdl_02_var,0,0,0,tex_02_var);
');
// Delete Event
object_event_add
(argument0,ev_other,ev_user1,'
    if load_var
    {
        d3d_model_destroy(mdl_01_var);
        d3d_model_destroy(mdl_02_var);
        background_delete(bg_01_var);
        background_delete(bg_02_var);
        load_var = false;
    }
');