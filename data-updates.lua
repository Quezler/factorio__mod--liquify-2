
if mods["base"] then
    liquify2.create(data.raw["item"]["coal"           ], {r=038, g=038, b=038}, 010); -- color: "coke" (the bottle looks to dark with coal)
    liquify2.create(data.raw["item"]["stone"          ], {r=193, g=143, b=053}, 010);
    liquify2.create(data.raw["item"]["iron-ore"       ], {r=070, g=124, b=155}, 010);
    liquify2.create(data.raw["item"]["copper-ore"     ], {r=239, g=079, b=003}, 010);
    liquify2.create(data.raw["item"]["uranium-ore"    ], {r=097, g=205, b=000}, 010);
end

if mods["Krastorio2"] then
    liquify2.create(data.raw["item"]["raw-rare-metals"], {r=095, g=101, b=133}, 010); -- color: "rare-metals" (raw- was to similar to iron)
    liquify2.create(data.raw["item"]["raw-imersite"   ], {r=222, g=000, b=255}, 025);
    liquify2.create(data.raw["item"]["wood"           ], {r=192, g=094, b=000}, 050);
    liquify2.create(data.raw["item"]["kr-creep"       ], {r=146, g=112, b=136}, 100);
end

if mods["Mining_Drones"] then
    liquify2.create(data.raw["item"]["mining-drone"   ], {r=146, g=098, b=053}, 250); -- color: "basic-tech-card" (has a more fleshy color)
end
