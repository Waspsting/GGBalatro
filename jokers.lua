SMODS.Joker { --Asuka
  key = 'asuka',
  loc_txt = {
    name = 'Asuka',
    text = { "Creates {C:attention}cube{}" }
  },
  config = { extra = {} },
  atlas = 'asuka',
  pos = { x = 0, y = 0},
  rarity = 'ggbt_blazing',
  cost = 999,
  calculate = function(self, card, context)
    if context.setting_blind then
      G.E_MANAGER:add_event(Event({
        SMODS.add_card {set = "Tarot", key = 'c_ggbt_howling_metron', area = G.consumables } 
      }))
    end
  end
}

SMODS.Joker { --Faust
  key = 'faust',
  loc_txt = {
    name = 'Faust',
    text = {
      "When {C:attention}blind{} is selected,",
      "create a random {C:attention}Faust item{}",
      "{C:attention}consumable{} card"
    }
  },
  config = { extra = {} },
  atlas = 'GGBalatro',
  pos = { x = 0, y = 0},
  rarity = "ggbt_blazing",
  cost = 999,
  calculate = function(self, card, context)
    if context.setting_blind then
      G.E_MANAGER:add_event(Event({
        SMODS.add_card { set = '', area = G.consumables, soulable = true, edition = 'e_negative' } 
      }))
    end
  end
}
