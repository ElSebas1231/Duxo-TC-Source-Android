function onCreate()
	-- background shit
	makeLuaSprite('creisi14_03', 'creisibg/creisi14_03', -220, -120);
	setLuaSpriteScrollFactor('creisi14_03', 0.9, 0.9);
	scaleObject('creisi14_03', 0.75, 0.75);
	addLuaSprite('creisi14_03', false);

	makeLuaSprite('creisi14_02', 'creisibg/creisi14_02', -240, -120);
	setLuaSpriteScrollFactor('creisi14_02', 0.9, 0.9);
	scaleObject('creisi14_02', 0.75, 0.75);
	addLuaSprite('creisi14_02', false);

	makeLuaSprite('creisi14_01', 'creisibg/creisi14_01', -240, -120);
	setLuaSpriteScrollFactor('creisi14_01', 0.9, 0.9);
	scaleObject('creisi14_01', 0.75, 0.75);
	addLuaSprite('creisi14_01', false);

	makeLuaSprite('creisi14_00', 'creisibg/creisi14_00', -230, -130);
	setLuaSpriteScrollFactor('creisi14_00', 1, 1);
	scaleObject('creisi14_00', 0.75, 0.75);
	addLuaSprite('creisi14_00', false);

	if lowQuality then
		removeLuaSprite('creisi14_02')
		removeLuaSprite('creisi14_01')
	end
end