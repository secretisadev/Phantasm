if getgenv().niggaexecutedthisscript then
    return
end

warn("[1] ran")

getgenv().niggaexecutedthisscript = true

local hiddenUI = gethui()
local protectgui = protectgui or function(x) end

function randomString(length)
	local length = length or math.random(3,20)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

-- local GUI = game:GetObjects('rbxassetid://120096337976497')[1]

warn("[2] downloading")

if not isfile("phantasm test 2.rbxm") then
    writefile("phantasm test 2.rbxm", request({Url = "https://github.com/secretisadev/Phantasm/raw/refs/heads/main/phantasm%20test 2.rbxm", Method = "GET"}).Body)
end

warn("[3] getting ui")

local GUI = game:GetObjects(getcustomasset("phantasm test 2.rbxm"))[1]
warn("[4] got ui")
-- protectgui(GUI)
GUI.Name = "TEMPORARY UI UI UI UI"
warn("[5] parenting ui to hidden ui")
GUI.Parent = hiddenUI

warn("[6] starting ui")

local Library = loadstring(GUI.Library.Source)()
Library:Initialize(GUI)

warn("[7] creating popup")

local Popup = Library:Popup({
	Title = "NOTICE",
	Text = "FOR MY FUTURE (AND BETTER) SCRIPTS JOIN " .. Library:ColorText(255, 255, 255, "https://discord.gg/E7NK8mekrQ", true) .. "\n\nPhantasm is a script made by me when I was 15, the last " .. Library:ColorText(255, 255, 255, "major", true) .. " update made to it was around " .. Library:ColorText(255, 255, 255, "April of 2025 (over a year ago)", true) .. ", and it's getting patched on " .. Library:ColorText(255, 255, 255, "May 16th 2026", true) .. " due to TSB's next update including an anticheat.\n\nAt the time, I added execution logs. My original idea was to log regional data in order to compare users with blacklisted users, however, I had been a bit too " .. Library:ColorText(255, 255, 255, "excessive", true) .. " at the time and didn't put much thought into it.\n\nDue to lacking a viable obfuscator and funds, I can't remove the execution logs or update the script at all at the moment. I could've done it a long time ago, but I ignored the opportunity while I had it.\n\nRest assured, I don't have your IP, and I wouldn't take a plane to your country and knock on a billion houses to check for a phantasm user.\n\n" .. Library:ColorText(255, 255, 255, "By pressing 'OK' to execute this script, you acknowledge and consent to data such as your roblox username, country, region, timezone, etc.. being logged. You can prevent sending this data at any time by using another script to block the POST request.", true)
})

Popup:AddButton({
	Name = "OK",
	Callback = function()
        Popup:Close()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/secretisadev/Phantasm/refs/heads/main/Loader.lua"))()
	end
})

Popup:AddButton({
	Name = "CANCEL",
	Callback = function()
		Popup:Close()
	end
})

warn("[8] done")
