local function nextIdx(q)
  return table.getn(q) + 1;
end

local _, L = ...;
local frame, events = CreateFrame("Frame"), {};
local q ={}
  -- Heroes of the storm
q[nextIdx(q)] = {L["Now, I am completely defeated!"], nil};
q[nextIdx(q)] = {L["Now, I am complete!"], "now-i-am-complete.ogg"};
q[nextIdx(q)] = {L["Feel the hatred of ten thousand years!"], "feel-the-hatred-of-ten-thousand-years.ogg"};
q[nextIdx(q)] = {L["You are not prepared!"], "you-are-not-prepared.ogg"};
q[nextIdx(q)] = {L["Now, you are prepared!"], nil};
q[nextIdx(q)] = {L["My hatred is unending!"], "my-hatred-is-unending.ogg"};
q[nextIdx(q)] = {L["Vengeance is mine!"], "vengeance-is-mine.ogg"};
q[nextIdx(q)] = {L["I feel only hatred!"], "i-feel-only-hatred.ogg"};
q[nextIdx(q)] = {L["Taste the blade of Azzinoth!"], "taste-the-blade-of-azzinoth.ogg"};
q[nextIdx(q)] = {L["Burn with the flames of Azzinoth!"], "burn-with-the-flames-of-azzinoth.ogg"};
-- Illidari
q[nextIdx(q)] = {L["I've sacrified everythiing!"], nil};
-- Illidan, the Champion of the Light
q[nextIdx(q)] = {L["Now mortals, follow me into the Abyss!"], nil};
local l = table.getn(q)
local activated = false
function events:UNIT_AURA(...)
    local found = false
    for i = 1, 40 do
        _, _, _, _, _, _, _, _, _, _, spellid = UnitAura("player", i)
        -- dps: 162264
        -- tank: 187827
        --  immolation aura: 178740 (for debugging)
        if spellid == 162264 or spellid == 187827 then
        -- if spellid == 178740 then
            found = true
            break
        end
    end
    if found then
        if activated == false then
            activated = true
            local i = nil;
            while true do
              i = random(l)
              if q[i][1] then
                break;
              end
            end
            SendChatMessage(q[i][1], "SAY")
            local fname = "Interface\\Addons\\imcomplete\\voice\\" .. GetLocale() .. "\\" .. q[i][2];
            -- pcall suppresses error if file does not exist
            pcall(PlaySoundFile, fname)
        end
    else
        activated = false
    end
end
frame:SetScript("OnEvent", function(self, event, ...)
    events[event](self, ...); -- call one of the functions above
end);
for k, v in pairs(events) do
    frame:RegisterEvent(k); -- Register all events for which handlers have been defined
end
