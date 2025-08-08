/*
Argument 0: Yaw (Direction)
Argument 1: Pitch (Z Direction)
Argument 2: X
Argument 3: Y
Argument 4: Z
Argument 5: Target X
Argument 6: Target Y
Argument 7: Target Z
Argument 8: Turn rate
Argument 9: Return type
*/
return script_execute(
    global.turn_3d_scr,
    argument0,
    argument1,
    point_direction(argument2,argument3,argument5,argument6), // Finding target yaw
    execute_file(global.point_direction_3d_scr,argument2,argument3,argument4,argument5,argument6.argument7), // Finding target pitch
    argument8,
    argument9);