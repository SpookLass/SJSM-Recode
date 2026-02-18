// Builtin Variables
object_set_depth(argument0,98);
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
    // Replace sunrise / sunset with night if Dollhouse not present
    if file_exists(working_directory+"\The_Doll_House\SDH.exe")
    { local.night = (current_hour <= 5 || current_hour >= 19); }
    else { local.night = (current_hour <= 6 || current_hour >= 18); }
    // Skyboxes
    if local.night || global.rm_count_var < 100 { instance_create(0,0,skybox_obj); } // Night
    else if current_hour > 6 || current_hour < 18 { instance_create(0,0,skybox_fake_obj); } // Day
    else { instance_create(0,0,skybox_dh_obj); } // Sunrise / Sunset
    instance_destroy();
');