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
    text = {
      "Gains {X:chips,C:white}X#2#{} Chips if",
      "played hand contains",
      "exactly {C:attention}3 Kings{}",
      "{C:inactive}(Currently {X:chips,C:white}X#1#{C:inactive} Chips)"
    }
  },
  config = { extra = { Xchip = 1, Xchip_gain = 0.50 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xchip, card.ability.extra.Xchip_gain } }
  end,
  atlas = 'GGBalatro',
  pos = { x = 0, y = 0},
  rarity = 'ggbt_blazing',
  cost = 999,
  calculate = function(self, card, context)
    if context.joker_main then
      if card.ability.extra.Xchip > 1 then
        return {
          message = localize { type = 'variable', key= 'a_xchip', vars = { card.ability.extra.Xchip } },
          Xchip_mod = card.ability.extra.Xchip
        }
      end
    end
    if context.before and not context.blueprint then
      local count = 0
      for _, _card in pairs(G.play.cards) do
        if _card:get_id() == 13 then
          count = count + 1
        end
      end
      if count == 3 then
        card.ability.extra.Xchip = card.ability.extra.Xchip + card.ability.extra.Xchip_gain
        return {
          message = "Upgraded!",
          colour = G.C.CHIPS,
          card = card
        }
      end
    end
  end
}


SMODS.Joker {
  key = 'daryl',
  loc_txt = {
    name = 'Daryl',
    text = {
      "Gains {X:mult,C:white}X#2#{} Mult if",
      "played hand contains",
      "exactly {C:attention}3 Kings{}",
      "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"
    }
  },
  config = { extra = { Xmult = 1, Xmult_gain = 0.25 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xmult, card.ability.extra.Xmult_gain } }
  end,
  atlas = 'GGBalatro',
  pos = { x = 0, y = 0},
  rarity = 'ggbt_blazing',
  cost = 999,
  calculate = function(self, card, context)
    if context.joker_main then
      if card.ability.extra.Xmult > 1 then
        return {
          message = localize { type = 'variable', key= 'a_xmult', vars = { card.ability.extra.Xmult } },
          Xmult_mod = card.ability.extra.Xmult
        }
      end
    end
    if context.before and not context.blueprint then
      local count = 0
      for _, _card in pairs(G.play.cards) do
        if _card:get_id() == 13 then
          count = count + 1
        end
      end
      if count == 3 then
        card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
        return {
          message = "Upgraded!",
          colour = G.C.MULT,
          card = card
        } 
      end
    end
  end
}

  SMODS.Joker {
  key = 'leo',
  loc_txt = {
    name = 'Leo Whitefang', 
    text = {
      "Earn {C:money}#1#${} at end of round",
      "payout increases by {C:money}#2#${} when",
      "played hand contains exactly {C:attention}3 Kings{}"
    }
  },
  config = { extra = { payout = 1, payout_gain = 0.50 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.payout, card.ability.extra.payout_gain } }
  end,
  atlas = 'GGBalatro',
  pos = { x = 0, y = 0},
  rarity = 'ggbt_blazing',
  cost = 999,
  calculate = function(self, card, context)
    if context.joker_main then
      if card.ability.extra.payout > 0 then
        return {
          message = localize { type = 'variable', key= 'a_xmult', vars = { card.ability.extra.Xmult } },
          Xmult_mod = card.ability.extra.Xmult
        }
      end
    end
    if context.before and not context.blueprint then
      local count = 0
      for _, _card in pairs(G.play.cards) do
        if _card:get_id() == 13 then
          count = count + 1
        end
      end
      if count == 3 then
        card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
        return {
          message = "Upgraded!",
          colour = G.C.MULT,
          card = card
        } 
      end
    end
  end
}

