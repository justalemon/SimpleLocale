local clientLanguages = {}

local function setClientKnownLanguage(langId)
    if type(langId) ~= "number" then
        return
    end

    local language = LanguageIDs[langId]

    if language == nil then
        Debug("Invalid lang id " .. tostring(langId) .. " for client " .. tostring(string) .. ", defaulting to en-US")
        language = "en-US"
    end

    clientLanguages[source] = language
    Debug("Received langId " .. language .. " for client " .. tostring(source))
end

local function playerDropped(_)
    clientLanguages[source] = nil
    Debug("Removed known language for player " .. tostring(source))
end

RegisterNetEvent("simpleLocale:setClientKnownLanguage", setClientKnownLanguage)
RegisterNetEvent("playerDropped", playerDropped)

local function getLabel(label)
    return GetLabel(GetInvokingResource(), label, Locale)
end

exports("getLabel", getLabel)
