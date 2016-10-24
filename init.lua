minetest.register_node("crystal_radio:wifi", {
	description = "crystal radio",
	tiles = {"wifi_top.png", "wifi_top.png", "wifi_side.png",
		"wifi_side.png", "wifi_side.png","wifi_front.png",
},
	paramtype2 = "facedir",
	groups = {snappy=2, choppy=2, cracky=3,},
	legacy_facedir_simple = true,
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,9]"..
				"list[current_player;crystal_radio:wifi;0,0;8,4;]"..
				"list[current_player;main;0,5;8,4;]")
		meta:set_string("infotext", "crystal radio")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in crystal radio at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to crystal radio at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from crystal radio at "..minetest.pos_to_string(pos))
	end,
})

minetest.register_craft({
	output = 'crystal_radio:wifi',
	recipe = {
		{'default:diamond','default:mese_crystal','default:diamond'},
		{'default:diamond','default:steel_ingot','default:diamond'},
		{'default:diamond','default:diamond','default:diamond'}
	}
})

minetest.register_on_joinplayer(function(player)
	local inv = player:get_inventory()
	inv:set_size("crystal_radio:wifi", 8*4)
end)

