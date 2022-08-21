minehack = {}
local basic_hacks = require(hacks.basichacks.lua)
--This handles the initialization of the mod.
--This also handles the loading of the config file.
--And the handling of gui

function minehack.getbackground()
local background = {
    "formspec_version[6]",
    "size[10.5,11]",
    "button[3.6,1.3;3,0.8;fhb;Full Health]",
    "label[4.2,0.8;Minehack]",
    "button[3.6,2.5;3,0.8;t;Teleport]",
}
return table.concat(background, "")
end
--[[
function minehack.gettp()
local tp = {
    "formspec_version[6]",
    "size[10.5,11]",
    "label[4.3,0.5;Teleporter]",
    "field[3.6,1.7;3,0.8;xb;X:;]",
    "field[3.6,3.1;3,0.8;yb;Y:;]",
    "field[3.6,4.5;3,0.8;zb;Z:;]",
    "button[3.6,6.1;3,0.8;tps;Teleport!]"
} 
return table.concat(tp, "")
end
--]]

local function full_health(name)
local player = minetest.get_player_by_name(name)
player:set_hp(20)
end



function minehack.show_to(name)
    minetest.show_formspec(name, "minehack:main", minehack.getbackground(name))
end


minetest.register_chatcommand("hack", {
    func = function(name)
        Name = name
        minehack.show_to(name)
        basic_hacks.test()
    end,
})



minetest.register_on_player_receive_fields(function(player, formname, fields)

    if formname ~= "minehack:main" then
        return
    end

    if fields.fhb then
        full_health(pname)
    end


end)

