function onEvent(n, v1, v2)
    if n == 'HUD FADE' then
        doTweenAlpha('hudfade', 'camHUD', tonumber(v1), tonumber(v2), 'smootherStepOut')
    end
end