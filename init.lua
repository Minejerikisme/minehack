minehack = {}


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


local function full_health(name)
local player = minetest.get_player_by_name(name)
player:set_hp(20)
end

local function tp(x,y,z,name)
local player = minetest.get_player_by_name(name)
player:setpos({x=x,y=y,z=z})
end


function minehack.show_to(name)
    minetest.show_formspec(name, "minehack:main", minehack.getbackground(name))
end

function minehack.show_to2(name)
    minetest.show_formspec(name, "minehack:tpf", minehack.gettp(name))
end

minetest.register_chatcommand("hack", {
    func = function(name)
        minehack.show_to(name)
    end,
})

minetest.register_chatcommand("tp", {
tp(100,100,100,pname)
})

local function showtpa(name)
minehack.show_to2(name)
end


minetest.register_on_player_receive_fields(function(player, formname, fields)

    if formname ~= "minehack:main" then
        return
    end

    if fields.fhb then
        full_health(pname)
    end

    if fields.t then
        showtpa(pname)
    end
end)

minetest.register_on_player_receive_fields(function(player, formname, fields)
    print("getit")
    if formname ~= "minehack.tpf" then
        return
    end

    if fields.tps then
        local pname = player:get_player_name()
        --print("teleporting to X:"..fields.xb.."Y: "..fields.yb.."Z: "..fields.zb)
        minetest.chat_send_all(pname .. " guessed " .. fields.number)
        --tp(fields.xb,fields.yb,fields.zb,pname)
    end
end)