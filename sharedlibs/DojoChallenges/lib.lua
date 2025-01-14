local lib = {}
ChallengeLib = lib

function lib:onRegistered()
    self.challenges = {}
    
    for _, path, challenge in Registry.iterScripts("challenges") do
        assert(challenge ~= nil, '"challenge/' .. path .. '.lua" does not return value')
        challenge.id = challenge.id or path
        self.challenges[challenge.id] = challenge
    end
end

function lib:createChallenge(id, ...)
    if self.challenges[id] then
        return self.challenges[id](...)
    else
        error("Attempt to create nonexistent challenge \"" .. tostring(id) .. "\"")
    end
end

return lib