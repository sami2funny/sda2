local TextChatService = game:GetService("TextChatService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local INVISIBLE_CHAR = "\u{001E}"
local NEWLINE = "\u{000D}"

local swastikaPattern = INVISIBLE_CHAR .. string.rep(NEWLINE, 10) ..
    "⬜⬜⬜⬜⬜⬜⬜" .. NEWLINE ..
    "⬜⬛⬜⬛⬛⬛⬜" .. NEWLINE ..
    "⬜⬛⬜⬛⬜⬜⬜" .. NEWLINE ..
    "⬜⬛⬛⬛⬛⬛⬜" .. NEWLINE ..
    "⬜⬜⬜⬛⬜⬛⬜" .. NEWLINE ..
    "⬜⬛⬛⬛⬜⬛⬜" .. NEWLINE ..
    "⬜⬜⬜⬜⬜⬜⬜"

local function chatMessage(str)
    str = tostring(str)
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local generalChannel = TextChatService:FindFirstChild("TextChannels"):FindFirstChild("RBXGeneral")
        if generalChannel then
            generalChannel:SendAsync(str)
        else
            warn("RBXGeneral channel not found!")
        end
    else
        local chatEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents"):FindFirstChild("SayMessageRequest")
        if chatEvent then
            chatEvent:FireServer(str, "All")
        else
            warn("DefaultChatSystemChatEvents not found!")
        end
    end
end

-- Execute the swastika pattern
chatMessage(swastikaPattern)
