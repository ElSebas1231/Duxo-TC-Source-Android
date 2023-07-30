cosasxd = {'amquinom', 'amquinom2', 'amquinom3',
'laucorrupted', 'pico','creisi_andreh',
'creisi-corrupted', 'natalan_corruptado'}

function onCreatePost()
----------------------- [[Custom NoteSkin in characters]] ---------------------------------------------
    for s = 0, #cosasxd do
        if dadName == cosasxd[s] then
            for i = 0, getProperty('opponentStrums.length')-1 do
                setPropertyFromGroup('opponentStrums', i, 'texture', 'Corrupnote_assets');
            end
            for i = 0, getProperty('unspawnNotes.length')-1 do
                if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false then
                    setPropertyFromGroup('unspawnNotes', i, 'texture', 'Corrupnote_assets');
                    setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'CorrupnoteSplashes');
                end
            end
        end
    end
-------------------------------------------------------------------------------------------------------
    if songName == 'Triple Trouble' then
		for i = 0, getProperty('grpNoteSplashes.length')-1 do
			setPropertyFromGroup('grpNoteSplashes', i, 'offset.x', -36.5)
			setPropertyFromGroup('grpNoteSplashes', i, 'offset.y', -90)
		end
	end
end

--This is just get things work properly, don't get mad pls.
function onCountdownTick(counter)
	if boyfriendName == 'duxo_car' and songName == 'Suffer' then
		if counter == 2 then
			playSound('silbato', 1)
		end
		if counter == 3 then
			triggerEvent('Play Animation', 'dodges', 'bf')
		end
	end
    if counter == 0 then
        if isStoryMode and not seenCutscene then
            for s = 0, #cosasxd do
                if dadName == cosasxd[s] then
                    for i = 0, getProperty('opponentStrums.length')-1 do
                        setPropertyFromGroup('opponentStrums', i, 'texture', 'Corrupnote_assets');
                    end
                end
            end
        end
    end
end

function onGameOverStart()
    if boyfriendName == 'bf-aquino' then
        if not mustHitSection then
            setProperty('camFollow.x', 1020) --Fix the camera 'x' pos
	        setProperty('camFollow.y', 480) --Fix the camera 'y' pos
        elseif mustHitSection then
            setProperty('camFollow.x', 650) --Fix the camera 'x' pos
	        setProperty('camFollow.y', 400) --Fix the camera 'y' pos
        end
    end
end