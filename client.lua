local function getLocale()
    return Locale
end

local function getLanguage()
    return Language
end

exports("getLocale", getLocale)
exports("getLanguage", getLanguage)

local function initialize()
    local language = GetCurrentLanguage()
    TriggerServerEvent("simpleLocale:setClientKnownLanguage", language)
end

Citizen.CreateThread(initialize)
