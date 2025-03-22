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
        SMODS.add_card {key = "c_ggbt_howling_metron", set = "spells", area = G.consumables } 
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

SMODS.Joker {
  key = 'axl',
  loc_txt = {
    name = 'Axl Low',
    text = {"WHAT DOES HE EVEN {C:mult}DO?{}"}
  },
  config = { extra = {} },
  atlas = 'axl_at',
  pos = { x = 0, y = 0},
  rarity = 'ggbt_blazing',
  cost = 999,
  calculate = function(self, card, context)
    if context.setting_blind then
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.3,
        blockable = false,
        func = function()
          G.jokers:remove_card(card)
          card:remove()
          card = nil
          return true;
        end
      }))
    end
  end
}


