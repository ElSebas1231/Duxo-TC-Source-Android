function onCreatePost()
    setPropertyFromClass('lime.app.Application', 'current.window.title', "Friday Night Funkin' X DUXO: Complete Trilogy | "..getProperty('curSong'))
end

function onDestroy()
	setPropertyFromClass('lime.app.Application', 'current.window.title', "Friday Night Funkin' X DUXO: Complete Trilogy")
end