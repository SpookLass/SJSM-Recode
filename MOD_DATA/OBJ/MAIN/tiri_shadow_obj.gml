

// Builtin Variables
object_set_depth(argument0,-2);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Prop collisions
global.tiri_shadow_coll[1] = 24; // 16
global.tiri_shadow_coll[2] = 24; // 16
global.tiri_shadow_coll[0] = prop_to_coll_scr(5,'',global.tiri_shadow_coll[2],0,global.tiri_shadow_coll[1],true,8);
// Create event
object_event_add
(argument0,ev_create,0,"
    event_inherited();
    solid_var = true;
    type_var = 5; // Billboard
    w_var = 24;
    h_var = 24;
    step_var = 8;
    image_alpha = 0.2;
    // Collisions
    coll_var[0] = global.tiri_shadow_coll[0];
    coll_var[1] = global.tiri_shadow_coll[1];
    coll_var[2] = global.tiri_shadow_coll[2];
    // Weapon
    weapon_var = true;
    weapon_alarm_var = 6;
    alarm_len_var = 1;
");
// Weapon
object_event_add
(argument0,ev_other,ev_user4,"
    hp_var -= 1;
    if hp_var <= 0
    {
        tex_var = store_tex_03_var;
        weapon_var = false;
        solid_var = false;
        set_alarm_scr(0,-1);
    }
    else if weapon_alarm_var > 0
    {
        tex_var = store_tex_02_var;
        weapon_var = false;
        set_alarm_scr(0,weapon_alarm_var);
    }
");
// Alarm
object_event_add
(argument0,ev_alarm,0,"
    tex_var = store_tex_var;
    weapon_var = true;
")