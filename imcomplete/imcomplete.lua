local frame, events = CreateFrame("Frame"), {};
activated = false
function events:UNIT_AURA(...)
    found = false
    for i = 1, 40 do
        name, _, _, _, _, d, e, _, _, _, spellid = UnitAura("player", i)
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
            r = e - GetTime()
            q = {"이제 난 완전히 졌다!",
                 "이제 난 완전해졌다!",
                 "만 년 동안 응어리진 증오를 보여주마!",
                 "너흰 아직 준비가 안 됐다!",
                 "이제 너희는 준비가 돼-따!"}
            i = random(5)
            SendChatMessage(q[i])
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
