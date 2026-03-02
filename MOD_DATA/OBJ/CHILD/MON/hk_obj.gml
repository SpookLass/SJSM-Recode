// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,echidna_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,1,'
    ini_open(global.lang_var);
    name_var = translate_mon_str_scr("hk",global.name_var);
	loop_snd_var[2] = string_replace(ini_read_string("SUB","hk","SUB_hk"),"@n",name_var); loop_snd_var[3] = false;
	hurt_snd_var[2] = string_replace(ini_read_string("SUB","hk_hurt","SUB_hk_hurt"),"@n",name_var); hurt_snd_var[3] = false;
	snd_arr[0,1] = string_replace(ini_read_string("SUB","hk_breath","SUB_hk_breath"),"@n",name_var); snd_arr[0,2] = false;
    ini_close();
    type_var = 0;
    spd_base_var = 1;
	accel_var = 0;
	color_var = false;
    spr_spd_var = 1/3;
    dur_var = irandom_range(7,23);
    delay_var = 0;
    dmg_var = 20;
    dmg_alarm_var = 10;
    z_off_var = -1.5;
	blood_spr_var = blood_kh_spr;
    // Assets
        // Search for existing assets to save memory
	local.loaded = false;
    with object_index
    {
        if id != other.id && object_index == other.object_index
        {
            other.spr_var = spr_var;
			other.static_bg_var = static_bg_var;
			other.overlay_bg_var = overlay_bg_var;
            
			other.snd_arr[0,0] = snd_arr[0,0];
			other.loop_snd_var[1] = loop_snd_var[1];
			other.look_snd_var = look_snd_var;
			other.hurt_snd_var[1] = hurt_snd_var[1];
			other.mus_snd_var = mus_snd_var;
			
			other.lamp_mdl_var = lamp_mdl_var
			other.lamp_texture_var = lamp_texture_var;
			
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        spr_var = sprite_add(dh_directory_const+"\TEX\sprites\HK_SPR2.png",20,false,false,0,0);
		static_bg_var = background_add(main_directory_const+"\BG\DH\tile_static_bg.png",false,false);
		overlay_bg_var = background_add(main_directory_const+"\BG\KH\olga_bg.png",false,false);

		snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\hk_breath_snd.wav",true);
		loop_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\hk_loop_02_snd.wav",true);
		look_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\hk_loop_01_snd.wav",true);
		mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\hk_mus_snd.mp3");
		fmod_snd_set_group_scr(mus_snd_var,snd_group_mus_const);
		hurt_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\doll_hurt_snd.wav",true);
		
		lamp_mdl_var = d3d_model_create();
        d3d_model_load(lamp_mdl_var,main_directory_const+"\MDL\MON\hk_lamp_mdl.gmmod");
        lamp_bg_var = background_add(dh_directory_const+"\TEX\DOLL\DOOR_02.png",false,false);
    }
	tex_var = sprite_get_texture(spr_var,0);
	fmod_snd_set_minmax_dist_scr(look_snd_var,40,240);
    fmod_snd_set_group_scr(look_snd_var,snd_group_mon_const);
	fmod_snd_set_max_vol_scr(mus_snd_var,1.8);
    // Sounds
	loop_snd_var[0] = true;
	do_snd_var = true;
    snd_len_var = 1;
    snd_num_var = 1;
    snd_den_var = 1;
	snd_dist_min_var = 8000;
    snd_dist_max_var = 9000;
	mus_prio_var = theme_mus_prio_const;
	loop_snd_dist_min_var = 39.2;
	loop_snd_dist_max_var = 235.2;
    // Hurt
    do_hurt_var = true;
	hurt_dist_var = 2;
	hurt_alarm_var = 3;
    hurt_snd_var = 4;
    // Special
	base_w_var = 27;
	base_h_var = 27;
	shake_var = 0.36;
	// Seen
	do_seen_var = true;
	seen_yaw_var = 40.5;
	seen_dist_var = 96;
	spd_min_var = 0.4;
	spd_max_var = 1.075;
	shake_var = 0.36;
	do_seen_agg_var = false;
	seen_agg_var = 0;
	seen_rate_var = 0.02;
	static_alpha_var = 0;
	static_min_var = 0.064;
	static_max_var = 0.172;
	spd_anim_var = false;
	spr_spd_min_var = spr_spd_var;
	spr_spd_max_var = spr_spd_var;
	do_look_snd_var = false;
	look_inst_var = noone;
	// Effects
	eff_color_var = make_color_rgb(97,97,106);
	fog_end_var = 64;
	do_fog_var = true;
	fog_type_var = 0;
	wall_num_var = 6;
	wall_alpha_var = 0.12;
	wall_start_var = 24;
	wall_end_var = 64;
	fog_color_var = make_color_rgb(0,107,168);
	door_var = false;
	color_prio_var = 2;
    fog_prio_var = 2;
	// Teleport
	tp_type_var = 1;
	tp_alarm_min_var = 600;
	tp_alarm_max_var = 1000;
	tp_dist_min_var = 2;
	tp_dist_max_var = 196;
		// Tries before giving up. In code it was 50, but it gives up past 30? Also, OG technically never gives up
	tp_attempt_var = 30; 
	// Near damage
	dmg_dist_min_var = 0.2;
	dmg_dist_max_var = 18;
	dmg_rate_var = 0.7; // 7/180 to 3.5
	// Behavior
	if global.hk_type_var == -1 { local.type = irandom(2); }
    else { local.type = global.hk_type_var; }
    switch local.type
    {
		case 0:
		{
			color_var = 3;
			do_look_snd_var = true;
			spd_anim_var = true;
			eff_color_var = make_color_rgb(211,77,98); // 110 45 60
			fog_type_var = 1;
			fog_end_var = 72;
			door_var = true;
			dur_var = irandom_range(10,20);
			// Seen
			seen_pitch_var = 40.5;
			seen_dist_var = 128;
			spd_min_var = 0.5;
			spd_max_var = 1.2;
			spr_spd_min_var = 0.125;
			spr_spd_max_var = 0.5;
			// Get away
			hurt_dist_var = 16;
			// Teleport
			tp_type_var = 2;
			tp_dist_min_var = 96;
			break;
		}
		case 2:
        {
			// Render
			fog_end_var = 256/3;
			image_blend = make_color_rgb(82,0,253); // 82 0 253 background, 255 92 92 hilight, 164 0 252 overlay
			eff_color_var = make_color_rgb(182,182,182);
			base_w_var = 30;
			base_h_var = 30;
			z_off_var = 1;
			// Seen
			shake_var = 0;
			seen_yaw_var = 22.5;
			spd_min_var = 16/45;
			spd_max_var = 56/45; // 8/9?
			// Teleport
			tp_type_var = 1;
			tp_alarm_min_var = 600;
			tp_alarm_max_var = 1200;
			tp_dist_min_var = 128/3;
			tp_dist_max_var = 320/3;
			// Damage
			dmg_dist_min_var = 64/15;
			dmg_dist_max_var = 64/3;
			dmg_rate_var = 16/45; // 64/3
            break;
        }
		case 3:
        {
			// Effects
			eff_color_var = make_color_rgb(65,40,50);
			fog_num_var = 8;
			fog_end_var = 75;
			wall_alpha_var = 0.09;
			wall_start_var = 26;
			wall_end_var = 72;
			door_var = true;
			// Render
			base_w_var = 29;
			base_h_var = 29;
			z_off_var = -0.5;
			shake_var = 0.4;
			// Seen
			seen_dist_var = 128;
			do_seen_agg_var = true;
			static_min_var = 0.08;
			static_max_var = 0.188;
			spd_min_var = 0.5;
			spd_max_var = 1.175;
			spd_anim_var = true;
			spr_spd_min_var = 0.275;
			spr_spd_max_var = 0.5;
			// Breath?
			snd_alarm_min_var = 180;
    		snd_alarm_max_var = 1200;
			// Teleport
			tp_type_var = 0;
			tp_alarm_min_var = 420;
			tp_alarm_max_var = 600;
			tp_dist_min_var = 160;
			tp_dist_max_var = 400;
            break;
        }
    }
	if do_look_snd_var
	{
		look_inst_var = fmod_snd_3d_loop_scr(look_snd_var);
		fmod_inst_set_vol_scr(look_inst_var,0);
	}
	w_var = base_w_var;
	h_var = base_h_var;
	alarm_len_var = 9;
	alarm_ini_scr();
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
	if instance_exists(target_var) && target_dist_var < dmg_dist_max_var && target_dist_var > dmg_dist_min_var
	{
		local.dmg = dmg_rate_var/target_dist_var;
		target_var.hp_var -= local.dmg*global.delta_time_var;
	}
	if is_seen_var == 1
	{
		w_var = base_w_var + random_range(-shake_var,shake_var);
		h_var = base_h_var + random_range(-shake_var,shake_var);
		spd_mult_var = lerp_scr(spd_min_var,spd_max_var,seen_per_var);
		if do_seen_agg_var
		{
			fmod_inst_set_vol_scr(look_inst_var,min(fmod_inst_get_vol_scr(look_inst_var)+(0.05*global.delta_time_var),1));
			seen_agg_var = median(0,1,seen_agg_var+(seen_rate_var*global.delta_time_var));
			spd_mult_var += seen_agg_var;
		}
		else if do_look_snd_var { fmod_inst_set_vol_scr(look_inst_var,seen_per_var); }
		if spd_anim_var { spr_spd_var = lerp_scr(spr_spd_min_var,spr_spd_max_var,seen_per_var); }
		anim_var = true;
		static_alpha_var = lerp_scr(static_min_var,static_max_var,seen_per_var);
		// I still gotta add the teleport lol
	}
	else
	{
		w_var = base_w_var;
		h_var = base_h_var;
		if do_seen_agg_var && seen_agg_var > 0
		{
			seen_agg_var = 0;
			fmod_inst_set_vol_scr(look_inst_var,0);
		}
		spd_mult_var = 0;
		anim_var = false;
		static_alpha_var = 0;
	}
	event_inherited();
	if do_look_snd_var
	{ fmod_inst_set_3d_pos_scr(look_inst_var,x,y,z); }
');
// Teleport Alarm
object_event_add
(argument0,ev_alarm,8,'
	event_user(15);
	set_alarm_scr(8,irandom_range(tp_alarm_min_var,tp_alarm_max_var));
');
// Attack Event
object_event_add
(argument0,ev_other,ev_user2,'
	if is_seen_var == 1 { event_inherited(); }
');
// Attack Success
object_event_add
(argument0,ev_other,ev_user3,'
	event_inherited();
	event_perform(ev_alarm,8);
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
	local.bool = false;
    with object_index { if id != other.id && object_index == other.object_index { local.bool = true; break; }}
    if !local.bool
    {
		sprite_delete(spr_var);
		background_delete(static_bg_var);
		background_delete(overlay_bg_var);
		fmod_snd_free_scr(mus_snd_var);
		fmod_snd_free_scr(snd_arr[0,0]);
		fmod_snd_free_scr(loop_snd_var[1]);
		fmod_snd_free_scr(look_snd_var);
		d3d_model_destroy(lamp_mdl_var);
		background_delete(lamp_bg_var);
	}
	with kh_fog_obj { if par_var == other.id { instance_destroy(); }}
	with kh_overlay_obj { if par_var == other.id { instance_destroy(); }}
	with hk_eff_obj { if par_var == other.id { instance_destroy(); }}
	with dh_eff_obj { if par_var == other.id { instance_destroy(); }}
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
	with color_par_obj { if prio_var < other.color_prio_var { instance_destroy(); }}
	if !instance_exists(color_par_obj)
	{
		with instance_create(0,0,color_par_obj)
		{
			prio_var = other.color_prio_var
			image_blend = other.eff_color_var;
			event_user(0);
		}
	}
	with fog_par_obj { if prio_var < other.fog_prio_var { instance_destroy(); }}
	if !instance_exists(fog_par_obj)
	{
		with instance_create(0,0,fog_par_obj)
		{
			prio_var = other.fog_prio_var;
			par_var = other.id;
			fog_var = true;
			fog_color_var = c_black;//other.fog_color_var;
			fog_start_var = 0;
			fog_end_var = other.fog_end_var;
			fog_dark_var = true;
			event_user(0);
		}
	}
	if !instance_exists(kh_fog_obj)
	{
		with instance_create(0,0,kh_fog_obj)
		{
			prio_var = other.fog_prio_var;
			par_var = other.id;
			fog_type_var = other.fog_type_var
			image_blend = other.fog_color_var;
			image_alpha = other.wall_alpha_var;
			wall_num_var = other.wall_num_var;
			wall_start_var = other.wall_start_var;
			wall_end_var = other.wall_end_var;
		}
	}
	if !instance_exists(kh_overlay_obj)
	{
		with instance_create(0,0,kh_overlay_obj)
		{
			par_var = other.id;
			overlay_bg_var = other.overlay_bg_var;
			overlay_var = true;
			overlay_alpha_var = 0.35;
			rand_var = true;
			spr_spd_var = 0;
			image_xscale = 256;
			image_yscale = 256;
			image_alpha = 0.05;
		}
	}
	if !instance_exists(hk_eff_obj)
	{
		with instance_create(0,0,hk_eff_obj)
		{
			par_var = other.id;
			bg_var = other.static_bg_var;
		}
	}
	if !instance_exists(dh_eff_obj)
	{
		with instance_create(0,0,dh_eff_obj)
		{ par_var = other.id; }
	}
	if !instance_exists(hk_door_obj)
	{
		local.par = id;
		with door_obj
		{
			local.door = id;
			with instance_create(x,y,hk_door_obj)
			{
				par_var = local.par;
				z = local.door.z;
				direction = local.door.direction;
				mdl_02_var = local.par.lamp_mdl_var;
				store_tex_02_var = background_get_texture(local.par.lamp_bg_var);
				tex_02_var = store_tex_02_var;
			}
			local.flr = instance_nearest(x,y,floor_par_obj);
			if local.flr.tex_var == -1 && !instance_position(local.flr.x,local.flr.y,light_floor_par_obj)
			{
				with instance_create(local.flr.x,local.flr.y,light_floor_par_obj)
				{
					z = local.flr.z;
					direction = local.flr.direction;
					if global.color_var < 1
    				{ image_blend = color_par_obj.light_color_var; }
				}
			}
			instance_destroy();
		}
	}
	event_perform(ev_alarm,8);
');

// Teleport
object_event_add
(argument0,ev_other,ev_user15,'
	switch tp_type_var
    {
		case 0:
        {
			yaw_var = global.spawn_arr[0,3];
			x = global.spawn_arr[0,0]-lengthdir_x(32,yaw_var);
			y = global.spawn_arr[0,1]-lengthdir_y(32,yaw_var);
			z = global.spawn_arr[0,2];
			for (local.i=0; local.i<tp_attempt_var; local.i+=1;)
			{
				local.flr = instance_find(floor_par_obj,irandom(instance_number(floor_par_obj)-1));
				local.xtmp = local.flr.x+random_range(-local.flr.w_var/2,local.flr.w_var/2);
				local.ytmp = local.flr.y+random_range(-local.flr.h_var/2,local.flr.h_var/2);
				local.ztmp = local.flr.z;
				local.dist = tp_dist_max_var;
				with player_obj { local.dist = min(local.dist,point_distance_3d_scr(local.xtmp,local.ytmp,local.ztmp,x,y,z));}
				if local.dist >= tp_dist_min_var && local.dist <= tp_dist_max_var
				{
					x = local.xtmp;
					y = local.ytmp;
					z = local.ztmp;
					exit;
				}
			}
            break;
        }
		case 1:
        {
			yaw_var = global.spawn_arr[0,3];
			x = global.spawn_arr[0,0]-lengthdir_x(32,yaw_var);
			y = global.spawn_arr[0,1]-lengthdir_y(32,yaw_var);
			z = global.spawn_arr[0,2];
			if global.mark_len_var > 0
			{
				for (local.i=0; local.i<tp_attempt_var; local.i+=1;)
				{
					local.mark_choice = irandom(global.mark_len_var-1);
					local.xtmp = global.mark_arr[local.mark_choice,0];
					local.ytmp = global.mark_arr[local.mark_choice,1];
					local.ztmp = global.mark_arr[local.mark_choice,2];
					local.dist = tp_dist_max_var;
					with player_obj { local.dist = min(local.dist,point_distance_3d_scr(local.xtmp,local.ytmp,local.ztmp,x,y,z));}
					if local.dist >= tp_dist_min_var && local.dist <= tp_dist_max_var
					{
						x = local.xtmp;
						y = local.ytmp;
						z = local.ztmp;
						exit;
					}
				}
			}
        }
		case 2:
        {
			local.dir = random(360);
			local.dist = random_range(tp_dist_min_var,tp_dist_max_var);
			x = target_x_var+lengthdir_x(local.dist,local.dir);
			y = target_y_var+lengthdir_y(local.dist,local.dir);
            break;
        }
	}
');