/*
Argument 0: Name
Argument 1: Translate
Argument 2: Previous State (-1 for none)
Returns state.
*/
// Main
set_state_arr[global.set_state_len_var,0] = argument0; // Name
set_state_arr[global.set_state_len_var,1] = argument1; // Translate
set_state_arr[global.set_state_len_var,2] = argument2; // Previous State (None)
global.set_state_len_var += 1;
return global.set_state_len_var-1;