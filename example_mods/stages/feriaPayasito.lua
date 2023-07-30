function onCreate()
    
    makeLuaSprite('cielo', 'feriapayasito/clownso7_03', -300, -400);
    setLuaSpriteScrollFactor('cielo', 0.9, 0.9);
    scaleObject('cielo', 0.8, 0.8);
    addLuaSprite('cielo', false);

    makeLuaSprite('valla', 'feriapayasito/clownso7_02', -350, -400);
    setLuaSpriteScrollFactor('valla', 0.9, 0.9);
    scaleObject('valla', 0.8, 0.8);
    addLuaSprite('valla', false);

    makeLuaSprite('puestos', 'feriapayasito/clownso7_01', -250, -400);
    scaleObject('puestos', 0.8, 0.8);
    addLuaSprite('puestos', false);

    makeLuaSprite('peluchesxd', 'feriapayasito/clownso7_00', -250, -400);
    scaleObject('peluchesxd', 0.8, 0.8);
    addLuaSprite('peluchesxd', false);

    makeAnimatedLuaSprite('gente1', 'feriapayasito/backguys', -200, -310)
    scaleObject('gente1', 0.8, 0.8);
	addLuaSprite('gente1', false);
	addAnimationByPrefix('gente1', 'idle', 'BackCoolGuys', 30, false);

    makeAnimatedLuaSprite('gente2', 'feriapayasito/frontGuys', -250, 300)
    scaleObject('gente2', 0.8, 1);
	addLuaSprite('gente2', true);
	addAnimationByPrefix('gente2', 'idle', 'FrontGuys', 30, false);

    if lowQuality then
        removeLuaSprite('gente1')
        removeLuaSprite('gente2')
    end
end

function onCountdownTick(counter)
	if counter % 2 == 0 then
        playAnim('gente1', 'idle')
        playAnim('gente2', 'idle')
	end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        playAnim('gente1', 'idle')
        playAnim('gente2', 'idle')
    end
end