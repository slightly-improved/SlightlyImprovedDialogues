-- Slightly Improved™ Dialogues 1.2.1 (Feb 11 2017)
-- Licensed under MIT © 2017 Arthur Corenzan

local NAMESPACE = "SlightlyImprovedDialogues"

local settings = {}

local panel =
{
    type = "panel",
    name = "Slightly Improved™ Dialogues",
    displayName = "Slightly Improved™ Dialogues",
    author = nil,
    version = nil,
}

local options =
{
    {
        type = "checkbox",
        name = "Unlocked camera",
        tooltip = "Prevent the game from locking the camera on the NPC you're talking to.",
        getFunc = function() return settings.unlockCamera end,
        setFunc = function(value) settings.unlockCamera = value end,
    }, {
        type = "checkbox",
        name = "Goodbye greyed out by default",
        tooltip = "Make the goodbye option always appear faded.",
        getFunc = function() return settings.goodbyeAlwaysSeen end,
        setFunc = function(value) settings.goodbyeAlwaysSeen = value end,
    },
}

CALLBACK_MANAGER:RegisterCallback(NAMESPACE.."_OnAddOnLoaded", function(savedVars)
    settings = savedVars

    local LAM = LibStub("LibAddonMenu-2.0")
    LAM:RegisterAddonPanel(NAMESPACE, panel)
    LAM:RegisterOptionControls(NAMESPACE, options)
end)
