local _, L = ...;
local frame, events = CreateFrame("Frame"), {};
q ={}
i = 1
  -- Heroes of the storm
q[i] = {L["Now, I am completely defeated!"], nil}; i = i + 1;
q[i] = {L["Now, I am complete!"], "now-i-am-complete.ogg"}; i = i + 1
q[i] = {L["Feel the hatred of ten thousand years!"], "feel-the-hatred-of-ten-thousand-years.ogg"}; i = i + 1
q[i] = {L["You are not prepared!"], "you-are-not-prepared.ogg"}; i = i + 1
q[i] = {L["Now, you are prepared!"], nil}; i = i + 1
q[i] = {L["My hatred is unending!"], "my-hatred-is-unending.ogg"}; i = i + 1
q[i] = {L["Vengeance is mine!"], "vengeance-is-mine.ogg"}; i = i + 1
q[i] = {L["I feel only hatred!"], "i-feel-only-hatred.ogg"}; i = i + 1
q[i] = {L["Taste the blade of Azzinoth!"], "taste-the-blade-of-azzinoth.ogg"}; i = i + 1
q[i] = {L["Burn with the flames of Azzinoth!"], "burn-with-the-flames-of-azzinoth.ogg"}; i = i + 1
-- Illidari
q[i] = {L["I've sacrified everythiing!"], nil}; i = i + 1
-- Illidan, the Champion of the Light
q[i] = {L["Now mortals, follow me into the Abyss!"], nil}; i = i + 1
l = table.getn(q)
activated = false
function events:UNIT_AURA(...)
    found = false
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
            while true do
              i = random(l)
              if q[i][1] then
                break;
              end
            end
            SendChatMessage(q[i][1], "SAY")
            voice = q[i][2]
            fname = "Interface\\Addons\\imcomplete\\voice\\" .. GetLocale() .. "\\" .. voice;
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
