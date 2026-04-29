/*
Argument 0: Name
Argument 1: Translate
Argument 2: Whether Monster Chases
Argument 3: Group
Argument 4: Object
Argument 5: Locale
Argument 6: CAT-DOS Object
Argument 7: WIKI Object
Used to add monsters to the chase pool and CAT-DOS.
This is required for your custom specimen to spawn.
Returns Monster ID
*/
mon_arr[global.mon_len_var,0] = argument0; // Name
mon_arr[global.mon_len_var,1] = argument1; // Translate
mon_arr[global.mon_len_var,2] = argument2; // Chases
mon_arr[global.mon_len_var,3] = argument3; // Group
mon_arr[global.mon_len_var,4] = argument4; // Object
mon_arr[global.mon_len_var,5] = argument5; // Locale
mon_arr[global.mon_len_var,6] = argument6; // CAT-DOS Object
mon_arr[global.mon_len_var,7] = argument7; // WIKI Object
mon_arr[global.mon_len_var,8] = 0; // Max behaviors
global.mon_len_var += 1;
return global.mon_len_var-1;