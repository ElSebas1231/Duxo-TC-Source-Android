function onCreate()
    makeAnimatedLuaSprite('NewTitleMenuBG', 'tripletrouble/NewTitleMenuBG', -400, -200)
    setLuaSpriteScrollFactor('NewTitleMenuBG', 0.9, 0.9)
    setGraphicSize('NewTitleMenuBG', getProperty('NewTitleMenuBG.width') * 4.5)
    addLuaSprite('NewTitleMenuBG', false)
    addAnimationByPrefix('NewTitleMenuBG', 'dance', 'TitleMenuSSBG', 24, true)
    objectPlayAnimation('NewTitleMenuBG', 'dance')
    
    makeLuaSprite('Glitch','tripletrouble/Glitch', -420, -300)
    setGraphicSize('Glitch', getProperty('Glitch.width') * 1.2)
    addLuaSprite('Glitch',false)
	setLuaSpriteScrollFactor('Glitch', 1, 1)

    makeLuaSprite('Trees','tripletrouble/Trees', -610, -450)
    setGraphicSize('Trees', getProperty('Trees.width') * 1.2)
    addLuaSprite('Trees',false)
	setLuaSpriteScrollFactor('Trees', 1, 1)

    makeLuaSprite('Trees3','tripletrouble/Trees3', -610, -450)
    setGraphicSize('Trees3', getProperty('Trees3.width') * 1.2)
    addLuaSprite('Trees3',false)
	setLuaSpriteScrollFactor('Trees3', 1, 1)   

    makeLuaSprite('Trees2','tripletrouble/Trees2', -610, -550)
    setGraphicSize('Trees2', getProperty('Trees2.width') * 1.2)
    addLuaSprite('Trees2',false)
	setLuaSpriteScrollFactor('Trees2', 1, 1)  

    makeLuaSprite('Grass','tripletrouble/Grass', -610, -350)
    setGraphicSize('Grass', getProperty('Grass.width') * 1.2)
    addLuaSprite('Grass',false)
	setLuaSpriteScrollFactor('Grass', 1, 1)   

    setProperty('NewTitleMenuBG.visible', true);
    setProperty('Glitch.visible', true);
    setProperty('Trees2.visible', true);
    setProperty('Trees.visible', true);
    setProperty('Grass.visible', true);

    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'TTgameOver');
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'TTgameOverEnd');
end

--changebgl is for the Xenophane(AquinoEXE) part and changebgn is for the normal background, you can change this to another name // changebgl es para la parte de Xenophane(AquinoEXE) y changebgn para el fondo normal, se puede cambiar a otro nombre

function onEvent(name,value1,value2)
    if name == 'Play Animation' then
        
        if value1 == 'changebgl' then
            setProperty('NewTitleMenuBG.visible', true);
            setProperty('Glitch.visible', false);
            setProperty('Trees3.visible', true)
            setProperty('Trees2.visible', true);
            setProperty('Trees.visible', true);
            setProperty('Grass.visible', true);
        end
        if value1 == 'changebgn' then
            setProperty('NewTitleMenuBG.visible', false);
            setProperty('Glitch.visible', true);
            setProperty('Trees3.visible', true)
            setProperty('Trees2.visible', true);
            setProperty('Trees.visible', true);
            setProperty('Grass.visible', true);
        end
    end
end