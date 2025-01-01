local wezterm = require("wezterm")

return {
	font = wezterm.font("Hack Nerd Font"),
	font_size = 14,
	color_scheme = "Tokyo Night",
	use_fancy_tab_bar = false,
	freetype_load_target = "HorizontalLcd",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	cursor_blink_rate = 0,
	audible_bell = "Disabled",
	window_close_confirmation = "NeverPrompt",
	keys = {
		{ key = "w", mods = "CTRL", action = wezterm.action({ CloseCurrentPane = { confirm = false } }) },
	},
}
