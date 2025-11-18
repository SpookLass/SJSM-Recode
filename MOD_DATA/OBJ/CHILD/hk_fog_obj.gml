// Builtin Variables
object_set_depth(argument0,-97);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,"
    
	//create film parts
	Film_sys = part_system_create()

	Film_part1 = part_type_create();
	part_type_sprite(Film_part1,hk_obj.grain_spr_var,0,0,1);
	part_type_size(Film_part1,0.40,1.50,0,0);
	part_type_scale(Film_part1,1,1);
	part_type_blend(Film_part1,0);
	part_type_life(Film_part1,2,4);

	Film_part2 = part_type_create();
	part_type_shape(Film_part2,pt_shape_line);
	part_type_size(Film_part2,0.5,2,0,0);
	part_type_scale(Film_part2,100,0.50);
	part_type_color1(Film_part2,0);
	part_type_speed(Film_part2,0,4,0,2);
	part_type_direction(Film_part2,0,359,0,0);
	part_type_orientation(Film_part2,90,90,0,0,0);
	part_type_blend(Film_part2,0);
	part_type_life(Film_part2,6,50);

	Film_part3 = part_type_create();
	part_type_shape(Film_part3,pt_shape_smoke);
	part_type_size(Film_part3,0.50,2,0,0);
	part_type_scale(Film_part3,1.80,5);
	part_type_color1(Film_part3,0);
	part_type_blend(Film_part3,0);
	part_type_life(Film_part3,2,3);

	part_type_alpha1(Film_part1,0.60);
	part_type_alpha1(Film_part2,0.30);
	part_type_alpha1(Film_part3,0.20);

	Film_emit1 = part_emitter_create(Film_sys);
	part_emitter_region(Film_sys,Film_emit1,0,1280,0,720,ps_shape_rectangle,0);

	part_system_automatic_draw(Film_sys,false);
	part_system_automatic_update(Film_sys,false);
	
    alarm_len_var = 2;
	
	static_alpha_var = 0.025;
	
	wall_fog_start_var = 24;
	wall_fog_end_var = 64;
	wall_fog_count_var = 6;
	wall_fog_thickness_var = 0.12;
	
	fog_dist_var = 64;
	fog_shape_var = 0;
	
");
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,"
	
	part_system_update(Film_sys);
	part_type_alpha1(Film_part1,random_range(0.2,0.7));
	part_type_alpha1(Film_part2,random_range(0.2,0.7));
	part_type_alpha1(Film_part3,random_range(0.03,0.1));
	
");

// Alarm 0
object_event_add
(argument0,ev_alarm,0,"
    
	if !irandom(2) { part_emitter_burst(Film_sys,Film_emit1,Film_part2,random_range(0,1)); }

	set_alarm_scr(0,irandom_range(16,30));
	
");

// Alarm 1
object_event_add
(argument0,ev_alarm,1,"
    
	if !irandom(1) { part_emitter_burst(Film_sys,Film_emit1,Film_part1,random_range(0,2)); }
	if !irandom(1) { part_emitter_burst(Film_sys,Film_emit1,Film_part3,random_range(0,5)); }

	set_alarm_scr(1,irandom_range(6,12));
	
");


// Draw Event
object_event_add
(argument0,ev_draw,0,"
	
	if origin_var.my_type_var = 0
	{
	with door_obj
		{
			d3d_set_fog(false,c_black,0,1);
			draw_set_color(c_white);
			
			event_perform(ev_draw,0);
			
			d3d_transform_set_identity();
		
			d3d_transform_add_rotation_z(direction);
			d3d_transform_add_translation(x,y,z);
			
			d3d_model_draw(other.origin_var.lamp_mdl_var,0,0,0,background_get_texture(other.origin_var.lamp_texture_var));
			
			d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
		}
	}
	
	d3d_transform_set_identity();
	d3d_transform_add_rotation_z(global.cam_yaw_var[view_current]);
	d3d_transform_add_translation(global.cam_x_var[view_current],global.cam_y_var[view_current],global.cam_z_var[view_current]);  
	draw_set_alpha(wall_fog_thickness_var*(6/wall_fog_count_var));
	draw_set_color(make_color_rgb(0,107,168));
	
	local.wall_count = 0;
	local.wall_dist = wall_fog_end_var;
	
	repeat(wall_fog_count_var)
	{
	local.wall_dist = wall_fog_end_var - local.wall_count * ((wall_fog_end_var - wall_fog_start_var)/(max(wall_fog_count_var-1,1)));
	
	if fog_shape_var = 0
	{
		d3d_draw_wall(local.wall_dist,-200,-200,local.wall_dist,+200,200,white_bg_tex,1,1);
	}
	else
	{
		d3d_draw_cylinder(-1*local.wall_dist,-1*local.wall_dist,-200,local.wall_dist,local.wall_dist,200,white_bg_tex,1,1,false,24);
	}
	
	
	local.wall_count += 1;
	}
	
	draw_set_alpha(1);
	draw_set_color(c_white);
	
	
	d3d_transform_set_identity();
	
	
    d3d_set_projection_ortho
    (
        view_xview[view_current],
        view_yview[view_current],
        view_xview[view_current]+view_wview[view_current],
        view_yview[view_current]+view_hview[view_current],
        0
    );
    d3d_set_hidden(false);
	
	part_system_drawit(Film_sys);
	
	draw_set_blend_mode(bm_add)
	draw_sprite_tiled_ext(static_01_spr,0,random_range(-256,256),random_range(-256,256),2,2,c_white,static_alpha_var); 

	draw_sprite_tiled_ext(static_01_spr,0,random(512),random(512),2,2,c_white,origin_var.look_static_alpha_var*0.16);
	draw_set_blend_mode(bm_normal);
	
    d3d_set_hidden(true);
");

// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,"


	with (fog_par_obj) { instance_destroy(); }

	with instance_create(0,0,fog_par_obj)
	{
	fog_var = true;
	fog_color_var = c_black;
	fog_start_var = 2;
	fog_end_var = other.fog_dist_var;
	fog_dark_var = true;
	event_user(0);
	}

set_alarm_scr(0,irandom_range(16,30));
set_alarm_scr(1,irandom_range(6,12));
"
);