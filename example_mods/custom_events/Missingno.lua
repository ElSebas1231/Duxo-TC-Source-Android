function onEvent(tag, e1, e2)
    if tag == "Missingno" then
      noteTweenAlpha("NoteMove11", 0, 0, 0.00000001, 'cubeInOut')
      noteTweenAlpha("NoteMove21", 1, 0, 0.00000001, 'cubeInOut')
      noteTweenAlpha("NoteMove31", 2, 0, 0.00000001, 'cubeInOut')
      noteTweenAlpha("NoteMove41", 3, 0, 0.00000001, 'cubeInOut')
      math.randomseed(os.clock())
      height = math.random(120,screenHeight - 120)
            note1x = math.random(100,screenWidth / 4)
            note1y = height
        note2x = math.random(note1x + 100, note1x + 250)
        note2y = math.random(note1y - 100, note1y + 100)
        note3x = math.random(note2x + 100, note2x + 250)
        note3y = math.random(note1y - 100, note1y + 100)
        note4x = math.random(note3x + 100, note3x + 250)
        note4y = math.random(note1y - 100, note1y + 100)
    end
  end
  
  function onUpdate()
      if height < screenHeight / 2 then
        triggerEvent('Change Scrolltype', 'off')
      else
        triggerEvent('Change Scrolltype', 'on')
      end
  
      noteTweenX("NoteMove1x", 4, note1x, 0.000001, 'cubeInOut')
      noteTweenX("NoteMove2x", 5, note2x, 0.000001, 'cubeInOut')
      noteTweenX("NoteMove3x", 6, note3x, 0.000001, 'cubeInOut')
      noteTweenX("NoteMove4x", 7, note4x, 0.000001, 'cubeInOut')
      noteTweenY("NoteMove1y", 4, note1y, 0.000001, 'cubeInOut')
      noteTweenY("NoteMove2y", 5, note2y, 0.000001, 'cubeInOut')
      noteTweenY("NoteMove3y", 6, note3y, 0.000001, 'cubeInOut')
      noteTweenY("NoteMove4y", 7, note4y, 0.000001, 'cubeInOut')
  end