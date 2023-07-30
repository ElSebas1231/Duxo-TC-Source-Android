function onCreate()
	-- background shit
	makeLuaSprite('week_13', 'nemo/week_13', -460, 80);
	setLuaSpriteScrollFactor('week_13', 1, 1);
	scaleObject('week_13', 0.9, 0.9);
	addLuaSprite('week_13', false);
		
	makeAnimatedLuaSprite('week_13BG', 'nemo/week_13BG', -530, 180);
	scaleObject('week_13BG', 1.8, 1.4);
	addLuaSprite('week_13BG', false);
	addAnimationByPrefix('week_13BG', 'idle', 'zets', 24, true);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end