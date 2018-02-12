-- IMPORTANT -- the name of any action bar must be the prefix of its buttons, e.g. "BonusAction" -> BonusActionButton1 to allow for purging by prefix
local ABD_ActionBars = {
	["DEFAULT_UI"] = {
		["Action"] = {
			ActionButton1,
			ActionButton2,
			ActionButton3,
			ActionButton4,
			ActionButton5,
			ActionButton6,
			ActionButton7,
			ActionButton8,
			ActionButton9,
			ActionButton10,
			ActionButton11,
			ActionButton12
		},
		["BonusAction"] = {
			BonusActionButton1,
			BonusActionButton2,
			BonusActionButton3,
			BonusActionButton4,
			BonusActionButton5,
			BonusActionButton6,
			BonusActionButton7,
			BonusActionButton8,
			BonusActionButton9,
			BonusActionButton10,
			BonusActionButton11,
			BonusActionButton12
		},
		["MultiBarLeft"] = {
			MultiBarLeftButton1,
			MultiBarLeftButton2,
			MultiBarLeftButton3,
			MultiBarLeftButton4,
			MultiBarLeftButton5,
			MultiBarLeftButton6,
			MultiBarLeftButton7,
			MultiBarLeftButton8,
			MultiBarLeftButton9,
			MultiBarLeftButton10,
			MultiBarLeftButton11,
			MultiBarLeftButton12
		},
		["MultiBarRight"] = {
			MultiBarRightButton1,
			MultiBarRightButton2,
			MultiBarRightButton3,
			MultiBarRightButton4,
			MultiBarRightButton5,
			MultiBarRightButton6,
			MultiBarRightButton7,
			MultiBarRightButton8,
			MultiBarRightButton9,
			MultiBarRightButton10,
			MultiBarRightButton11,
			MultiBarRightButton12
		},
		["MultiBarBottomLeft"] = {
			MultiBarBottomLeftButton1,
			MultiBarBottomLeftButton2,
			MultiBarBottomLeftButton3,
			MultiBarBottomLeftButton4,
			MultiBarBottomLeftButton5,
			MultiBarBottomLeftButton6,
			MultiBarBottomLeftButton7,
			MultiBarBottomLeftButton8,
			MultiBarBottomLeftButton9,
			MultiBarBottomLeftButton10,
			MultiBarBottomLeftButton11,
			MultiBarBottomLeftButton12
		},
		["MultiBarBottomRight"] = {
			MultiBarBottomRightButton1,
			MultiBarBottomRightButton2,
			MultiBarBottomRightButton3,
			MultiBarBottomRightButton4,
			MultiBarBottomRightButton5,
			MultiBarBottomRightButton6,
			MultiBarBottomRightButton7,
			MultiBarBottomRightButton8,
			MultiBarBottomRightButton9,
			MultiBarBottomRightButton10,
			MultiBarBottomRightButton11,
			MultiBarBottomRightButton12
		}
	}, -- DEFAULT_UI
	["ZBAR"] = {
		["zBar1"] = {

		}
	},
};

local ABD_ClassIndices = {
	["DRUID"] = {
		["Cat"] = {73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84},
		["Bear"] = {97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108},
		["Dire Bear"] = {97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108},
	},
	["WARRIOR"] = {
		["Battle"] = {73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84},
		["Defensive"] = {85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96},
		["Berserker"] = {97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108},
	},
}

function ABD_ClassValues()
	local _, class = UnitClass("player"); -- english class uppercase, e.g. "WARRIOR"

	return ABD_ClassIndices[class];
end

function ABD_Profile(profile)
	if not ABD_ActionBars[profile] then
		error("no such profile: " .. profile, 3);
	end

	return ABD_ActionBars[profile];
end

function ABD_MainStanceBars(profile)
	return "Action", "BonusAction";
end

function ABD_SlotNumber(slotId)
	return math.mod(slotId - 1, 12) + 1;
end