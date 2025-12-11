/*
Argument 0: Key or Button
Original by m1s3ry on Reddit
*/
switch(argument0)
{
    case -16:               return "XBOX BUTTON";
    case -13:               return "START BUTTON";
    case -12:               return "SELECT BUTTON";
    case -11:               return "RIGHT BUTTON";
    case -10:               return "LEFT BUTTON";
    case -9:                return "Y BUTTON";
    case -8:                return "X BUTTON";
    case -7:                return "B BUTTON";
    case -6:                return "A BUTTON";
    case -mb_middle:        return "MIDDLE-MOUSE";
    case -mb_right:         return "R-MOUSE";
    case -mb_left:          return "L-MOUSE";
    case vk_space:			return "SPACE";
    case vk_left:			return "LEFT";		
    case vk_right:			return "RIGHT";		
    case vk_up:				return "UP";
    case vk_down:			return "DOWN";
    case vk_add:			return "PLUS";
    case vk_alt:			return "ALT";
    case vk_backspace:		return "BACKSPACE";
    case vk_control:		return "CTRL";
    case vk_decimal:		return "CARET";
    case vk_delete:			return "DELETE";
    case vk_divide:			return "SLASH";
    case vk_end:			return "END";
    case vk_enter:			return "ENTER";
    case vk_escape:			return "ESCAPE";
    case vk_f1:				return "F1";
    case vk_f2:				return "F2";
    case vk_f3:				return "F3";
    case vk_f4:				return "F4";
    case vk_f5:				return "F5";
    case vk_f6:				return "F6";
    case vk_f7:				return "F7";
    case vk_f8:				return "F8";
    case vk_f9:				return "F9";
    case vk_f10:			return "F10";
    case vk_f11:			return "F11";
    case vk_f12:			return "F12";
    case vk_home:			return "HOME";
    case vk_insert:			return "INSERT";
    case vk_lalt:			return "L-ALT";
    case vk_lcontrol:		return "L-CTRL";
    case vk_lshift:			return "L-SHIFT";
    case vk_multiply:		return "ASTERISK";
    case vk_numpad0:		return "NUM 0";
    case vk_numpad1:		return "NUM 1";
    case vk_numpad2:		return "NUM 2";
    case vk_numpad3:		return "NUM 3";
    case vk_numpad4:		return "NUM 4";
    case vk_numpad5:		return "NUM 5";
    case vk_numpad6:		return "NUM 6";
    case vk_numpad7:		return "NUM 7";
    case vk_numpad8:		return "NUM 8";
    case vk_numpad9:		return "NUM 9";
    case vk_pagedown:		return "PAGE DOWN";
    case vk_pageup:			return "PAGE UP";
    case vk_pause:			return "PAUSE";
    case vk_printscreen:	return "PRT SCR";
    case vk_ralt:			return "R-ALT";
    case vk_rcontrol:		return "R-CTRL";
    case vk_rshift:			return "R-SHIFT";
    case vk_shift:		    return "SHIFT";
    case vk_subtract:		return "MINUS";
    case vk_tab:			return "TAB";
    case 22:				return "CAPS LOCK";
    case 91:				return "WIN KEY";
    case 0:                 return "N/A";
    default:                return chr(argument0);
}