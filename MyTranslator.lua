--[[ 
    MyTranslator.lua
    This add-on translates Chinese phrases in party chat to English using a predefined translation table.
--]]

-- Translation table: Maps common Chinese phrases to English.
local chineseTranslationTable = {
    -- General chat phrases
    ["你好"] = "Hello",
    ["谢谢"] = "Thank you",
    ["队伍"] = "Party",
    ["战斗"] = "Battle",
    ["治疗"] = "Heal",
    ["坦克"] = "Tank",
    ["输出"] = "DPS",
    ["帮忙"] = "Help",
    ["集合"] = "Gather",

    -- Auction House phrases
    ["拍卖行"] = "Auction House",
    ["购买"] = "Buy",
    ["出售"] = "Sell",
    ["价格"] = "Price",
    ["金币"] = "Gold",
    ["银币"] = "Silver",
    ["铜币"] = "Copper",
    ["最低价"] = "Lowest Price",
    ["一口价"] = "Buyout",
    ["竞标"] = "Bid",
    ["搜索"] = "Search",
    ["物品"] = "Item",
    ["装备"] = "Gear",
    ["武器"] = "Weapon",
    ["材料"] = "Material",
    ["药水"] = "Potion",
    ["草药"] = "Herb",
    ["矿石"] = "Ore",
    ["配方"] = "Recipe",
    ["图纸"] = "Blueprint",
    ["稀有"] = "Rare",
    ["史诗"] = "Epic",
    ["传奇"] = "Legendary",
    ["购买中"] = "Buying",
    ["出售中"] = "Selling",
    ["便宜"] = "Cheap",
    ["贵"] = "Expensive",
    ["刷新"] = "Refresh",
    ["交易"] = "Trade",
    ["折扣"] = "Discount",
    ["库存"] = "Stock",
    ["需求"] = "Demand",
    ["供应"] = "Supply",
    ["热门"] = "Hot",
    ["抢购"] = "Quick Buy",
    ["列表"] = "List",
    ["历史价格"] = "Price History",
    ["趋势"] = "Trend",
    ["已售出"] = "Sold",
    ["未售出"] = "Unsold",
}

-- Function to detect if a message contains Chinese characters.
-- Chinese characters typically fall in the Unicode range \u4E00-\u9FFF.
local function containsChinese(text)
    return string.find(text, "[\u4E00-\u9FFF]")
end

-- Function to translate a message using the translation table.
local function translateChineseMessage(message)
    for chinese, english in pairs(chineseTranslationTable) do
        -- Replace all occurrences of the Chinese phrase with the English translation.
        message = string.gsub(message, chinese, english)
    end
    return message
end

-- Event handler for chat messages.
local function onChatMessage(self, event, message, sender, ...)
    -- Check if the message contains Chinese characters.
    if containsChinese(message) then
        -- Translate the message using the predefined table.
        local translatedMessage = translateChineseMessage(message)
        
        -- Print the translated message to the chat window.
        print("|cffffd700[Translated from Chinese]:|r " .. translatedMessage .. " (from " .. sender .. ")")
    end
end

-- Create a frame to listen for chat events.
local frame = CreateFrame("Frame")

-- Register events for party chat and party leader chat.
frame:RegisterEvent("CHAT_MSG_PARTY")
frame:RegisterEvent("CHAT_MSG_PARTY_LEADER")

-- Set the script to handle events using the `onChatMessage` function.
frame:SetScript("OnEvent", onChatMessage)
