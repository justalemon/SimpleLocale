LanguageIDs = {
    [0] = "en-US",
    [1] = "fr-FR",
    [2] = "de-DE",
    [3] = "it-IT",
    [4] = "es-ES",
    [5] = "pt-BR",
    [6] = "pl-PL",
    [7] = "ru-RU",
    [8] = "ko-KR",
    [9] = "zh-TW",
    [10] = "ja-JP",
    [11] = "es-MX",
    [12] = "zh-CN"
}

local labels = {}

local function getLocale()
    return GetConvar("locale", "en-US")
end

local function getLanguage(locale)
    if locale == nil then
        locale = getLocale()
    end

    local lang = Split(locale, "-")[1]

    if lang == nil then
        return "en"
    else
        return lang
    end
end

local function loadLanguage(resource, language)
    local file = "i18n" .. "/" .. language .. ".json"
    local contents = LoadResourceFile(resource, file)

    if contents == nil then
        Debug("File " .. file .. " for language " .. language .. " is missing")
        return nil
    end

    local parsed = json.decode(contents)

    if type(parsed) == "table" then
        return parsed
    else
        print("Invalid language file for " .. language)
        Debug("Expected table for language file " .. file .. ", got " .. type(parsed))
        return nil
    end
end

function Load(resource, baseLocale)
    local possibleLocales = {
        baseLocale,
        getLanguage(baseLocale),
        "en-US",
        "en"
    }

    if labels[resource] == nil then
        labels[resource] = {}
    end

    local localizedLabels

    for _, locale in ipairs(possibleLocales) do
        Debug("Attempting to load " .. locale .. " for " .. resource)
        localizedLabels = loadLanguage(resource, locale)

        if localizedLabels == nil then
            labels[resource][locale] = {}
        else
            labels[resource][locale] = localizedLabels
            break
        end
    end

    if localizedLabels == nil then
        print("Couldn't load ANY locale files for resource " .. resource)
        return false
    else
        return true
    end
end

Locale = getLocale()
Language = getLanguage(Locale)
