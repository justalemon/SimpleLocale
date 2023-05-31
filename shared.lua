function GetCurrentLocale()
    return GetConvar("locale", "en-US")
end

function GetCurrentLanguage()
    local lang = Split(GetCurrentLocale(), "-")[1]

    if lang == nil then
        return "en"
    else
        return lang
    end
end

function LoadLanguageForResource(resource, language)
    local file = "i18n" .. "/" .. language .. ".json"
    local contents = LoadResourceFile(resource, file)

    if contents == nil then
        print("Language " .. language .. " was not found")
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
