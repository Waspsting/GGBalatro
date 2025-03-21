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

SMODS.Joker {
  key = 'ky',
  loc_txt = {
    name = 'Ky Kiske',
    text = {"{X:chips,C:white}X#1#{}"}
  },
  config = { extra = { Xchip = 1, Xchip_gain = 0.5 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xchip, card.ability.extra.chip_gain } }
	end,
  atlas = 'GGBalatro',
  pos = { x = 0, y = 0},
  rarity = 'ggbt_blazing',
  cost = 999,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
				message = localize { type = 'variable', key = 'a_xchips', vars = { card.ability.extra.Xchip } },
				Xchip_mod = card.ability.extra.Xchip
			}
    end
    if context.before and next(context.poker_hands['Three of a Kind']) and not context.blueprint then
			card.ability.extra.Xchip = card.ability.extra.Xchip + card.ability.extra.Xchip_gain
			return {
				message = 'Upgraded!',
				colour = G.C.CHIPS,
				card = card
			}
		end
  end
}


