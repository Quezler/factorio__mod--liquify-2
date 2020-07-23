data:extend({

    {
        type = "item",
        name = "liquify2-liquifier",
        icon = "__Liquify__/graphics/gearbox.png",
        icon_size = 64, icon_mipmaps = 4,
        stack_size = data.raw["item"]["electric-mining-drill"].stack_size / 2,

        place_result = "liquify2-liquifier",

        subgroup = "extraction-machine",
        order = "a[items]-a[liquify2-liquifier]",
    },

    {
        type = "recipe",
        name = "liquify2-liquifier",
        energy_required = data.raw["recipe"]["electric-mining-drill"].normal.energy_required * 2,
        enabled = true,
        ingredients =
        {
            {"pipe"           , 03},
            {"iron-gear-wheel", 02},
            {"iron-chest"     , 01},
        },
        result = "liquify2-liquifier",
    },

    {
        type = "recipe-category",
        name = "liquify2",
    },

    {
        type = "assembling-machine",
        name = "liquify2-liquifier",
        icon = "__Liquify__/graphics/gearbox.png",
        icon_size = 64, icon_mipmaps = 4,
        crafting_speed = 1,
        crafting_categories = {"liquify2"},
        ingredient_count = 1,
        flags = {"not-rotatable", "player-creation", "placeable-player"},
        scale_entity_info_icon = true,
        entity_info_icon_shift = {0, 0},

        minable = {hardness = 1, mining_time = 1, result = "liquify2-liquifier"},

        fluid_boxes =
        {
            {
                production_type = "output",
                pipe_covers = pipecoverspictures(),
                base_area = 1,
                height = 4,
                pipe_connections =
                {
                    { type="input-output", position = {-2, 0} },
                    { type="input-output", position = {2,  0} },
                }
            },
            off_when_no_fluid_recipe = false
        },

        collision_box = {{-1.4, -0.4}, {1.4, 0.4}},
        selection_box = {{-1.5, -0.5}, {1.5, 0.5}},

        animation =
        {
            layers =
            {
                {
                    filename = "__Liquify__/graphics/liquifier.png",
                    priority = "high",
                    width = 192,
                    height = 128,
                    scale = 0.5,
                },

                {
                    filename = "__Liquify__/graphics/liquifier-mask.png",
                    width = 192,
                    height = 128,
                    scale = 0.5,
                }
            }
        },

        energy_source = {
            usage_priority = data.raw["mining-drill"]["electric-mining-drill"].energy_source.usage_priority,
            emissions_per_minute = 25,
            type = "electric",
            drain = "1kW",
        },
        energy_usage = "249kW",

        working_visualisations =
        {
            {
                apply_recipe_tint = "primary",
                always_draw = true,

                animation =
                {
                    filename = "__Liquify__/graphics/liquifier-mask.png",
                    width = 192,
                    height = 128,
                    scale = 0.5,
                },
            }
        },
    }
});
