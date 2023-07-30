function onCreate()
	-- background shit
	makeLuaSprite('final03', 'andreh/final03', -340, -80);
	setLuaSpriteScrollFactor('final03', 1, 1);
	scaleObject('final03', 0.8, 0.8);
	addLuaSprite('final03', false);
		
	makeLuaSprite('final02', 'andreh/final02', -340, -80);
	setLuaSpriteScrollFactor('final02', 1, 1);
	scaleObject('final02', 0.8, 0.8);
	addLuaSprite('final02', false);

	makeLuaSprite('final01', 'andreh/final01', -340, -80);
	setLuaSpriteScrollFactor('final01', 1, 1);
	scaleObject('final01', 0.8, 0.75);
	addLuaSprite('final01', true);

	makeLuaSprite('final00', 'andreh/final00', -340, -80);
	setLuaSpriteScrollFactor('final00', 1, 1);
	scaleObject('final00', 0.8, 0.75);
	addLuaSprite('final00', false);
end

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.4 then
        setProperty('health', health- 0.01);
    end
end