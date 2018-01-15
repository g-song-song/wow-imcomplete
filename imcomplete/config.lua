local _, L = ...;

local channel_default = "SAY";
local playsound_default = true;

local configFrame = CreateFrame("Frame");
configFrame:RegisterEvent("ADDON_LOADED");
function configFrame:OnEvent(event, arg1)
  if event == "ADDON_LOADED" and arg1 == "imcomplete" then
    if channel == nil then
      channel = channel_default
    else
      if channel ~= "SAY" and channel "YELL" then
        channel = channel_default;
      end
    end
    if playsound == nil then
      playsound = playsound_default
    end
  end
  L.channel = channel;
  L.playchat = true;
  L.playsound = playsound;
end
configFrame:SetScript("OnEvent", configFrame.OnEvent);

SLASH_IMCOMPLETE1 = "/imc";
function SlashCmdList.IMCOMPLETE(msg)
  if msg == "chaton" then
    L.playchat = true;
  end
  if msg == "chatoff" then
    L.playchat = false;
  end
  if msg == "soundon" then
    L.playsound = true;
  end
  if msg == "soundoff" then
    L.playsound = false;
  end
  print(L["msg_channel"] .. ": " .. L[L.channel]);
  print(L["msg_playsound"] .. ": " .. L[tostring(L.playsound)]);
end
