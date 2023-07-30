function onCreate()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-mau-death')
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx sin micro');
    triggerEvent('Camera Follow Pos',1050,600)
    setProperty('skipCountdown', true)
    setProperty('camHUD.visible', false)
    doTweenZoom('camTween', 'camGame', 1.3, 2, 'circOut')
end

function onStepHit()
    if curStep == 80 then
        triggerEvent('Camera Follow Pos',300,400)
        doTweenZoom('camTween', 'camGame', 1.2, 3, 'circOut')
    elseif curStep == 112 then
        triggerEvent('Camera Follow Pos',1050,600)
        doTweenZoom('camTween', 'camGame', 1.3, 2, 'circOut')
    elseif curStep == 128 then
        setProperty('camHUD.visible', true);
        doTweenZoom('camTween', 'camGame', 0.7, 0.1, 'circOut')
    elseif curStep == 1288 then
        doTweenAlpha('hudfade', 'camHUD', 0, 0.5, 'smootherStepOut')
    elseif curStep == 1303 then
        triggerEvent('Camera Follow Pos',1050,600)
        doTweenZoom('camTween', 'camGame', 1.3, 2, 'circOut')
    end
end