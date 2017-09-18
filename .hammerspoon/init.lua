require "windows"

hs.hotkey.bind({"cmd", "alt"}, "T", function()
    hs.application.launchOrFocus("Terminal.app")
end)

hs.hotkey.bind({"ctrl", "shift"}, "Left", baseMove(0, 0, 0.5, 1))
