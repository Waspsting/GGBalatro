SMODS.load_file("misc.lua")()
SMODS.load_file("spells/TC1.lua")()
SMODS.load_file("spells/TC2.lua")()
SMODS.load_file("spells/TC3.lua")()
SMODS.load_file("spells.lua")()
SMODS.load_file("faust_items.lua")()
SMODS.load_file("jokers.lua")()

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
      local count = 0
      for _, _card in pairs(G.play.cards) do
        print(_card)
        count = count + 1
        print(count)
      end
      return {
  			message = localize { type = 'variable', key = 'a_xchips', vars = { card.ability.extra.Xchip } },
  			Xchip_mod = card.ability.extra.Xchip
  		}
    end
  end
}


