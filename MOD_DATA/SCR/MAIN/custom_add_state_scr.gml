/*
Argument 0: Name
Argument 1: Translate
Argument 2: Previous State (-1 for none)
Returns state.
*/
// Main
custom_state_arr[global.custom_state_len_var,0] = argument0; // Name
custom_state_arr[global.custom_state_len_var,1] = argument1; // Translate
custom_state_arr[global.custom_state_len_var,2] = argument2; // Previous State (None)
global.custom_state_len_var += 1;
return global.custom_state_len_var-1;