local frame, events = CreateFrame("Frame"), {};
q ={}
i = 1
if GetLocale() == "koKR" then
    -- 히어로즈 오브 더 스톰
    q[i] = {"이제 난 완전히 졌다!", nil}; i = i + 1
    q[i] = {"이제 난 완전해졌다!", "now-i-am-complete.ogg"}; i = i + 1
    q[i] = {"만 년 동안 응어리진 증오를 보여주마!", "feel-the-hatred-of-ten-thousand-years.ogg"}; i = i + 1
    q[i] = {"너흰 아직 준비가 안 됐다!", "you-are-not-prepared.ogg"}; i = i + 1
    q[i] = {"이제 너희는 준비가 돼-따!", nil}; i = i + 1
    q[i] = {"나의 증오는 끝이 없다!", "my-hatred-is-unending.ogg"}; i = i + 1
    q[i] = {"복수는 나의 것이다!", "vengeance-is-mine.ogg"}; i = i + 1
    q[i] = {"나에겐 오직 증오뿐!", "i-feel-only-hatred.ogg"}; i = i + 1
    q[i] = {"아지노스의 칼날 맛을 봐라!", "taste-the-blade-of-azzinoth.ogg"}; i = i + 1
    q[i] = {"아지노스의 화염으로 불살라주마!", "burn-with-the-flames-of-azzinoth.ogg"}; i = i + 1
    -- 일리다리
    q[i] = {"난 모든 것을 희생했다!", nil}; i = i + 1
    -- 살아단님이 일리계신다!!!
    q[i] = {"필멸자여, 따라와라 심연 속으로!", nil}; i = i + 1
else
    -- Heroes of the storm
    q[i] = {"Now, I am complete!", "now-i-am-complete.ogg"}; i = i + 1
    q[i] = {"Feel the hatred of ten thousand years!", "feel-the-hatred-of-ten-thousand-years.ogg"}; i = i + 1
    q[i] = {"You are not prepared!", "you-are-not-prepared.ogg"}; i = i + 1
    q[i] = {"Now, you are prepared!", nil}; i = i + 1
    q[i] = {"My hatred is unending!", nil}; i = i + 1
    q[i] = {"Vengeance is mine!", nil}; i = i + 1
    q[i] = {"I feel only hatred!", nil}; i = i + 1
    q[i] = {"Taste the blade of Azzinoth!", nil}; i = i + 1
    q[i] = {"Burn with the flames of Azzinoth!", nil}; i = i + 1
    -- Illidari
    q[i] = {"I've sacrified everythiing!", nil}; i = i + 1
    -- Illidan, the Champion of the Light
    q[i] = {"Now mortals, follow me into the Abyss!", nil}; i = i + 1
end
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
            i = random(l)
            SendChatMessage(q[i][1], "SAY")
            voice = q[i][2]
            if voice then
              PlaySoundFile("Interface\\Addons\\imcomplete\\voice\\" .. GetLocal() .. "\\" .. voice)
            end
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
