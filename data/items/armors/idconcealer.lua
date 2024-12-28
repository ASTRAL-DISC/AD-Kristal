local item, super = Class(Item, "idconcealer")

function item:init()
    super.init(self)

    self.name = "IDConcealer" -- WIP?
    self.use_name = nil

    self.type = "armor"
    self.icon = "ui/menu/icon/armor"

    self.effect = ""
    self.shop = ""
    self.description = "A mask that obscures half of your face.\nIncreases graze area." -- WIP (maybe some mechanic regarding the graze area?)

    self.price = 0
    self.can_sell = false

    self.target = "none"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

	self.bonuses = {
        defense = 4,
        magic  = 2,
        graze_size = 0.3,
    }
    self.bonus_name = "GrazeArea"
    self.bonus_icon = "ui/menu/icon/up"

	self.can_equip = {}

    self.reactions = {
		susie = "Cool...",
		ralsei = "It feels inspired...",
        noelle = "Only half of it?",
        mteen = "Are we robbing a bank??",
        berdly = "Not my style, but..."
    }
end

function item:getReaction(user_id, reactor_id)
    if Game:hasPartyMember("susie") and user_id == "ralsei" then
        if reactor_id == "ralsei" then
            return "I feel mysterious!"
        elseif reactor_id == "susie" then
            return "Don't put the glasses on it!!"
        else
            return nil
        end
    else
        return super.getReaction(self, user_id, reactor_id)
    end
end

return item