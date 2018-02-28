local Backport = {};
Backport.frame = CreateFrame("frame");

function wipe (tab)
  for k,v in pairs(tab) do tab[k]=nil end
  return tab;
end

function print (arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19, arg20)
  if (arg1 or arg2 or arg3 or arg4 or arg5 or arg6 or arg7 or arg8 or arg9 or arg10 or arg11 or arg12 or arg13 or arg14 or arg15 or arg16 or arg17 or arg18 or arg19 or arg20) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg1)) end
  if (arg2 or arg3 or arg4 or arg5 or arg6 or arg7 or arg8 or arg9 or arg10 or arg11 or arg12 or arg13 or arg14 or arg15 or arg16 or arg17 or arg18 or arg19 or arg20) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg2)) end
  if (arg3 or arg4 or arg5 or arg6 or arg7 or arg8 or arg9 or arg10 or arg11 or arg12 or arg13 or arg14 or arg15 or arg16 or arg17 or arg18 or arg19 or arg20) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg3)) end
  if (arg4 or arg5 or arg6 or arg7 or arg8 or arg9 or arg10 or arg11 or arg12 or arg13 or arg14 or arg15 or arg16 or arg17 or arg18 or arg19 or arg20) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg4)) end
  if (arg5 or arg6 or arg7 or arg8 or arg9 or arg10 or arg11 or arg12 or arg13 or arg14 or arg15 or arg16 or arg17 or arg18 or arg19 or arg20) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg5)) end
  if (arg6 or arg7 or arg8 or arg9 or arg10 or arg11 or arg12 or arg13 or arg14 or arg15 or arg16 or arg17 or arg18 or arg19 or arg20) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg6)) end
  if (arg7 or arg8 or arg9 or arg10 or arg11 or arg12 or arg13 or arg14 or arg15 or arg16 or arg17 or arg18 or arg19 or arg20) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg7)) end
  if (arg8 or arg9 or arg10 or arg11 or arg12 or arg13 or arg14 or arg15 or arg16 or arg17 or arg18 or arg19 or arg20) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg8)) end
  if (arg9 or arg10 or arg11 or arg12 or arg13 or arg14 or arg15 or arg16 or arg17 or arg18 or arg19 or arg20) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg9)) end
  if (arg10 or arg11 or arg12 or arg13 or arg14 or arg15 or arg16 or arg17 or arg18 or arg19 or arg20) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg10)) end
  if (arg11 or arg12 or arg13 or arg14 or arg15 or arg16 or arg17 or arg18 or arg19 or arg20) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg11)) end
  if (arg12 or arg13 or arg14 or arg15 or arg16 or arg17 or arg18 or arg19 or arg20) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg12)) end
  if (arg13 or arg14 or arg15 or arg16 or arg17 or arg18 or arg19 or arg20) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg13)) end
  if (arg14 or arg15 or arg16 or arg17 or arg18 or arg19 or arg20) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg14)) end
  if (arg15 or arg16 or arg17 or arg18 or arg19 or arg20) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg15)) end
  if (arg16 or arg17 or arg18 or arg19 or arg20) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg16)) end
  if (arg17 or arg18 or arg19 or arg20) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg17)) end
  if (arg18 or arg19 or arg20) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg18)) end
  if (arg19 or arg20) then DEFAULT_CHAT_FRAME:AddMessage(tostring(arg19)) end
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

function FindUncursed ()
end

function CountUncursed ()
end

function RevertCurseSelection ()
end

function UnitAura (unit, indexOrName, rank, filter)
  local newrank = (rank and string.gsub(string.gsub(string.gsub(string.gsub(string.gsub(string.gsub(rank, "|HELPFUL", ""), "HELPFUL|", ""), "HELPFUL", ""), "|HARMFUL", ""), "HARMFUL|", ""), "HARMFUL", "")) or nil;
  local newfilter = (filter and string.gsub(string.gsub(string.gsub(string.gsub(string.gsub(string.gsub(filter, "|HELPFUL", ""), "HELPFUL|", ""), "HELPFUL", ""), "|HARMFUL", ""), "HARMFUL|", ""), "HARMFUL", "")) or nil;

  if ((filter and string.find(filter, "HARMFUL")) or ((rank and string.find(rank, "HARMFUL")) and filter == nil)) then
    debuffType = "HARMFUL";
  elseif ((filter and string.find(filter, "HELPFUL")) or ((rank and string.find(rank, "HARMFUL")) and filter == nil)) then
    debuffType = "HELPFUL";
  else
    debuffType = nil;
  end
  
  local x;

  if (debuffType == "HELPFUL" or debuffType == nil) then
    local name, r, icon, count, duration, expirationTime = UnitBuff(unit, 1, newfilter);
    x = 1;
    while (name ~= nil) do
      if (name == indexOrName and (rank == nil or string.find(rank, "HARMFUL") or string.find(rank, "HELPFUL") or rank == r)) then
        return name, r, icon, count, debuffType, duration, GetTime() + (expirationTime or 0)
      end
      x = x + 1;
      name, r, icon, count, duration, expirationTime = UnitBuff(unit, x, newfilter);
    end
  end

  if (debuffType == "HARMFUL" or debuffType == nil) then
    local name, r, icon, count, duration, expirationTime = UnitDebuff(unit, 1, newfilter);
    x = 1;
    while (name ~= nil) do
      if (name == indexOrName and (rank == nil or string.find(rank, "HARMFUL") or string.find(rank, "HELPFUL") or rank == r)) then
        return name, r, icon, count, debuffType, duration, GetTime() + (expirationTime or 0)
      end
      x = x + 1;
      name, r, icon, count, duration, expirationTime = UnitDebuff(unit, x, newfilter);
    end
  end

  return nil;
end

Backport.frame:SetScript("OnEvent", function (self, event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19, arg20)
  if (eventHandlers[event]) then
    for i,v in ipairs(eventHandlers[event]) do
      table.insert(eventQueue, {
        handler = v;
        arguments = {
          ["arg1"] = arg1,
          ["arg2"] = arg2,
          ["arg3"] = arg3,
          ["arg4"] = arg4,
          ["arg5"] = arg5,
          ["arg6"] = arg6,
          ["arg7"] = arg7,
          ["arg8"] = arg8,
          ["arg9"] = arg9,
          ["arg10"] = arg10,
          ["arg11"] = arg11,
          ["arg12"] = arg12,
          ["arg13"] = arg13,
          ["arg14"] = arg14,
          ["arg15"] = arg15,
          ["arg16"] = arg16,
          ["arg17"] = arg17,
          ["arg18"] = arg18,
          ["arg19"] = arg19,
          ["arg20"] = arg20
        }
      })
    end
  end
end)