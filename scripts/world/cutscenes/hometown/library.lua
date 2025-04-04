return {
	normal = function(cutscene, event)
		cutscene:setSpeaker(event)
        cutscene:text("* I love reading.")
		cutscene:text("* Especially. [wait:5]Books.") -- placeholder
    end,

    bookshelf = function(cutscene, event)
        cutscene:text("* How To Care For A Human")
		cutscene:text("* (It's a book for monsters on\nhow to care for humans.)")
		local choice = cutscene:choicer({"Look in\nthe back", "Look\ninside"})
		if choice == 2 then
			cutscene:text("* (There are photos of unfamiliar humans inside.)")
			cutscene:text("* (You shut the book quickly.)")
		else
			cutscene:text("* (According to the card in the back...)")
			cutscene:text("* (... [wait:5]looks like your mother\ntook it out repeatedly many years ago.)")
		end
    end,

    bookshelf2 = function(cutscene, event)
        cutscene:text("* (It's Book 1 about SOULS. [wait:5]Read it?)")
		local choice = cutscene:choicer({"Read", "Don't"})
		if choice == 2 then
			-- do nothing so the while loop happens again
		else
			cutscene:text("* The SOUL has long been called many things.")
			cutscene:text("* The font of our compassion. [wait:5]The source of our will.")
			cutscene:text("* The container of our \"life force\".")
			cutscene:text("* But even now, [wait:5]the true function of it is unknown.")
		end
    end,
    bookshelf3 = function(cutscene, event)
        cutscene:text("* Write Your Own Fate")
		cutscene:text("* (Seems to be a self-help book.)")
		local choice = cutscene:choicer({"Look in\nthe back", "Look\ninside"})
		if choice == 2 then
			cutscene:text("* (What you saw surprised you.)\n[wait:5]* (Sort of.)")
			cutscene:text("* (Judging by the colorful doodles, [wait:5]some great care seems to have been put in this.)")
			cutscene:text("* (There's no need to read any more, [wait:5]though.)")
		else
			cutscene:text("* (According to the card in the back...)")
			cutscene:text("* (Berdly takes this out pretty often.)")
			cutscene:text("* (... [wait:5]Dess has also read it a\nfew times.)")
		end
    end,
	bookshelf4 = function(cutscene, event)
		cutscene:text("* (It's Book 2 about SOULS. [wait:5]Read it?)")
		local choice = cutscene:choicer({"Read", "Don't"})
		if choice == 2 then
			--aaa
		else
			cutscene:text("* Of course, [wait:5]many still speculate why the SOUL exists.")
			cutscene:text("* Maybe we haven't found out\ntheir true purpose, [wait:5]but it begs the question...")
			cutscene:text("* How does a SOUL come into existence?")
			cutscene:text("* Willpower...[wait:5] Is it not\nsomething that is acquired by sharing experiences and bonds?")
			cutscene:text("* And if it originates from the SOUL, [wait:5]then...")
			cutscene:text("* How extensively does a SOUL define us?")
		end
    end,
	bookshelf5 = function(cutscene, event)
        cutscene:text("* (It's an artbook.\n[wait:5]* (Looks old and worn.)")
		local choice = cutscene:choicer({"Skim\nthrough", "Put it\nback"})
		if choice == 2 then
			cutscene:text("* (You carefully placed the book back in the shelf.)")
		else
			cutscene:text("* (You leaf through the book, [wait:5]watching the rainbow-like effect.)")
			cutscene:text("* (You stop at a pretty painting depicting a solar eclipse.)")
			cutscene:text("* (The book smells nice too...)")
			cutscene:text("* (You reluctantly put it back, [wait:5]before anyone could see you sniffing books.)")
			cutscene:text("* (The imagery stays with you, [wait:5]though.)")
		end
    end,
	bookshelf6 = function(cutscene, event)
        cutscene:text("* (It's Book 3 about SOULS. [wait:5]Read it?)")
		local choice = cutscene:choicer({"Read", "Look in\nthe back"})
		if choice == 2 then
			cutscene:text("* (The author's name is written\nin the back.)")
			cutscene:text("* (However, [wait:5]for some strange reason...)")
			cutscene:text("* (The more you try to focus on it, [wait:5]the more your head hurts.)")
		else
			cutscene:text("* I believe that there is a very slim chance of SOULS, [wait:5]perhaps, [wait:5]being \"pre-programmed\".")
			cutscene:text("* By some higher force, [wait:5]maybe?\n[wait:5]* Hoping that we can shine the SOUL's power onto the world...")
			cutscene:text("* What kind of power would that be? [wait:5]Would we have any say in\nthe matter?")
			cutscene:text("* ...[wait:5]Well. [wait:5]This book was supposed to be purely informative.")
			cutscene:text("* Excuse the sudden theorizing. [wait:5]Now, [wait:5]back to our research on SOULS and their odd nature...")
		end
    end,
}