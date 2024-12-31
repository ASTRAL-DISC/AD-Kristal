local RecruitPlace, super = Class(NPC, "recruitplace")

function RecruitPlace:init(data)
	self.actor = data.properties["actor"]

	super.init(self, self.actor, data.x, data.y, data.properties)

	self.recruit = Game:getRecruit(self.actor.id)

	self.x = self.x + self.recruit.place_offset[1]
	self.y = self.y + self.recruit.place_offset[2]

	-- checks who is across the table (for interactions. deltarune does this)
	self.adjacent = data.properties["adjacent"]
	
	-- DEBUG
	--[[print("")
	print("Recruit data:")
	print(Utils.dumpAll(self.recruit))
	print("")
	print("Object data:")
	print(Utils.dump(data.properties))]]
end

function RecruitPlace:setRecruit(recruit)
	self.recruit = Game:getRecruit(recruit)
	self:setActor(recruit)
	return recruit
end

-- Saves the last placed recruit from when reentering the room
function RecruitPlace:onAdd(parent)
    super.onAdd(self, parent)
	
	if self:getFlag("recruit") then
		self:setRecruit(self:getFlag("recruit", self.actor.id))
    end
end

function RecruitPlace:onInteract()
	if self.recruit then
		local cutscene = self.recruit.cafe_cutscene
		if cutscene then
			Game.world:startCutscene(cutscene, self, self.adjacent)
		end
	end
end

return RecruitPlace