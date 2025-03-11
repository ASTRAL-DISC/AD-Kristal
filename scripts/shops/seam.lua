local Seam, super = Class(Shop, "seam")

function Seam:init()
    super.init(self)

    self.encounter_text = "* Hee hee...[wait:5]\n* Welcome,[wait:5] travellers."
    self.shop_text = "[emote:talk]* Take your time...[wait:5]\n* Ain't like it's\nbetter spent."
    self.leaving_text = "* See you again.[wait:5]\n* Or not.\n* Ha ha ha ha..."

    self.buy_menu_text = "[emote:talk]What do\nyou like\nto buy?"
    self.buy_confirmation_text = "Buy it for\n%s ?"
    self.buy_refuse_text = "What,\nnot good\nenough?"
    self.buy_text = "[emote:laugh]Thanks for\nthat."
    self.buy_storage_text = "[emote:laugh]Thanks, it'll\nbe in your\nSTORAGE."
    self.buy_too_expensive_text = "[emote:impatient]Not\nenough\nmoney."
    self.buy_no_space_text = "[emote:impatient]You're\ncarrying\ntoo much."

    self.sell_no_price_text = "[emote:impatient]Why would\nyou sell\nthis?"
    self.sell_menu_text = "[emote:talk]What kind\nof junk\nyou got?"
    self.sell_nothing_text = "That's\nnothing."
    self.sell_confirmation_text = "Sell it for\n%s ?"
    self.sell_refuse_text = "No?"
    self.sell_text = "That's it\nfor that."
    self.sell_no_storage_text = "[emote:impatient]You don't\nhave\nanything!"
    
    self.talk_text = "[emote:talk]Don't have\nanything\nbetter\nto do."

    self.sell_options_text["items"]   = "[emote:talk]Alright,\ngive me\nan ITEM."
    self.sell_options_text["weapons"] = "[emote:talk]What WEAPON\nwill you\ngive me?"
    self.sell_options_text["armors"]  = "[emote:talk]What ARMOR\nwill you\ngive me?"
    self.sell_options_text["storage"] = "[emote:talk]Alright,\ngive me\nan ITEM."

    self:registerItem("dark_candy")
    self:registerItem("darkburger")
    self:registerItem("amber_card")
    self:registerItem("spookysword")

    self.shopkeeper:setActor("shopkeepers/seam")
    self.shopkeeper.sprite:setPosition(-24, 12)
    self.shopkeeper.slide = true

    self.background = "ui/shop/seam"

    self.shop_music = "lantern"
end

function Seam:onStateChange(old, new)
	if not (old == "DIALOGUE" and new == "TALKMENU") then
		super.onStateChange(self, old, new)
	else
        self.large_box.visible = false
        self.left_box.visible = true
        self.right_box.visible = true
        self.info_box.visible = false
        self.dialogue_text.width = 372
        self.dialogue_text:setText(self.shop_text)
        self.right_text:setText("")
		self:setState("MAINMENU")
		self.shopkeeper:onEmote("idle")
	end
end

function Seam:startTalk()
    if Game.chapter == 3 then
        if Game:getFlag("shadow_crystals") == 3 then
            if not self:getFlag("talk_thirdcrystal", false) then
                self:setFlag("talk_thirdcrystal", true)
                self:startDialogue({
                    "[emote:oh]* Oh, [wait:5]dear! [wait:5]So not only have you managed to find the Shadow Mantle... \n[wait:5]* You also brought me another\nShadow Crystal!",
                    "[emote:laugh]* Very, [wait:5]very impressive!\n[wait:5]* Aren't you proud of yourself...?",
                    "[emote:impatient]* Is that so...? [wait:5]This one belonged\nto that manic lady?\n[wait:5]* It does almost feel like she\nearned it.",
                    "[emote:oh]* Yes, [wait:5]she seems to have worked very hard for this Shadow Crystal.\n[wait:5]* Perhaps by seeking the approval of someone...?",
                    "[emote:impatient]* You see. [wait:5]Just like it was with\nthat salesman... \n[wait:5]* This one also carries the presence of a Lightner.",
                    "[emote:oh]* A Lightner who longed to be recognized by their feats.\n[wait:5]* Or, [wait:5]perhaps, [wait:5]noticed.",
                    "[emote:laugh]* ...Loneliness, [wait:5]eh?\n[wait:5]* Quite cruel to some! [wait:5]Ha ha...",
                    "[emote:talk][sound:item]* Here... [wait:5]I will take this off your hands.\n[wait:5]* With that, [wait:5]you have now collected [color:yellow]three Shadow Crystals[color:reset].",
                    "[emote:laugh]* Keep up the eager pace, [wait:5]and you might just get my little gift early! \n[wait:5]* Not that it is any special..."
                })
                Game.inventory:removeItem("shadowcrystal")
            elseif not self:getFlag("talk_shadowmantle", false) then
                self:setFlag("talk_shadowmantle", true)
                self:startDialogue({
                    "[emote:talk]* You have collected 3 Shadow Crystals.",
                    "[emote:talk]* And you'll continue to find more, [wait:5]as long as you know where to look...",
                    "[emote:oh]* Oh, [wait:5]the Shadow Mantle? [wait:5]You're returning it?",
                    "[emote:talk]* I would say to keep it, [wait:5]but perhaps it is best if it stayed here.",
                    "[emote:oh]* I can probably still make some use out of it. [wait:5]Perhaps by purifying\nits essence...",
                    "[emote:laugh]* Maybe then I'll gift it to you\nonce again...! [wait:5]Your next few adventures might require a shimmering touch...",
                    "[emote:talk]* Until then, [wait:5]I wish you good luck\nin your endeavors.",
                    "[emote:laugh]* As it is only going to get harder from here. [wait:5]Ha ha ha..."
                })
            else
                self:startDialogue({
                    "[emote:talk]* You have collected 3 Shadow Crystals.",
                    "[emote:talk]* The energies emanating from them\nare truly remarkable. [wait:5][emote:laugh]I wish you could feel it!"
                })
            end
        elseif not self:getFlag("talk_town3", false) then
            self:setFlag("talk_town3", true)
            self:startDialogue({
                "[emote:talk]* Once again, [wait:5]I see new townspeople frolicking about.",
                "[emote:laugh]* You're having fun, [wait:5]aren't you?[wait:5]\n* Well, [wait:5]ain't like I can judge.",
                "[emote:talk]* I suppose this place gets a little more hopeful each time.",
                "[emote:impatient]* However, [wait:5]I do wonder if all these Darkners are happy with their new life here.",
                "[emote:talk]* Well, [wait:5]as long as the town expands and they can accomodate, [wait:5]it shouldn't become a problem...",
                "[emote:oh]* Recruiting Darkners, [wait:5]eh?\n[wait:5]* Interesting plan the little prince has."
            })
        else
            self:startDialogue({
                "[emote:impatient]* That television guy is roaming about, [wait:5]seeing if there's anything he can turn into entertainment.",
                "[emote:talk]* There are a few new small businesses starting. [wait:5]There'll\nsoon be more, [wait:5]I'm sure...",
                "[emote:oh]* It was bound to happen. [wait:5]I believe Darkners want to turn this place into an enjoyable haven for you.",
                "[emote:laugh]* I don't share the sentiment, [wait:5]so it is amusing to see this kind of effort from here."
            })
        end
    elseif Game.chapter == 4 then
        if Game.inventory:hasItem("gammarune") or Game.inventory:hasItem("betarune") or Game.inventory:hasItem("alpharune") then
            self:startDialogue({
                "[emote:oh]* Oh? [wait:5]It seems you are holding onto\na [color:yellow]Rune[color:reset].",
                "[emote:talk]* So you found one... [wait:5]You know what to do with it, [wait:5]right?",
                "[emote:laugh]* Well, [wait:5]if it's still in your pocket... [wait:5]Maybe you don't.",
                "[emote:talk]* If you break it in half, [wait:5]a\npowerful magic will be released... [wait:5]And you might learn new [color:yellow]SPELLS[color:reset].",
                "[emote:impatient]* Though, [wait:5]if you haven't awakened your magic yet, [wait:5]there may be some trouble.",
                "[emote:laugh]* Runes only speed up the process of mastering magical abilities. [wait:5]So if you don't have any magic to begin with... [wait:5]It won't work.",
                "[emote:talk]* Don't worry. [wait:5]I sense magic in all of you... [wait:5]I'm sure you'll be able to awaken it and reach the proper balance.",
                "[emote:laugh]* The prince knows more about it\nthan I do, [wait:5]however. [wait:5]And I'm the\nold court mage!"
            })
        elseif Game:getFlag("shadow_crystals") == 4 then
            if not self:getFlag("talk_fourthcrystal", false) then
                self:setFlag("talk_fourthcrystal", true)
                self:startDialogue({
                    "[emote:laugh]* And once again, [wait:5]you have collected yet another Shadow Crystal!",
                    "[emote:talk]* So the little priest had this in his possession all this time, [wait:5]eh...?",
                    "[emote:impatient]* Now, [wait:5]I'm not a person of faith.\n[wait:5]But I believe he considered it to be a holy piece in his quest...",
                    "[emote:laugh]* I suppose everyone has a different interpretation.",
                    "[emote:impatient]* I can't say that I am surprised. [wait:5]Shadow Crystals are quite puzzling in their nature...",
                    "[emote:oh]* Deeper darkness, containing that little remnant of Light...",
                    "[emote:laugh]* ...Interesting, [wait:5]isn't it? [wait:5]Perhaps someday you will uncover where exactly these come from.",
                    "[emote:laugh][sound:item]* Here, [wait:5]let me take this crystal.\n[wait:5]You have found four so far...!",
                })
                Game.inventory:removeItem("shadowcrystal")
            elseif not self:getFlag("talk_fourthcrystal_after", false) then
                self:setFlag("talk_fourthcrystal_after", true)
                self:startDialogue({
                    "[emote:talk]* You have collected 4 Shadow Crystals.",
                    "[emote:laugh]* Quite a lot for someone your size... [wait:5]Ha ha!",
                    "[emote:talk]* I mean no offense. [wait:5]It's just... [wait:5]surprising to see you get this far without ever giving up.",
                    "[emote:talk]* Challenges sometimes aren't worth it. [wait:5]To me, [wait:5]it's better to just relax and think about the many wonders of this EARTH...",
                    "[emote:impatient]* I believe your next opponent might be... [wait:5]Hungry for something.",
                    "[emote:laugh]* Perhaps then you'll finally give up? [wait:5]Who knows what awaits you!"
                })
            else
                self:startDialogue({
                    "[emote:talk]* You have collected 4 Shadow Crystals.",
                    "[emote:laugh]* You see, [wait:5]you could consider stoppping.\n[wait:5]* It's not like it makes any difference in the grand scheme!",
                    "[emote:talk]* If you're a being of morbid curiousity, [wait:5]I suppose then... [wait:5]there's no stopping you."
                })
            end
        elseif not self:getFlag("talk_town4", false) then
            self:setFlag("talk_town4", true)
            self:startDialogue({
                "[emote:laugh]* And the town flourishes...",
                "[emote:talk]* That Nun you brought... [wait:5]She's\nquite an interesting individual.",
                "[emote:oh]* A Darkner moved by a Lightner's prayer... [wait:5]Odd.",
                "[emote:impatient]* There's a strange, [wait:5]powerful aura coursing through her.",
                "[emote:talk]* To think Lightners could influence us like that... [wait:5]You lot are more powerful that we ever expected.",
                "[emote:laugh]* Perhaps...[wait:5]\n* SOME of you are. [wait:5]Ha ha!"
            })
        else
            self:startDialogue({
                "[emote:talk]* You've met the [color:red]knight[color:reset], [wait:5]haven't\nyou? [wait:5]The one who made the imprisoned King go mad with power...",
                "[emote:laugh]* Lightners... [wait:5]always finding ways into Darkners' hearts...",
                "[emote:impatient]* No wonder the Bishop was jailed... [wait:5]They favored their precious Nun over him.",
                "[emote:impatient]* It seems that when the sun goes down, [wait:5]strange things can happen in Dark Worlds.[wait:5]\n* Magic becomes greater...",
                "[emote:oh]* Speaking of which, [wait:5]have you found [color:yellow]anything interesting[color:reset] lately?",
                "[emote:talk]* In case you ever hold onto it, [wait:5]bring it here so I can take a\nlook.",
                "[emote:laugh]* But I'm sure the prince told you about some of that."
            })
        end
    end
end

function Seam:onTalk()
	self:startTalk()
end

return Seam