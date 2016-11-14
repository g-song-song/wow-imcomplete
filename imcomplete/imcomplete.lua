local frame, events = CreateFrame("Frame"), {};
if GetLocale() == "koKR" then
    q = {
      -- 히어로즈 오브 더 스톰
      "이제 난 완전히 졌다!",
      "이제 난 완전해졌다!",
      "만 년 동안 응어리진 증오를 보여주마!",
      "너흰 아직 준비가 안 됐다!",
      "이제 너희는 준비가 돼-따!",
      "나의 증오는 끝이 없다!",
      "복수는 나의 것이다!",
      "나에겐 오직 증오뿐!",
      "아지노스의 칼날 맛을 봐라!",
      "아지노스의 화염으로 불살라주마!",
      -- 일리다리
      "난 모든 것을 희생했다!"
    }
else
    q = {
      -- Heroes of the storm
      "Now, I am complete!",
      "Feel the hatred of ten thousand years!",
      "You are not prepared!",
      "Now, you are prepared!",
      "My hatred is unending!",
      "Vengeance is mine!",
      "I feed only hatred!",
      "Taste the blade of Azzinoth!",
      "Burn with the flames of Azzinoth!",
      -- Illidari
      "I've sacrified everythiing!"
    }
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
            i = random(l)
            SendChatMessage(q[i], "SAY")
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
