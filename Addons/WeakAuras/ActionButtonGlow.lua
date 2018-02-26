local function debug(msg) DEFAULT_CHAT_FRAME:AddMessage("[ABG] " .. tostring(msg), 1, 1, 0); end

-- texture coordinates for IconAlertAnts
local ABG_AntTexCoords = {
	{0.0078125, 0.1796875, 0.00390625, 0.17578125}, {0.1953125, 0.3671875, 0.00390625, 0.17578125}, {0.3828125, 0.5546875, 0.00390625, 0.17578125}, {0.5703125, 0.7421875, 0.00390625, 0.17578125}, {0.7578125, 0.9296875, 0.00390625, 0.17578125}, 
	{0.0078125, 0.1796875, 0.19140625, 0.36328125}, {0.1953125, 0.3671875, 0.19140625, 0.36328125}, {0.3828125, 0.5546875, 0.19140625, 0.36328125}, {0.5703125, 0.7421875, 0.19140625, 0.36328125}, {0.7578125, 0.9296875, 0.19140625, 0.36328125}, 
	{0.0078125, 0.1796875, 0.37890625, 0.55078125}, {0.1953125, 0.3671875, 0.37890625, 0.55078125}, {0.3828125, 0.5546875, 0.37890625, 0.55078125}, {0.5703125, 0.7421875, 0.37890625, 0.55078125}, {0.7578125, 0.9296875, 0.37890625, 0.55078125}, 
	{0.0078125, 0.1796875, 0.56640625, 0.73828125}, {0.1953125, 0.3671875, 0.56640625, 0.73828125}, {0.3828125, 0.5546875, 0.56640625, 0.73828125}, {0.5703125, 0.7421875, 0.56640625, 0.73828125}, {0.7578125, 0.9296875, 0.56640625, 0.73828125}, 
	{0.0078125, 0.1796875, 0.75390625, 0.92578125}, {0.1953125, 0.3671875, 0.75390625, 0.92578125}, {0.3828125, 0.5546875, 0.75390625, 0.92578125}, {0.5703125, 0.7421875, 0.75390625, 0.92578125}, {0.7578125, 0.9296875, 0.75390625, 0.92578125}, 
};

local function ABG_NextIndex(index)
	-- we don't need all texture frames for the animation (only 1 to 22)
	if ( index == 22 ) then
		return 1;
	end

	return index + 1;
end

local ABG_unusedOverlayGlows = {}; -- pool 
local ABG_numOverlays = 0;
local function ABG_GetOverlay()
       local overlay = tremove(ABG_unusedOverlayGlows); -- check if a frame from the pool can be used
       if ( not overlay ) then
               ABG_numOverlays = ABG_numOverlays + 1;

               overlay = CreateFrame("Frame", "ActionButtonOverlay"..ABG_numOverlays);
	       overlay:SetFrameStrata("TOOLTIP");

	       overlay.background = overlay:CreateTexture(nil, "BACKGROUND");
	       overlay.background:SetTexture("Interface\\AddOns\\WeakAuras\\UI\\IconAlert.tga");
	       overlay.background:SetTexCoord(0.0546875, 0.4609375, 0.30078125, 0.50390625);
	       overlay.background:SetBlendMode("ADD");
	       overlay.background:SetAllPoints(overlay);

	       overlay.glow = overlay:CreateTexture(nil, "MEDIUM");
	       overlay.glow:SetTexture("Interface\\AddOns\\WeakAuras\\UI\\IconAlertAnts.tga");
	       overlay.glow:SetTexCoord(ABG_AntTexCoords[1][1], ABG_AntTexCoords[1][2], ABG_AntTexCoords[1][3], ABG_AntTexCoords[1][4]);
	       overlay.glow:SetAllPoints(overlay);
       end
       return overlay;
end

local ABG_traceLength = 3;
local ABG_updateInterval = 0.04; -- use 25 Hz 
function ABG_AddOverlay(button, overflowX, overflowY)
	if not button then
		error("ABG_AddOverlay called with nil argument.", ABG_traceLength);
	end

	overflowX = overflowX or 0;
	overflowY = overflowY or 0;

	if not button.overlay then
		-- initiate new animation
		button.overlay = ABG_GetOverlay();
		button.overlay:SetParent(button);
		button.overlay:SetWidth(button:GetWidth() + (overflowX * 2));
		button.overlay:SetHeight(button:GetHeight() + (overflowY * 2));
		button.overlay:SetPoint("TOPLEFT", button, "TOPLEFT", -overflowX, overflowY);
		button.overlay.index = 1;
		button.overlay.lastUpdated = 0;

		button.overlay:Show(); 

	       button.overlay:SetScript("OnUpdate", function()
	       		button.overlay.lastUpdated = button.overlay.lastUpdated + arg1 -- elapsed

			if (button.overlay.lastUpdated > ABG_updateInterval) then
		       		local index = ABG_NextIndex(button.overlay.index);
		       		button.overlay.index = index;
				button.overlay.glow:SetTexCoord(ABG_AntTexCoords[index][1], ABG_AntTexCoords[index][2], ABG_AntTexCoords[index][3], ABG_AntTexCoords[index][4]);

				button.overlay.lastUpdated = 0;
			end
	       end);
	end
end

function ABG_RemoveOverlay(button)
	if not button then
		error("ABG_RemoveOverlay called with nil argument.", ABG_traceLength);
	end

	if button.overlay then
		-- use temporary reference to reset overlay BEFORE putting it back in the pool
		local overlay = button.overlay;

		button.overlay:SetScript("OnUpdate", nil);
		button.overlay:Hide();
		button.overlay:SetParent(UIParent);
		button.overlay = nil;

		-- put the frame into the pool to reuse it in the future
		tinsert(ABG_unusedOverlayGlows, overlay);

	end
end