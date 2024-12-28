local GeneralUtils = {}

function GeneralUtils:breakString(startPattern, str, endPattern)
    -- Find where the startPattern ends and the endPattern begins
    local startIndex, startEnd = str:find(startPattern)
    if not startIndex then
        return nil, "Start pattern not found"
    end

    local endStart, endIndex = str:find(endPattern, startEnd + 1)
    if not endStart then
        return nil, "End pattern not found"
    end

    -- Extract the string between the patterns
    local result = str:sub(startEnd + 1, endStart - 1)
    return result
end

return GeneralUtils