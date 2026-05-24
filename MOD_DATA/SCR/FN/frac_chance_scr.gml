/*
Argument 0: Numerator
Argument 1: Denominator
Returns a boolean based on the fraction given (1/4 will return true 1 out of 4 times)
*/
if argument0 <= 0 || argument1 <= 0 { return false; }
else { return irandom(argument1-1) < argument0; }