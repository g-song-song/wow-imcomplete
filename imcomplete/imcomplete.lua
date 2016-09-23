local frame, events = CreateFrame("Frame"), {};
if GetLocale() == "koKR" then
    q = {"이제 난 완전히 졌다!",
         "이제 난 완전해졌다!",
         "만 년 동안 응어리진 증오를 보여주마!",
         "너흰 아직 준비가 안 됐다!",
         "이제 너희는 준비가 돼-따!"}
else
    q = {"Now, I am complete!",
         "Feel the hatred of ten thousand years!",
         "You are not prepared!",
         "Now, you are prepared!"}
end
l = table.getn(q)
activated = false
function events:UNIT_AURA(...)
    found = false
    for i = 1, 40 do
        _, _, _, _, _, _, _, _, _, _, spellid = UnitAura("player", i)
        -- dps: 162264
        -- tank: 187827
        if spellid == 162264 or spellid == 187827 then
            found = true
            break
        end
    end
    if found then
        if activated == false then
            activated = true
            SendChatMessage(q[random(l)], "SAY")
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
