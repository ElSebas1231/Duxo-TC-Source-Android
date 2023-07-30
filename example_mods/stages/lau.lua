function onCreate()
	-- background shit
	makeLuaSprite('Lau_background', 'lau/Lau_background', -900, -28);
	setLuaSpriteScrollFactor('Lau_background', 1, 1);
	scaleObject('Lau_background', 0.8, 0.7);
	addLuaSprite('Lau_background', false);
end