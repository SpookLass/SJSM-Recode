// Initialize 3D functions
p3dc_ini_scr();
// Room (load bearing???)
global.room_coll = p3dc_begin_mdl_scr();
p3dc_end_mdl_scr();
p3dc_split_mdl_scr(global.room_coll,1280,736,40,23,6);
global.room_player_coll = -1;
global.room_mon_coll = -1;
global.room_float_coll = -1;
// Player
global.player_coll[1] = 18;
global.player_coll[2] = 8;
local.radius = global.player_coll[2]/2;
global.player_coll[0] = p3dc_begin_mdl_scr();
p3dc_add_cylinder_scr(-local.radius,-local.radius,global.player_coll[1]-0.01,local.radius,local.radius,0,true,8);
p3dc_end_mdl_scr();
// Crouch
global.player_crouch_coll[1] = 12;
global.player_crouch_coll[2] = 8;
local.radius = global.player_crouch_coll[2]/2;
global.player_crouch_coll[0] = p3dc_begin_mdl_scr();
p3dc_add_cylinder_scr(-local.radius,-local.radius,global.player_crouch_coll[1]-0.01,local.radius,local.radius,0,true,8);
p3dc_end_mdl_scr();
// Trigger
global.trig_coll[1] = 20;
global.trig_coll[2] = 16;
local.radius = global.trig_coll[2]/2;
global.trig_coll[0] = p3dc_begin_mdl_scr();
p3dc_add_block_scr(-local.radius,-local.radius,global.trig_coll[1],local.radius,local.radius,0,true,8);
p3dc_end_mdl_scr();
// Jumpscare trigger
global.js_trig_coll[1] = 32;
global.js_trig_coll[2] = 96;
global.js_trig_coll[3] = 32;
local.radius_z = global.js_trig_coll[1]/2;
local.radius_x = global.js_trig_coll[2]/2;
local.radius_y = global.js_trig_coll[3]/2;
global.js_trig_coll[0] = p3dc_begin_mdl_scr();
p3dc_add_cylinder_scr(-local.radius_x,-local.radius_y,-local.radius_z,local.radius_x,local.radius_y,local.radius_z,true,8);
p3dc_end_mdl_scr();
// Monster
global.mon_coll[1] = 18;
global.mon_coll[2] = 8;
local.radius = global.mon_coll[2]/2;
global.mon_coll[0] = p3dc_begin_mdl_scr();
p3dc_add_cylinder_scr(-local.radius,-local.radius,global.mon_coll[1]-0.01,local.radius,local.radius,0,true,8);
p3dc_end_mdl_scr();
// Wide Monster
global.mon_wide_coll[1] = 18;
global.mon_wide_coll[2] = 16;
local.radius = global.mon_wide_coll[2]/2;
global.mon_wide_coll[0] = p3dc_begin_mdl_scr();
p3dc_add_cylinder_scr(-local.radius,-local.radius,global.mon_wide_coll[1]-0.01,local.radius,local.radius,0,true,8);
p3dc_end_mdl_scr();
// Short Monster
global.mon_short_coll[1] = 9;
global.mon_short_coll[2] = 8;
local.radius = global.mon_short_coll[2]/2;
global.mon_short_coll[0] = p3dc_begin_mdl_scr();
p3dc_add_cylinder_scr(-local.radius,-local.radius,global.mon_short_coll[1]-0.01,local.radius,local.radius,0,true,8);
p3dc_end_mdl_scr();
// Slime Trigger
global.slime_trig_coll[1] = 4;
global.slime_trig_coll[2] = 24;
local.radius = global.slime_trig_coll[2]/2;
global.slime_trig_coll[0] = p3dc_begin_mdl_scr();
p3dc_add_cylinder_scr(-local.radius,-local.radius,global.slime_trig_coll[1],local.radius,local.radius,0,true,8);
p3dc_end_mdl_scr();
// Axe
global.axe_coll[1] = 12; // 18?
global.axe_coll[2] = 48; // 64?
global.axe_coll[3] = 12; // 18?
local.radius_z = global.axe_coll[1]/2;
local.radius_x = global.axe_coll[2]/2;
local.radius_y = global.axe_coll[3]/2;
global.axe_coll[0] = p3dc_begin_mdl_scr();
p3dc_add_cylinder_scr(-local.radius_x,-local.radius_y,-local.radius_z,local.radius_x,local.radius_y,local.radius_z,true,8);
p3dc_end_mdl_scr();
// Grids
global.rm_size_var = 1280;
global.grid_snap_var = 4;
global.phys_grid = mp_grid_create(0,0,global.rm_size_var/global.grid_snap_var,global.rm_size_var/global.grid_snap_var,global.grid_snap_var,global.grid_snap_var);
global.float_grid = mp_grid_create(0,0,global.rm_size_var/global.grid_snap_var,global.rm_size_var/global.grid_snap_var,global.grid_snap_var,global.grid_snap_var);