-- Welcome to Hello Ingame Image Viewer
hello = {}

-- First some global variables
page = 1
name = player
max_page = 7 --<<<<<<here change!

-- Show form when player types /hello.
minetest.register_chatcommand("hello", {
	params = "",
	privs = {},
	description = "Shows a list of images.",
	func = function(name, player)
	-- Define the formspec
	minetest.show_formspec(name, "hello:form",
		"size[26,14]" ..
		"background[0,0;4.5,3.5;hello_background_" .. page .. ".png;true]" ..
		"label[0,0;Welcome to Hello Image Viewer. Type /hello to see this window if you closed it!]" ..
		"button[0.5,13.5;2,1;next_button;next ->]" ..
		"button_exit[19,13.5;7,0.5;exit;Click here to close this beautiful formspec...]")
	end
})

-- The next button is pressed
minetest.register_on_player_receive_fields(function(player, formname, fields)
	local name = player:get_player_name()
	page = page + 1
	minetest.show_formspec(name, "hello:form",
		"size[26,14]" ..
		"background[0,0;4.5,3.5;hello_background_" .. page .. ".png;true]" ..
		"label[0,0;Welcome to Hello Image Viewer," .. name .. ". Type /hello to see this window if you closed it!]" ..
		"button[0.5,13.5;2,1;next_button;next ->]" ..
		"button_exit[19,13.5;7,0.5;exit;Click here to close this beautiful formspec...]")
	minetest.debug("Hello:Changed page... Now on page:" .. page .." of " .. max_page .. ".")
	if page == max_page then
		page = 0
	end
end)
