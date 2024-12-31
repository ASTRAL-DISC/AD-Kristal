local Jewel, super = Class(Shop, "jewel")

function Jewel:init()
    super.init(self)

    self.encounter_text = "* Woe! [wait:5]Oh, [wait:5]Woe! [wait:5]Customers![wait:5]\n* I knew setting up shop here would be fruitful...!"
    self.shop_text = "[emote:talk]* Please, [wait:5]take a look at my wares! [wait:5](Decorative jewels NOT for sale.)"
    self.leaving_text = "* Woe...! [wait:5]Leaving so soon?![wait:5]\n* Oh, [wait:5]Woe..."
    -- Shown when you're in the BUY menu
    self.buy_menu_text = "[emote:talk]What would you like, [wait:5]oh little ones?"
    -- Shown when you're about to buy something.
    self.buy_confirmation_text = "Buy it for\n%s ?"
    -- Shown when you refuse to buy something
    self.buy_refuse_text = "Aww, [wait:5]come\non, [wait:5]now!"
    -- Shown when you buy something
    self.buy_text = "[emote:talk]Oh Woe!\nThank you!"
    -- Shown when you buy something and it goes in your storage
    self.buy_storage_text = "[emote:talk]It\nshall be in your\nSTORAGE~!"
    -- Shown when you don't have enough money to buy something
    self.buy_too_expensive_text = "[emote:talk]You do\nnot have\nthe means!"
    -- Shown when you don't have enough space to buy something.
    self.buy_no_space_text = "[emote:talk]Pocket's\ntoo full!"
    -- Shown when something doesn't have a sell price
    self.sell_no_price_text = "[emote:talk]Why would\nYou sell\nthis?"
    -- Shown when you're in the SELL menu
    self.sell_menu_text = "[emote:talk]What kind\nof junk\nyou got?"
    -- Shown when you try to sell an empty spot
    self.sell_nothing_text = "I see\nnothing!"
    -- Shown when you're about to sell something.
    self.sell_confirmation_text = "Sell it for\n%s ?"
    -- Shown when you refuse to sell something
    self.sell_refuse_text = "No,\nthank\nyou!"
    -- Shown when you sell something
    self.sell_text = "That's it\nfor that."
    -- Shown when you have nothing in a storage
    self.sell_no_storage_text = "[emote:talk]You don't\nhave\nanything!"
    -- Shown when you enter the talk menu.
    self.talk_text = "[emote:talk]Oh! [wait:5]Care\nfor a chit-chat over tea?"

    self.sell_options_text["items"]   = "[emote:talk]What\nshould\nI sell?"
    self.sell_options_text["weapons"] = "[emote:talk]What\nshould\nI sell?"
    self.sell_options_text["armors"]  = "[emote:talk]What\nshould\nI sell?"
    self.sell_options_text["storage"] = "[emote:talk]What\nshould\nI sell?"

    self:registerItem("crystalsugar")
    self:registerItem("gummymouse")
    --self:registerItem("carbongem")
    self:registerItem("cat_earmuffs")

    self:registerTalk("How are you here")
    self:registerTalk("Strange Gem")
    self:registerTalk("Darkner Traveling")
    self:registerTalk("Card Kingdom")

    self.shopkeeper:setActor("shopkeepers/diamondking")
    self.shopkeeper.sprite:setPosition(-5, 12)
    self.shopkeeper.slide = true

    self.background = "ui/shop/jewel"

    self.shop_music = "lantern"
end

function Jewel:startTalk(talk)
    if talk == "How are you here" then
        self:startDialogue({
            "[emote:talk]* \"How am I here\"??",
			"[emote:talk]* THAT'S the question you ask, [wait:5]and not \"Who are you, [wait:5]Oh Lustrous One\"??",
            "[emote:talk]* Oh, [wait:5]Woe!\n[wait:5]* The disrespect wounds me...!",
            "[emote:talk]* FIRSTLY, [wait:5]I am the [wait:10][font:main, 22][offset:-5, 6]former[wait:10][offset:0, -6][font:main_mono] King of Diamonds.[wait:5]\n* You must remember my wondrous face from its disgraceful times in a cell...",
            "[emote:talk]* Just when I thought I had grown used to that hellish place, [wait:5]my longing for jewels made me come\nup with a genius plan to escape! [wait:5]",
			"[emote:talk]* ...Turns out I just needed to\nforce the bars that I've been gripping for the last few adventures.",
			"[emote:talk]* The other kings, [wait:5]sadly, [wait:5]did not wish to engage in our newfound freedom.",
			"[emote:talk]* And so...!\n[wait:5]* As the [wait:10][font:main,22][offset:-5, 6]former[wait:10][offset:0, -6][font:main_mono] King of Diamonds in\nCard Kingdom...!",
			"[emote:talk]* I have succesfully followed the prince's path, [wait:5]and then set up\nshop in this bright, [wait:5]slightly dystopian place!!",
			"[emote:talk]* I can now build a new, [wait:5]luminous life here!!\n[wait:5]* And lead us to a future that\nshines for all darkners!!",
			"[emote:talk]* ...Mostly me, [wait:5]as per usual!"
        })
    elseif talk == "Strange Gem" then
        self:startDialogue({
            "[emote:talk]* Oh, [wait:5]yes! [wait:5]The Carbonado Gem...!!",
            "[emote:talk]* The rarest gem...  [wait:5]crafted by the brightest gem of all!\n[wait:3]* [font:main, 22][offset:0, 10]I am the former King of Diamonds.",
            "[emote:talk]* Well, [wait:5]this jewel right here. [wait:5]Aside from being blindingly marvelous...\n[wait:5]* Is an incredible device that will revolutionize the way darkners live!!",
			"[emote:talk]* That little ornament will make\nsure to grant a darkner their own supply of pure darkness...",
			"[emote:talk]* And thus, [wait:5]replenish their dark\nform as they use it!\n[wait:5]* That will make it so darkners can once again visit other Dark Worlds without succumbing to statues!",
			"[emote:talk]* I can already feel the joy of all of us being able to travel anywhere!\n[wait:5]* A true revolution, [wait:5]a paragon of satisfaction!!",
            "[emote:talk]* But, [wait:5]Woe! [wait:5]Do remember that this effect is [color:yellow]temporary[color:reset]!",
            "[emote:talk]* As it adorns you, [wait:5]the pure darkness contained inside will slowly run out and return to the original source...",
            "[emote:talk]* ...And you might not \"belong\" in any Dark Fountains anymore.",
            "[emote:talk]* ...",
            "[emote:talk]* But oh, [wait:5]do not fret!! [wait:5]All you have to do is buy another gem from me!\n[wait:5]Then another, [wait:5]and then another...!",
            "[emote:talk]* I've got a sizable supply of pure darkness!! [wait:5]All injected in my collection of gems!",
            "[emote:talk]* Fwo-ho ho!! [wait:20]Do not ask where I got them from."

        })
    elseif talk == "Darkner Traveling" then
        self:startDialogue({
            "[emote:talk]* ...Enlightement, [wait:5]huh?",
            "[emote:talk]* Ha ha! [wait:5]\n* Quite mistaken, [wait:5]that woman!",
            "[emote:talk]* As the former court magician, [wait:5]I do cling onto my own interpretations of one becoming... [wait:5][color:pink]enlightened[color:reset].",
            "[emote:talk]* Ain't like I'm going to share, [wait:5]though!",
			"[emote:talk]* ...",
            "[emote:talk]* That type of knowledge... [wait:5]It can weigh heavy on one's mind.\n[wait:5]* I would tread carefully, [wait:5]if I were you..."
        })
    elseif talk == "Card Kingdom" then
        self:startDialogue({
            "[emote:talk]* Ah yes, [wait:5]those two.",
            "[emote:talk]* They have caused quite the ruckus in your little pocket, [wait:5]haven't they?",
            "[emote:talk]* Given how stubborn they both are,\n[wait:5]I understand why they might not want to put their differences aside...",
			"[emote:talk]* You see, [wait:5]Shadow Crystals can hold one's essence. [wait:5]\n* Doesn't matter if they are from\nthe LIGHT or the DARK...",
			"[emote:talk]* Strong feelings and thoughts can leave their mark.\n[wait:5]* Pride, [wait:5]loneliness. [wait:5]Greed, [wait:5]abandonment... \n[wait:5]* All kept in there.",
			"[emote:talk]* Do these preserved energies ever get to me...?",
			"[emote:talk]* Ha ha ha... [wait:5]\n* As if it would make a difference.",
			"[emote:talk]* Call it morbid curiosity, [wait:5]but looking through the glass can be quite the experience. [wait:5]\n* Have you ever tried it...?"
        })
    end
end

return Jewel