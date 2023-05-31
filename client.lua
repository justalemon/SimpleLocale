local function getLocale()
    return Locale
end

local function getLanguage()
    return Language
end

local function getLabel(label)
    return GetLabel(GetInvokingResource(), label, Locale)
end

local function preload(locale)
    if locale == nil then
        locale = Locale
    end

    Load(GetCurrentResourceName(), locale)
end

exports("getLocale", getLocale)
exports("getLanguage", getLanguage)
exports("getLabel", getLabel)
exports("preload", preload)

local function initialize()
    local language = GetCurrentLanguage()
    TriggerServerEvent("simpleLocale:setClientKnownLanguage", language)
end

Citizen.CreateThread(initialize)
