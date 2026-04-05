/*
Argument 0: Day
Argument 1: Month
Argument 2: Year
Returns true if today is Easter.
*/
local.metonic = argument2 mod 19;
local.century = floor(argument2 / 100);
local.c = argument2 mod 100;
local.d = floor(local.century / 4);
local.e = local.century mod 4;
local.f = floor((local.century + 8) / 25);
local.g = floor((local.century - local.f + 1) / 3);
local.h = (19 * local.metonic + local.century - local.d - local.g + 15) mod 30;
local.i = floor(local.c / 4);
local.k = local.c mod 4;
local.l = (32 + 2 * local.e + 2 * local.i - local.h - local.k) mod 7;
local.m = floor((local.metonic + 11 * local.h + 22 * local.l) / 451);
local.month = floor((local.h + local.l - 7 * local.m + 114) / 31);
local.day = ((local.h + local.l - 7 * local.m + 114) mod 31) + 1;

return argument0 == local.day && argument1 == local.month;
/*
local.metonic = argument2 mod 19; // A
local.leap = argument2 mod 4; // B
local.week = argument2 mod 7; // C
local.century = floor(argument2/100); // P
local.idk = (13+8*local.century)/25; // Q
local.iadk = (15-local.idk+local.century-(local.century*0.25)) mod 30; // M
local.leapday = (4+local.century-(local.century*0.25)) mod 7; // N
local.add = (19*local.metonic + local.iadk) mod 30; // D
local.easter = (local.leapday + 2*local.leap + 4*local.week + 6*local.add) mod 7;
*/