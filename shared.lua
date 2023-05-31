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

Locale = getLocale()
Language = getLanguage(Locale)
