--Creates an atlas for cards to use
SMODS.Atlas {
	-- Key for code to find it with
	key = "GGBalatro",
	-- The name of the file, for the code to pull the atlas from
	path = "placeholder.png",
	-- Width of each sprite in 1x size
	px = 71,
	-- Height of each sprite in 1x size
	py = 95
}


SMODS.Joker {
	-- How the code refers to the joker.
	key = 'john',
	-- loc_text is the actual name and description that show in-game for the card.
	loc_txt = {
		name = 'John',
		text = {
			"{X:mult,C:white}x#1# {} Mult"
		}
	},
	config = { extra = { Xmult = 69 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult } }
	end,
	rarity = 4,
	atlas = 'GGBalatro',
	pos = { x = 0, y = 0 },
	cost = 999,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.Xmult,
				message = localize { type = 'variable', key = 'X_mult', vars = { card.ability.extra.Xmult } }
			}
		end
	end
}

SMODS.Joker {
  key = 'faust',
  loc_txt = {
    name = 'Faust',
    text = {
      "When {C:attention}blind{} is selected,",
      "create a random {C:dark_edition}Negative{}",
      "{C:attention}consumable{} card"
    }
  },
  config = { extra = {} },
  rarity =4,
  atlas = 'GGBalatro',
  pos = { x = 0, y = 0},
  cost = 999,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.e_negative
  end,
  calculate = function(self, card, context)
    if context.setting_blind then
      G.E_MANAGER:add_event(Event({
        SMODS.create_card(
          {
            set = 'Planet', 'Tarot', 'Spectral',
            area = 'G.consumables',
            soulable = 'true',
            edition = 'negative'
          }),
      }))
    end
  end
}
----------------------------------------------
------------MOD CODE END----------------------
