extends Resource
class_name KeybindEntry

const JOY_BTN_NAMES = {
	
}

enum Keys {
	KEY_ESCAPE = 16777217,
	KEY_TAB = 16777218,
	KEY_BACKTAB = 16777219,
	KEY_BACKSPACE = 16777220,
	KEY_ENTER = 16777221,
	KEY_KP_ENTER = 16777222,
	KEY_INSERT = 16777223,
	KEY_DELETE = 16777224,
	KEY_PAUSE = 16777225,
	KEY_PRINT = 16777226,
	KEY_SYSREQ = 16777227,
	KEY_CLEAR = 16777228,
	KEY_HOME = 16777229,
	KEY_END = 16777230,
	KEY_LEFT = 16777231,
	KEY_UP = 16777232,
	KEY_RIGHT = 16777233,
	KEY_DOWN = 16777234,
	KEY_PAGEUP = 16777235,
	KEY_PAGEDOWN = 16777236,
	KEY_SHIFT = 16777237,
	KEY_CTRL = 16777238,
	KEY_META = 16777239,
	KEY_ALT = 16777240,
	KEY_CAPSLOCK = 16777241,
	KEY_NUMLOCK = 16777242,
	KEY_SCROLLLOCK = 16777243,
	KEY_F1 = 16777244,
	KEY_F2 = 16777245,
	KEY_F3 = 16777246,
	KEY_F4 = 16777247,
	KEY_F5 = 16777248,
	KEY_F6 = 16777249,
	KEY_F7 = 16777250,
	KEY_F8 = 16777251,
	KEY_F9 = 16777252,
	KEY_F10 = 16777253,
	KEY_F11 = 16777254,
	KEY_F12 = 16777255,
	KEY_F13 = 16777256,
	KEY_F14 = 16777257,
	KEY_F15 = 16777258,
	KEY_F16 = 16777259,
	KEY_KP_MULTIPLY = 16777345,
	KEY_KP_DIVIDE = 16777346,
	KEY_KP_SUBTRACT = 16777347,
	KEY_KP_PERIOD = 16777348,
	KEY_KP_ADD = 16777349,
	KEY_KP_0 = 16777350,
	KEY_KP_1 = 16777351,
	KEY_KP_2 = 16777352,
	KEY_KP_3 = 16777353,
	KEY_KP_4 = 16777354,
	KEY_KP_5 = 16777355,
	KEY_KP_6 = 16777356,
	KEY_KP_7 = 16777357,
	KEY_KP_8 = 16777358,
	KEY_KP_9 = 16777359,
	KEY_SUPER_L = 16777260,
	KEY_SUPER_R = 16777261,
	KEY_MENU = 16777262,
	KEY_HYPER_L = 16777263,
	KEY_HYPER_R = 16777264,
	KEY_HELP = 16777265,
	KEY_DIRECTION_L = 16777266,
	KEY_DIRECTION_R = 16777267,
	KEY_BACK = 16777280,
	KEY_FORWARD = 16777281,
	KEY_STOP = 16777282,
	KEY_REFRESH = 16777283,
	KEY_VOLUMEDOWN = 16777284,
	KEY_VOLUMEMUTE = 16777285,
	KEY_VOLUMEUP = 16777286,
	KEY_BASSBOOST = 16777287,
	KEY_BASSUP = 16777288,
	KEY_BASSDOWN = 16777289,
	KEY_TREBLEUP = 16777290,
	KEY_TREBLEDOWN = 16777291,
	KEY_MEDIAPLAY = 16777292,
	KEY_MEDIASTOP = 16777293,
	KEY_MEDIAPREVIOUS = 16777294,
	KEY_MEDIANEXT = 16777295,
	KEY_MEDIARECORD = 16777296,
	KEY_HOMEPAGE = 16777297,
	KEY_FAVORITES = 16777298,
	KEY_SEARCH = 16777299,
	KEY_STANDBY = 16777300,
	KEY_OPENURL = 16777301,
	KEY_LAUNCHMAIL = 16777302,
	KEY_LAUNCHMEDIA = 16777303,
	KEY_LAUNCH0 = 16777304,
	KEY_LAUNCH1 = 16777305,
	KEY_LAUNCH2 = 16777306,
	KEY_LAUNCH3 = 16777307,
	KEY_LAUNCH4 = 16777308,
	KEY_LAUNCH5 = 16777309,
	KEY_LAUNCH6 = 16777310,
	KEY_LAUNCH7 = 16777311,
	KEY_LAUNCH8 = 16777312,
	KEY_LAUNCH9 = 16777313,
	KEY_LAUNCHA = 16777314,
	KEY_LAUNCHB = 16777315,
	KEY_LAUNCHC = 16777316,
	KEY_LAUNCHD = 16777317,
	KEY_LAUNCHE = 16777318,
	KEY_LAUNCHF = 16777319,
	KEY_UNKNOWN = 33554431,
	KEY_SPACE = 32,
	KEY_EXCLAM = 33,
	KEY_QUOTEDBL = 34,
	KEY_NUMBERSIGN = 35,
	KEY_DOLLAR = 36,
	KEY_PERCENT = 37,
	KEY_AMPERSAND = 38,
	KEY_APOSTROPHE = 39,
	KEY_PARENLEFT = 40,
	KEY_PARENRIGHT = 41,
	KEY_ASTERISK = 42,
	KEY_PLUS = 43,
	KEY_COMMA = 44,
	KEY_MINUS = 45,
	KEY_PERIOD = 46,
	KEY_SLASH = 47,
	KEY_0 = 48,
	KEY_1 = 49,
	KEY_2 = 50,
	KEY_3 = 51,
	KEY_4 = 52,
	KEY_5 = 53,
	KEY_6 = 54,
	KEY_7 = 55,
	KEY_8 = 56,
	KEY_9 = 57,
	KEY_COLON = 58,
	KEY_SEMICOLON = 59,
	KEY_LESS = 60,
	KEY_EQUAL = 61,
	KEY_GREATER = 62,
	KEY_QUESTION = 63,
	KEY_AT = 64,
	KEY_A = 65,
	KEY_B = 66,
	KEY_C = 67,
	KEY_D = 68,
	KEY_E = 69,
	KEY_F = 70,
	KEY_G = 71,
	KEY_H = 72,
	KEY_I = 73,
	KEY_J = 74,
	KEY_K = 75,
	KEY_L = 76,
	KEY_M = 77,
	KEY_N = 78,
	KEY_O = 79,
	KEY_P = 80,
	KEY_Q = 81,
	KEY_R = 82,
	KEY_S = 83,
	KEY_T = 84,
	KEY_U = 85,
	KEY_V = 86,
	KEY_W = 87,
	KEY_X = 88,
	KEY_Y = 89,
	KEY_Z = 90,
	KEY_BRACKETLEFT = 91,
	KEY_BACKSLASH = 92,
	KEY_BRACKETRIGHT = 93,
	KEY_ASCIICIRCUM = 94,
	KEY_UNDERSCORE = 95,
	KEY_QUOTELEFT = 96,
	KEY_BRACELEFT = 123,
	KEY_BAR = 124,
	KEY_BRACERIGHT = 125,
	KEY_ASCIITILDE = 126,
	KEY_NOBREAKSPACE = 160,
	KEY_EXCLAMDOWN = 161,
	KEY_CENT = 162,
	KEY_STERLING = 163,
	KEY_CURRENCY = 164,
	KEY_YEN = 165,
	KEY_BROKENBAR = 166,
	KEY_SECTION = 167,
	KEY_DIAERESIS = 168,
	KEY_COPYRIGHT = 169,
	KEY_ORDFEMININE = 170,
	KEY_GUILLEMOTLEFT = 171,
	KEY_NOTSIGN = 172,
	KEY_HYPHEN = 173,
	KEY_REGISTERED = 174,
	KEY_MACRON = 175,
	KEY_DEGREE = 176,
	KEY_PLUSMINUS = 177,
	KEY_TWOSUPERIOR = 178,
	KEY_THREESUPERIOR = 179,
	KEY_ACUTE = 180,
	KEY_MU = 181,
	KEY_PARAGRAPH = 182,
	KEY_PERIODCENTERED = 183,
	KEY_CEDILLA = 184,
	KEY_ONESUPERIOR = 185,
	KEY_MASCULINE = 186,
	KEY_GUILLEMOTRIGHT = 187,
	KEY_ONEQUARTER = 188,
	KEY_ONEHALF = 189,
	KEY_THREEQUARTERS = 190,
	KEY_QUESTIONDOWN = 191,
	KEY_AGRAVE = 192,
	KEY_AACUTE = 193,
	KEY_ACIRCUMFLEX = 194,
	KEY_ATILDE = 195,
	KEY_ADIAERESIS = 196,
	KEY_ARING = 197,
	KEY_AE = 198,
	KEY_CCEDILLA = 199,
	KEY_EGRAVE = 200,
	KEY_EACUTE = 201,
	KEY_ECIRCUMFLEX = 202,
	KEY_EDIAERESIS = 203,
	KEY_IGRAVE = 204,
	KEY_IACUTE = 205,
	KEY_ICIRCUMFLEX = 206,
	KEY_IDIAERESIS = 207,
	KEY_ETH = 208,
	KEY_NTILDE = 209,
	KEY_OGRAVE = 210,
	KEY_OACUTE = 211,
	KEY_OCIRCUMFLEX = 212,
	KEY_OTILDE = 213,
	KEY_ODIAERESIS = 214,
	KEY_MULTIPLY = 215,
	KEY_OOBLIQUE = 216,
	KEY_UGRAVE = 217,
	KEY_UACUTE = 218,
	KEY_UCIRCUMFLEX = 219,
	KEY_UDIAERESIS = 220,
	KEY_YACUTE = 221,
	KEY_THORN = 222,
	KEY_SSHARP = 223,
	KEY_DIVISION = 247,
	KEY_YDIAERESIS = 255
}

enum JoyButtons {
	PsCross_XboxA_NtdoB = 0,
	PsCircle_XboxB_NtdoA = 1,
	PsSquare_XboxX_NtdoY = 2,
	PsTri_XboxY_NtdoX = 3,
	L_or_L1 = 4,
	R_or_R1 = 5,
	L2 = 6,
	R2 = 7,
	L3 = 8,
	R3 = 9,
	PsShare_XboxSelect_NtdoMinus = 10,
	PsOptions_XboxStart_NtdoPlus = 11,
	DpadUp = 12,
	DpadDown = 13,
	DpadLeft = 14,
	DpadRight = 15,
	PsPSBtn_XboxGuide_NtdoHome = 16,
	PsMic_XboxShare_NtdoCapture = 17,
	XboxPaddle1 = 18,
	XboxPaddle2 = 19,
	XboxPaddle3 = 20,
	XboxPaddle4 = 21,
	PsTouchpad = 22
}
const UNKNOWN_JOYPAD_BTN: int = 23

@export var action_name: String = ""

@export var input1_is_key: bool = true
@export var input1_as_key: Keys = 0
@export var input1_as_btn: JoyButtons = 0

@export var input2_is_key: bool = true
@export var input2_as_key: Keys = 0
@export var input2_as_btn: JoyButtons = 0

func _init(
	action_name_: String = "",
	input1_is_key_: bool = true,
	input1_as_key_: int = 0,
	input1_as_btn_: int = 0,
	input2_is_key_: bool = true,
	input2_as_key_: int = 0,
	input2_as_btn_: int = 0
):
	action_name = action_name_
	input1_is_key = input1_is_key_
	input1_as_key = input1_as_key_
	input1_as_btn = input1_as_btn_
	input2_is_key = input2_is_key_
	input2_as_key = input2_as_key_
	input2_as_btn = input2_as_btn_

func get_as_events():
	return [_get_as_event(1), _get_as_event(2)]

func _get_as_event(input: int):
	if get("input" + str(input) + "_is_key"):
		var ev = InputEventKey.new()
		ev.keycode = get("input" + str(input) + "_as_key")
		return ev
	else:
		var ev = InputEventJoypadButton.new()
		ev.button_index = get("input" + str(input) + "_as_btn")
		return ev
