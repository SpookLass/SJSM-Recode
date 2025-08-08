/*
Argument 0: Acceleration
Argument 1: Friction
Argument 2: Forward Direction (1 is Forward, -1 is Back)
Argument 3: Side Direction (Not entirely sure lol)
Argument 4: Forward Clamp
Argument 5: Side Clamp
Argument 6: Yaw
*/
// Forward
if argument2 != 0 && argument4 > 0 && for_spd_var <= argument4
{ for_spd_var = median(-argument4,argument4,for_spd_var+(argument0*argument2)); }
else { for_spd_var = max(0,for_spd_var-argument1); }
// Side
if argument3 != 0 && argument5 > 0 && side_spd_var <= argument5
{ side_spd_var = median(-argument5,argument5,side_spd_var+(argument0*argument3)); }
else { side_spd_var = max(0,side_spd_var-argument1); }
// This sucks and I'm killing you
execute_file(set_motion_odd_scr,for_spd_var,false,side_spd_var,false,argument6,true);