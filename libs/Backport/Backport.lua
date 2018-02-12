function wipe (tab)
  for k,v in pairs(tab) do tab[k]=nil end
  return tab;
end

function print (arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19, arg20)
  if (arg1) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg1)) end
  if (arg2) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg2)) end
  if (arg3) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg3)) end
  if (arg4) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg4)) end
  if (arg5) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg5)) end
  if (arg6) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg6)) end
  if (arg7) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg7)) end
  if (arg8) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg8)) end
  if (arg9) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg9)) end
  if (arg10) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg10)) end
  if (arg11) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg11)) end
  if (arg12) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg12)) end
  if (arg13) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg13)) end
  if (arg14) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg14)) end
  if (arg15) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg15)) end
  if (arg16) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg16)) end
  if (arg17) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg17)) end
  if (arg18) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg18)) end
  if (arg19) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg19)) end
  if (arg20) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg20)) end
end

local glow_frames = {}
function ActionButton_ShowOverlayGlow (button)
  ABG_AddOverlay(button, 6, 8);
end

function ActionButton_HideOverlayGlow (button)
  ABG_RemoveOverlay(button);
end

function GetInstanceInfo ()
  local difficulty = 1;
  local _, t = IsInInstance();
  if (GetInstanceDifficulty() == 2) then
    difficulty = 2;
  elseif (GetRealZoneText() == "Karazhan" or GetRealZoneText() == "Zul'Aman" or GetRealZoneText() == "Lower Blackrock Spire" or GetRealZoneText() == "Upper Blackrock Spire") then
    difficulty = 3;
  elseif (GetRealZoneText() == "Ruins of Ahn'Qiraj" or GetRealZoneText() == "Onyxia's Lair" or GetRealZoneText() == "Temple of Ahn'Qiraj" or GetRealZoneText() == "Zul'Gurub" or GetRealZoneText() == "Molten Core" or GetRealZoneText() == "Blackwing Lair" or GetRealZoneText() == "Naxxramas" or GetRealZoneText() == "Gruul's Lair" or GetRealZoneText() == "Magtheridon's Lair" or GetRealZoneText() == "Serpentshrine Cavern" or GetRealZoneText() == "Tempest Keep" or GetRealZoneText() == "Hyjal Past" or GetRealZoneText() == "Black Temple" or GetRealZoneText() == "The Sunwell") then
    difficulty = 4;
  end
  return 0, t, difficulty;
end

_G.wipe = wipe;