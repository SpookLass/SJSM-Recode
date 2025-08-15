// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,mon_par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
/*
Variables
type_var
    0: Ignores walls
    1: Pathfinds normally
    2: Floats over pits
enter_var: Whether a physical monster is entering the room
dur_var: The chase duration
dur_start_var: How much duration a monster starts with, used for scripted events and boss bars
delay_var: How much time before a monster starts acting
w_var: How many pixels wide the monster is
h_var: How many pixels tall the monster is
z_off_var: How many pixels off the ground the monster is
dmg_var: How much damage a monster deals per hit
dmg_alarm_var: How much time before something can hit the player again (per player)
spd_base_var: How fast the monster moves in pixels per frame (60fps)
spd_mult_var: Multiplier for the monster's speed, mostly for monsters that have varied speeds
acc_var: How fast the monster accelerates in pixels per frame squared (60fps)
do_move_var: Whether the specimen should move
do_anim_var: Whether the specimen should animate
do_attack_var: Whether the specimen should attack
do_hurt_var: Whether the specimen should be vulnerable
move_var: Whether the specimen can currently move
anim_var: Whether the specimen can currently animate
attack_var: Whether the specimen can currently attack
hurt_var: Whether the specimen is currently hurt
*/
// Create Event
object_event_add
(argument0,ev_create,0,"
    // Gotta set type, delay, and duration
    do_coll_var = type_var;
    enter_var = type_var;
    spd_base_var = 0.6;
    spd_mult_var = 1;
    dur_star_var = dur_var;
    if delay_var != 0 && delay_min_var == 0
    {
        delay_min_var = delay_var;
        delay_max_var = delay_var;
    }
    w_var = 10;
    h_var = 20;
    dmg_var = 45;
    dmg_alarm_var = 120;
    do_move_var = true;
    do_attack_var = true;
    do_anim_var = true;
");
// Room End Event
object_event_add
(argument0,ev_other,ev_room_end,"
    event_inherited();
    move_var = do_move_var;
    anim_var = do_anim_var;
    attack_var = do_attack_var;
    hurt_var = false;
");
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,"
    // Position
    yaw_var = global.spawn_arr[0,3];
    x = global.spawn_arr[0,0]+lengthdir_x(32,yaw_var);
    y = global.spawn_arr[0,1]+lengthdir_y(32,yaw_var);
    z = global.spawn_arr[0,2];
    set_motion_scr(0,true,yaw_var,true);
    enter_var = type_var;
");
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,"
    if on_var
    {
        if move_var
        {

            event_perform(ev_other,ev_user0); 
        }
        if anim_var { event_perform(ev_other,ev_user1); }
        if attack_var { event_perform(ev_other,ev_user2); }
    }
");
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    if global.fog_dark_var { d3d_set_fog(false,c_black,0,0); }
    d3d_transform_set_identity();
    d3d_transform_add_rotation_y(-point_direction_3d_scr(x,y,z,global.cam_x_var[view_current],global.cam_y_var[view_current],global.cam_z_var[view_current]));
    d3d_transform_add_rotation_z(point_direction(x,y,global.cam_x_var[view_current],global.cam_y_var[view_current]));
    d3d_transform_add_translation(x,y,z);
    draw_set_color(image_blend); draw_set_alpha(image_alpha);
    d3d_draw_wall(0,-w_var/2,h_var/2,0,w_var/2,-h_var/2,sprite_get_texture(spr_var,spr_id_var),1,1);
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
    if global.fog_dark_var 
    { d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var); }
");
// Delay Alarm
object_event_add
(argument0,ev_alarm,0,"
    on_var = true;
");
// Unstun Alarm
object_event_add
(argument0,ev_alarm,1,"
    move_var = do_move_var;
");
// Start Anim Alarm
object_event_add
(argument0,ev_alarm,2,"
    anim_var = do_anim_var;
");
// Hurt Alarm
object_event_add
(argument0,ev_alarm,3,"
    hurt_var = false;
");
// Attack Alarm
object_event_add
(argument0,ev_alarm,4,"
    attack_var = do_attack_var;
");
// Anim Alarm (Different from plus!!!)
object_event_add
(argument0,ev_alarm,4,"
    spr_id_var = sprite_get_number(spr_var)-1;
    tex_var = sprite_get_texture(spr_var,spr_id_var);
");
// Movement
object_event_add
(argument0,ev_other,ev_user0,"
    local.spd = spd_base_var*spd_mult_var;
    if type_var
    {
        // I'll be honest, I have NO clue how we're gonna do pathfinding with these collision and movement system
    }
    else
    {
        
        local.yaw = point_direction(x,y,target_x_var,target_y_var);
        local.pitch = point_direction_3d_scr(x,y,z,target_x_var,target_y_var,target_z_var);
        if do_acc_var
        {
            acc_3d_scr(global.delta_time_var,acc_var,frick_var,local.yaw,local.pitch,local.spd);
            // Gimme a sec
        }
    }
");
// Animation
object_event_add
(argument0,ev_other,ev_user1,"
    switch(anim_type_var)
    {
        case 0: // Animate normally
        {
            spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod sprite_get_number(spr_var);
            break;
        }
        case 1: // End on last
        {
            spr_id_var = floor(sprite_get_number(spr_var)*(1-(alarm_arr[4,0]/alarm_arr[4,1])));
            break;
        }
        case 2: // End on first
        {
            spr_id_var = floor(sprite_get_number(spr_var)*alarm_arr[4,0]/alarm_arr[4,1]);
            break;
        }
    }
    tex_var = sprite_get_texture(spr_var,spr_id_var);
");
// Attack
object_event_add
(argument0,ev_other,ev_user3,"
    local.dead = true;
    with player_obj
    {
        if !dead_var && !hurt_var && !in_door_var && on_var
        {
            // p3dc_check_scr(coll_var[0],x,y,z,other.coll_var[0],other.x,other.y,other.z)
            if cyl_coll_scr(x,y,z,coll_var[2],coll_var[1],other.x,other.y,other.z,other.coll_var[2],other.coll_var[1])
            {
                if hp_var > other.dmg_var
                {
                    hp_var -= other.dmg_var;
                    set_alarm_scr(0,other.dmg_alarm_var);
                    hurt_target_var = other.id;
                    event_perform(ev_other,ev_user0);
                }
                else
                {
                    hp_var = 0;
                    dead_var = true;
                    do_coll_var = false;
                    grav_var = false;
                }
                attack_target_var = id;
                local.success = true;
            }
        }
        if !dead_var { local.dead = false; }
    }
    if local.success
    {
        if local.dead
        {
            global.dead_mon_var = object_index;
            instance_destroy();
            room_goto(dead_rm_var);
        }
        else { event_perform(ev_other,ev_user4); }
    }
");
// Attack Success
// Uses attack_target_var as an argument, usually the player.
object_event_add
(argument0,ev_other,ev_user4,"
    // Whatever
");
// Hurt
/*Weapons call this function when attacking
Weapons set hurt_weapon_var, hurt_target_var, hurt_power_var, and hurt_type_var, to use as arguments in this function
hurt_weapon_var: The weapon
hurt_target_var: Typically the player
hurt_power_var: Default is 1, functions more as a multiplier
hurt_type_var
    0: Default
    1: Spiritual
    2: Bullet
    3: Parry
*/
object_event_add
(argument0,ev_other,ev_user5,"
    hurt_var = true;
    set_alarm_scr(3,hurt_alarm_var);
    if violence_var > 0 { hurt_target_var.violence_var += violence_var; }
    // Reduce duration if very vulnerable
    if do_hurt_var == 2 || (do_hurt_var == 3 && hurt_type_var == 2)
    && dur_var > 0 && hurt_dur_var > 0
    {
        dur_var -= hurt_dur_var*hurt_power_var;
        if dur_var <= 0 { instance_destroy(); exit; }
    }
    // You can set this to higher values to have custom stun behavior
    if stun_var == 1 
    {
        set_motion_scr(0,true,yaw_var,false);
        move_var = false;
        anim_var = false;
        attack_var = false;
        set_alarm_scr(1,hurt_alarm_var);
        set_alarm_scr(2,hurt_alarm_var);
        set_alarm_scr(4,hurt_alarm_var);
    }
");
// Calculate Seen
object_event_add
(argument0,ev_other,ev_user6,"
    if instance_exists(target_var)
    {
        target_eye_yaw_var = target_var.eye_yaw_var;
        target_eye_pitch_var = target_var.eye_pitch_var;
        local.yaw = abs(angle_difference(point_direction(target_x_var,target_y_var,x,y),NPC_TARGET_DIR));
        local.pitch = abs(angle_difference(-point_direction(0,NPC_TARGET_LOOK_Z,point_distance(NPC_TARGET_X,NPC_TARGET_Y,x,y),NPC_Z+(NPC_H*5)),NPC_TARGET_ZDIR));
        if local.yaw <= seen_yaw_var && local.pitch <= seen_pitch_var
        { seen_var = true; seen_per_var = 1-max(local.yaw/seen_yaw_var,local.pitch/seen_pitch_var); }
        else { seen_var = false; seen_per_var = 0; }
    }
    else { seen_var = -1; seen_per_var = -1; }
");
// Determine target
object_event_add
(argument0,ev_other,ev_user7,"
    if type_var && enter_var
    {
        target_var = noone;
        target_x_var = global.spawn_arr[target_spawn_var,0];
        target_y_var = global.spawn_arr[target_spawn_var,1];
        target_z_var = global.spawn_arr[target_spawn_var,2];
    }
    else
    {
        target_var = instance_nearest(x,y,player_obj);
        target_x_var = target_var.x;
        target_y_var = target_var.y;
        target_z_var = target_var.z;
    }
");