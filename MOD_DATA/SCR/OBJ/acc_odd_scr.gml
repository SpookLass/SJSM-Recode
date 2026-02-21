/*
Argument 0: Delta Time (1 if not used)
Argument 1: Acceleration
Argument 2: Friction
Argument 3: Forward Direction (1 is Forward, -1 is Back)
Argument 4: Side Direction (Not entirely sure lol)
Argument 5: Forward Clamp
Argument 6: Side Clamp
Argument 7: Yaw
*/
// Forward
if argument3 != 0 && argument5 > 0 && for_spd_var <= argument5
{ for_spd_var = median(-argument5,argument5,for_spd_var+(argument0*argument1*argument3)); }
else { for_spd_var = max(0,for_spd_var-(argument0*argument2)); }
// Side
if argument4 != 0 && argument6 > 0 && side_spd_var <= argument6
{ side_spd_var = median(-argument6,argument6,side_spd_var+(argument0*argument1*argument4)); }
else { side_spd_var = max(0,side_spd_var-(argument0*argument2)); }
// This sucks and I'm killing you
set_motion_odd_scr(for_spd_var,false,side_spd_var,false,argument7,true);