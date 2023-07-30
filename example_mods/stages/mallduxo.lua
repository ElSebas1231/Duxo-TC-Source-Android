function onCreate()
    makeLuaSprite('bgwalls', 'mallduxo/mallChristmas', -1000, -550)
    setScrollFactor('bgwalls', 0.2, 0.2);
    scaleObject('bgwalls', 0.9, 0.9)
    addLuaSprite('bgwalls')

	if not lowQuality then
        makeAnimatedLuaSprite('techo', 'mallduxo/BD_00', -400, -500)
        addLuaSprite('techo')
        setScrollFactor('techo', 0.33, 0.33)
        addAnimationByPrefix('techo', 'idle', 'Ceiling Window instancia', 24, true)

        makeAnimatedLuaSprite('gente', 'mallduxo/BD_sprites', -240, -30)
		scaleObject('gente', 0.85, 0.85);
		setScrollFactor('gente', 0.33, 0.33);
		addLuaSprite('gente', false);
        addAnimationByPrefix('gente', 'idle', 'Upper Crowd Bob', 24, false)
    
        makeLuaSprite('escaleras', 'mallduxo/escaleras_sangre', -1100, -600)
		scaleObject('escaleras', 1, 1);
		setScrollFactor('escaleras', 0.3, 0.3);
		addLuaSprite('escaleras', false);
    end

    makeAnimatedLuaSprite('gente2', 'mallduxo/Christmas_Background_Assets', -150, 170)
    setScrollFactor('gente2', 1, 1)
    scaleObject('gente2', 0.8, 0.8)
    addLuaSprite('gente2')
    addAnimationByPrefix('gente2', 'idle', 'Bottom Level Boppers', 24, false)
    
    makeLuaSprite('snow', 'mallduxo/BD_03', -600, 750)
    setScrollFactor('snow', 1, 1)
    addLuaSprite('snow')
end

function onCountdownTick(counter)
	if counter % 2 == 0 then
        playAnim('gente','idle')
		playAnim('gente2','idle')
	end
end

function onStepHit()
	if curStep % 2 == 0 then
		playAnim('gente','idle')
		playAnim('gente2','idle')
	end
end