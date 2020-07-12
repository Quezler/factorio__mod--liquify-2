
liquify2 = {}

--

local order = 97 -- ascii a

--

data:extend({
    {
        type = "item-subgroup",
        name = "liquify2-liquification",
        group = "fluids",
        order = "[liquify]a"
    },
    {
        type = "item-subgroup",
        name = "liquify2-solidification",
        group = "fluids",
        order = "[liquify]z"
    },
});

--

function liquify2.create(item, color, volume)

    local color_dark  = util.table.deepcopy(color); color_dark .a = 255
    local color_light = util.table.deepcopy(color); color_light.a = 127
    local fluid_name  = "liquify2-solution-" .. item.name

    data:extend({
        {-- fluid
            type = "fluid",
            name = fluid_name,
            default_temperature = 25,
            base_color = color_dark,
            flow_color = color_light,
            max_temperature = 100,
            icons = {
                {
                    icon = "__Liquify__/graphics/icons/bottle-fill.png",
                    icon_size = 32
                },
                {
                    icon = "__Liquify__/graphics/icons/bottle-fill-side-mask.png",
                    icon_size = 32,
                    tint = color_light
                },
                {
                    icon = "__Liquify__/graphics/icons/bottle-fill-top-mask.png",
                    icon_size = 32,
                    tint = color_light
                },
                {
                    icon = item.icon,
                    icon_size = item.icon_size,
                    scale = 16.0 / item.icon_size,
                    shift = {8, -8}
                },
            },
            order = "[liquify]" .. string.char(order),
            localised_name = {"fluid-name.liquify2-solution", item.localised_name or {"item-name." .. item.name}},
        },
        {-- to
            type = "recipe",
            name = "liquify2-liquification-" .. item.name,
            order = "[liquify]" .. string.char(order),
            icons = {
                {
                    icon = item.icon,
                    icon_size = item.icon_size,
                },
            },
            subgroup = "liquify2-liquification",
            category = "liquify2",
            energy_required = 0.1,
            enabled = true,
            ingredients =
            {
                {type="item",  name=item.name , amount= 1 },
            },
            results =
            {
                {type="fluid", name=fluid_name, amount= 1 * volume }
            },
            always_show_products = true,
            crafting_machine_tint = {
                primary = color_light,
            },
            localised_name = {"recipe-name.liquify2-liquification", item.localised_name or {"item-name." .. item.name}},
            hide_from_player_crafting = true,
            show_amount_in_title = false,
        },
        {-- from
            type = "recipe",
            name = "liquify2-solidification-" .. item.name,
            subgroup = "liquify2-solidification",
            category = "chemistry",
            order = "[liquify]" .. string.char(order),
            icons = {
                {
                    icon = "__Liquify__/graphics/icons/bottle-empty.png",
                    icon_size = 32
                },
                {
                    icon = "__Liquify__/graphics/icons/bottle-empty-side-mask.png",
                    icon_size = 32,
                    tint = color_light
                },
                {
                    icon ="__Liquify__/graphics/icons/bottle-empty-top-mask.png",
                    icon_size = 32,
                    tint = color_light
                },
                {
                    icon = item.icon,
                    icon_size = item.icon_size,
                    scale = 16.0 / item.icon_size,
                    shift = {8, 8}
                },
            },
            energy_required = 0.1,
            enabled = true,
            ingredients =
            {
                {type="fluid", name=fluid_name, amount= 1 * volume },
            },
            results =
            {
                {type="item",  name=item.name , amount= 1 },
            },
            always_show_products = true,
            crafting_machine_tint = {
                primary    = color_dark,
                secondary  = color_light,
                tertiary   = color_light,
                quaternary = color_dark,
            },
            localised_name = {"recipe-name.liquify2-solidification", item.localised_name or {"item-name." .. item.name}},
            hide_from_player_crafting = true,
            allow_decomposition = false,
        }
    });
    order = order + 1;
end

require('prototypes/liquifier')
