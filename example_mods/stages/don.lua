function onCreate()
	-- background shit
	makeLuaSprite('Lau_background', 'don/Lau_background', -810, -15);
	setLuaSpriteScrollFactor('Lau_background', 0.9, 0.9);
	scaleObject('Lau_background', 0.8, 0.8);
	addLuaSprite('Lau_background', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end