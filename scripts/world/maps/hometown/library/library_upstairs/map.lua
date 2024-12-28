local LibraryUpstairs, super = Class(Map)

function LibraryUpstairs:load()
  super:load(self)
  self.old_party = Utils.copy(Game.party) -- keep track of what the party list was before you entered the room
  Game.party = {"kris"}
end

function LibraryUpstairs:onExit()
  Game.party = self.old_party
end

return LibraryUpstairs