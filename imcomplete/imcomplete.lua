local frame, events = CreateFrame("Frame"), {};
activated = false
function events:UNIT_AURA(...)
    name, _, _, _, _, d, e = UnitAura("player", "탈태")
    if name then
        if activated == false then
            activated = true
            r = e - GetTime()
            q = {"이제 난 완전히 졌다!",
                 "만 년 동안 응어리진 증오를 보여주마!",
                 "너흰 아직 준비가 안 됐다!",
                 "이제 너희는 준비가 돼-따!"}
            i = random(4)
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
