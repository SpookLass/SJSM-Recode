// Initialize 3D functions
p3dc_ini_scr();
// Room (load bearing???)
global.room_coll = p3dc_begin_mdl_scr();
p3dc_end_mdl_scr();
p3dc_split_mdl_scr(global.room_coll,1280,736,40,23,6);
// Player
global.player_coll[1] = 18;
global.player_coll[2] = 6;
local.radius = global.player_coll[2]/2;
global.player_coll[0] = p3dc_begin_mdl_scr();
p3dc_add_cylinder_scr(-local.radius,-local.radius,global.player_coll[1]-0.01,local.radius,local.radius,0,true,8);
p3dc_end_mdl_scr();
// Crouch
global.player_crouch_coll[1] = 12;
global.player_crouch_coll[2] = 6;
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
// Monster
global.mon_coll[1] = 18;
global.mon_coll[2] = 6;
local.radius = global.mon_coll[2]/2;
global.mon_coll[0] = p3dc_begin_mdl_scr();
p3dc_add_cylinder_scr(-local.radius,-local.radius,global.mon_coll[1]-0.01,local.radius,local.radius,0,true,8);
p3dc_end_mdl_scr();