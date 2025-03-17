SMODS.load_file("misc.lua")()
SMODS.load_file("spells/TC1.lua")()
SMODS.load_file("spells/TC2.lua")()
SMODS.load_file("spells/TC3.lua")()
SMODS.load_file("spells.lua")()
SMODS.load_file("faust_items.lua")()
SMODS.load_file("jokers.lua")()

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
