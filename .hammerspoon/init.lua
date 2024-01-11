local discordApp = "Discord"  -- Nome do aplicativo (pode variar)
local muteShortcut = {"cmd", "shift", "m"}  -- Teclas de atalho para mute

hs.hotkey.bind({"cmd", "shift"}, "m", function()
   -- Pega o Discord
   local myApp = hs.application.applicationsForBundleID('com.hnc.Discord')[1]
   
   hs.eventtap.keyStroke({"cmd", "shift"}, "m", 20, myApp)
end)

-- hs.hotkey.bind({}, "f1", "f1 hotkey", function() hs.eventtap.keyStroke({"cmd"}, "c") end)
-- hs.hotkey.bind({}, "f2", "f2 hotkey", function() hs.eventtap.keyStroke({"cmd"}, "v") end)