SMODS.Atlas { --placeholder
	-- Key for code to find it with
	key = "GGBalatro",
	-- The name of the file, for the code to pull the atlas from
	path = "placeholder.png",
	-- Width of each sprite in 1x size
	px = 71,
	-- Height of each sprite in 1x size
	py = 95
}

SMODS.Atlas { --asuka
  key = "asuka",
  path = "asuka.png",
  px = 900,
  py = 1326
}

SMODS.Atlas { --spells
  key = "Spell_at",
  path = "spells.png",
  px = 65,
  py = 92
}

SMODS.Rarity {
  key = "blazing",
  loc_txt = {
    name = "Blazing"
  },
  badge_colour = HEX("b71719")
}

SMODS.Atlas {
  key = "axl_at",
  path = "axl.png",
  px = 71,
  py = 95
}

SMODS.Consumable {
  key = "gear",
  set = 'Spectral',
  loc_txt = {
    name = "Gear",
    text = { "Quite guilty" }
  },
  cost = 999,
  atlas = 'GGBalatro',
  pos = { x = 0, y = 0},
  can_use = function(self, card)
    return true
  end,
  use = function(self, card, area)
    G.E_MANAGER:add_event(Event({
      SMODS.add_card{ set = 'Joker', rarity = 'ggbt_blazing'}
    }))
  end
}

SMODS.Back{
    name = "Blazing Deck",
    key = "ggdeck",
    atlas = 'GGBalatro',
    pos = {x = 0, y = 0},
    config = {consumables = {'c_ggbt_gear'}},
    loc_txt = {
        name = "Blazing Deck",
        text = {
            "Start with a {C:mult}Gear{} card"
        },
    },
}
