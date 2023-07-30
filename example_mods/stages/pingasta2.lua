function onCreate()
	-- background shit
	makeLuaSprite('lucasta_02', 'pingasta/city_bg', -398, 0);
	setScrollFactor('lucasta_02', 0.9, 1)
	scaleObject('lucasta_02', 1.1, 1.1);
	addLuaSprite('lucasta_02', false);

	makeLuaSprite('lucasta_01', 'pingasta/escaleras_bg', -280, 0);
	setScrollFactor('lucastac_01', 0.9, 0.9);
	scaleObject('lucasta_01', 1, 0.9);
	addLuaSprite('lucasta_01', false);

	setProperty('lucasta_02.visible', true);
	setProperty('lucasta_01.visible', true);
end