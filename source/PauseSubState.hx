package;

import Controls.Control;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.FlxCamera;
import flixel.util.FlxStringUtil;

class PauseSubState extends MusicBeatSubstate
{
	var grpMenuShit:FlxTypedGroup<Alphabet>;

	var menuItems:Array<String> = [];
	var menuItemsOG:Array<String> = ['Resumir', 'Reiniciar', 'Cambiar Dificultad' #if android, 'Abrir Editor de Charteo' #end, 'Ir a Opciones', 'Salir al Menú'];
	var difficultyChoices = [];
	var curSelected:Int = 0;

	var pauseMusic:FlxSound;
	var practiceText:FlxText;
	var skipTimeText:FlxText;
	var skipTimeTracker:Alphabet;
	var curTime:Float = Math.max(0, Conductor.songPosition);
	//var botplayText:FlxText;

	var swagShader:ColorSwap = null;

	var dlc1Songs:Array<String> = [
		'wimpy',
		'ya pero', 'hay una escena', 'your rickrolled', 
		'purpleshrooms', 'power of edition',
		'stickfish', 'cupface', 'final round',
		'tomy', 'house', 'electro',
		'best friends', 'funk you duxo', 'deep web',
		'retheys', 'watch out', 'oh shit a rat',
		'party', 'balloons', 'coulrophobia'
	];

	var dlc2Songs:Array<String> = [
		'afiliado', 'rocking', 'partner', 
		'madcow', 'no more editions', 'crazy',
		'nice meeting', 'control', 'offmind',
		'hater', 'time out', 'suffer',
		'moon', 'gravity', 'wingweb'
	];

	var dlc3Songs:Array<String> = [
		'spacecat', 'constellations', 'sadcat', 
		'purple', 'acido', 'esporas',
		'groovegrooving', 'sounding like this', 'shield',
		'shiny star', 'gamerpassion', 'queen',
		'bad day', 'hellmoon', 'the boss',
		'no more webadas', 'infectedby2002', 'empty hearth'
	];

	public static var songName:String = '';

	public function new(x:Float, y:Float)
	{
		super();
		if(CoolUtil.difficulties.length < 2) menuItemsOG.remove('Cambiar Dificultad'); //No need to change difficulty if there is only one!

		if(PlayState.chartingMode)
		{
			menuItemsOG.insert(2, 'Quitar Modo Charteo');
			
			var num:Int = 0;
			if(!PlayState.instance.startingSong)
			{
				num = 1;
				menuItemsOG.insert(3, 'Saltar Tiempo');
			}
			menuItemsOG.insert(3 + num, 'Terminar Canción');
			menuItemsOG.insert(4 + num, 'Alternar Modo Práctica');
			menuItemsOG.insert(5 + num, 'Alternar Botplay');
		}
		menuItems = menuItemsOG;

		swagShader = new ColorSwap();

		for (i in 0...CoolUtil.difficulties.length) {
			var diff:String = '' + CoolUtil.difficulties[i];
			difficultyChoices.push(diff);
		}
		difficultyChoices.push('BACK');

		pauseMusic = new FlxSound();
		if(songName != null) {
			pauseMusic.loadEmbedded(Paths.music(songName), true, true);
		} else if (songName != 'Desactivado') {
			pauseMusic.loadEmbedded(Paths.music(Paths.formatToSongPath(ClientPrefs.pauseMusic)), true, true);
		}
		
		if (ClientPrefs.pauseMusic == 'Song Inst.'){
			pauseMusic.loadEmbedded(Paths.inst(PlayState.SONG.song), true, true);
		}

		if (PlayState.SONG.song == 'Triple Trouble'){
			if (ClientPrefs.pauseMusic != 'Song Inst.' || ClientPrefs.pauseMusic != 'Desactivado'){
				pauseMusic.loadEmbedded(Paths.music(Paths.formatToSongPath('TTPause')), true, true);
			}
		}

		if (PlayState.SONG.song == 'Restless' || PlayState.SONG.song == 'Maussigno'){
			if (ClientPrefs.pauseMusic != 'Song Inst.' || ClientPrefs.pauseMusic != 'Desactivado'){
				pauseMusic.loadEmbedded(Paths.music(Paths.formatToSongPath('hypnopause')), true, true);
			}
		}
		
		pauseMusic.volume = 0;
		pauseMusic.play(false, FlxG.random.int(0, Std.int(pauseMusic.length / 2)));

		FlxG.sound.list.add(pauseMusic);

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.alpha = 0;
		bg.scrollFactor.set();
		add(bg);

		var dlcThing = new FlxSprite(580, -300).loadGraphic(Paths.image('pause/modlogo'));
		dlcThing.updateHitbox();
		dlcThing.antialiasing = ClientPrefs.globalAntialiasing;
		dlcThing.scrollFactor.set();
		dlcThing.alpha = 0;
		add(dlcThing);

		dlcThing.shader = swagShader.shader;

		var levelInfo:FlxText = new FlxText(20, 15, 0, "", 32);
		levelInfo.text = "Canción: " + PlayState.SONG.song;
		levelInfo.scrollFactor.set();
		levelInfo.setFormat(Paths.font("vcr.ttf"), 32);
		levelInfo.updateHitbox();
		add(levelInfo);

		var levelDifficulty:FlxText = new FlxText(20, 15 + 32, 0, "", 32);
		levelDifficulty.text = "Dificultad: " + CoolUtil.difficultyString();
		levelDifficulty.scrollFactor.set();
		levelDifficulty.setFormat(Paths.font('vcr.ttf'), 32);
		levelDifficulty.updateHitbox();
		add(levelDifficulty);

		var blueballedTxt:FlxText = new FlxText(20, 15 + 64, 0, "", 32);
		blueballedTxt.text = "Leanballed: " + PlayState.deathCounter;
		blueballedTxt.scrollFactor.set();
		blueballedTxt.setFormat(Paths.font('vcr.ttf'), 32);
		blueballedTxt.updateHitbox();
		add(blueballedTxt);

		practiceText = new FlxText(20, 15 + 101, 0, "MODO PRÁCTICA", 32);
		practiceText.scrollFactor.set();
		practiceText.setFormat(Paths.font('vcr.ttf'), 32);
		practiceText.x = FlxG.width - (practiceText.width + 20);
		practiceText.updateHitbox();
		practiceText.visible = PlayState.instance.practiceMode;
		add(practiceText);

		var chartingText:FlxText = new FlxText(20, 15 + 101, 0, "MODO CHARTEO", 32);
		chartingText.scrollFactor.set();
		chartingText.setFormat(Paths.font('vcr.ttf'), 32);
		chartingText.x = FlxG.width - (chartingText.width + 20);
		chartingText.y = FlxG.height - (chartingText.height + 20);
		chartingText.updateHitbox();
		chartingText.visible = PlayState.chartingMode;
		add(chartingText);

		blueballedTxt.alpha = 0;
		levelDifficulty.alpha = 0;
		levelInfo.alpha = 0;

		levelInfo.x = FlxG.width - (levelInfo.width + 20);
		levelDifficulty.x = FlxG.width - (levelDifficulty.width + 20);
		blueballedTxt.x = FlxG.width - (blueballedTxt.width + 20);

		FlxTween.tween(bg, {alpha: 0.6}, 0.4, {ease: FlxEase.quartInOut});
		FlxTween.tween(dlcThing, {alpha: 0.75, y: 30}, 0.2, {ease: FlxEase.quartInOut});
		FlxTween.tween(levelInfo, {alpha: 1, y: 20}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.3});
		FlxTween.tween(levelDifficulty, {alpha: 1, y: levelDifficulty.y + 5}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.5});
		FlxTween.tween(blueballedTxt, {alpha: 1, y: blueballedTxt.y + 5}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.7});

		grpMenuShit = new FlxTypedGroup<Alphabet>();
		add(grpMenuShit);

		regenMenu();
		cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];

		#if android
		if (PlayState.chartingMode){
			addVirtualPad(FULL, A);
		}
		else{
			addVirtualPad(UP_DOWN, A);
		}
		addPadCamera();
		#end

		for (a in 0...dlc1Songs.length)
			{
				if (PlayState.SONG.song.toLowerCase() == dlc1Songs[a])
				{
					dlcThing.loadGraphic(Paths.image('pause/dlc1'));
					dlcThing.x = dlcThing.x - 30;
				}
			}

		for (b in 0...dlc2Songs.length)
			{
				if (PlayState.SONG.song.toLowerCase() == dlc2Songs[b])
				{
					dlcThing.loadGraphic(Paths.image('pause/dlc2'));
					dlcThing.x = dlcThing.x + 40;
				}
			}

		for (c in 0...dlc3Songs.length)
			{
				if (PlayState.SONG.song.toLowerCase() == dlc3Songs[c])
				{
					dlcThing.loadGraphic(Paths.image('pause/dlc3'));
					dlcThing.x = dlcThing.x - 30;
				}
			}
	}

	var holdTime:Float = 0;
	var cantUnpause:Float = 0.1;
	override function update(elapsed:Float)
	{
		cantUnpause -= elapsed;
		if (pauseMusic.volume < 0.5)
			pauseMusic.volume += 0.01 * elapsed;

		if(swagShader != null)
		{
			if(FlxG.keys.pressed.SHIFT){
				if(controls.UI_LEFT) swagShader.hue -= elapsed * 0.1;
				if(controls.UI_RIGHT) swagShader.hue += elapsed * 0.1;
			}
		}

		super.update(elapsed);
		updateSkipTextStuff();

		var upP = controls.UI_UP_P;
		var downP = controls.UI_DOWN_P;
		var accepted = controls.ACCEPT;

		if (upP)
		{
			changeSelection(-1);
		}
		if (downP)
		{
			changeSelection(1);
		}
		if (controls.BACK)
		{
			close();
		}

		var daSelected:String = menuItems[curSelected];
		switch (daSelected)
		{
			case 'Saltar Tiempo':
				if (controls.UI_LEFT_P)
				{
					FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
					curTime -= 1000;
					holdTime = 0;
				}
				if (controls.UI_RIGHT_P)
				{
					FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
					curTime += 1000;
					holdTime = 0;
				}

				if(controls.UI_LEFT || controls.UI_RIGHT)
				{
					holdTime += elapsed;
					if(holdTime > 0.5)
					{
						curTime += 45000 * elapsed * (controls.UI_LEFT ? -1 : 1);
					}

					if(curTime >= FlxG.sound.music.length) curTime -= FlxG.sound.music.length;
					else if(curTime < 0) curTime += FlxG.sound.music.length;
					updateSkipTimeText();
				}
		}

		if (accepted && (cantUnpause <= 0 || !ClientPrefs.controllerMode))
		{
			if (menuItems == difficultyChoices)
			{
				if(menuItems.length - 1 != curSelected && difficultyChoices.contains(daSelected)) {
					var name:String = PlayState.SONG.song;
					var poop = Highscore.formatSong(name, curSelected);
					PlayState.SONG = Song.loadFromJson(poop, name);
					PlayState.storyDifficulty = curSelected;
					MusicBeatState.resetState();
					FlxG.sound.music.volume = 0;
					PlayState.changedDifficulty = true;
					PlayState.chartingMode = false;
					return;
				}

				menuItems = menuItemsOG;
				regenMenu();
			}

			switch (daSelected)
			{
				case "Resumir":
					close();
				case 'Cambiar Dificultad':
					menuItems = difficultyChoices;
					deleteSkipTimeText();
					regenMenu();
				case 'Alternar Modo Práctica':
					PlayState.instance.practiceMode = !PlayState.instance.practiceMode;
					PlayState.changedDifficulty = true;
					practiceText.visible = PlayState.instance.practiceMode;
				case "Reiniciar":
					restartSong();
				case "Quitar Modo Charteo":
					restartSong();
					PlayState.chartingMode = false;
				case 'Saltar Tiempo':
					if(curTime < Conductor.songPosition)
					{
						PlayState.startOnTime = curTime;
						restartSong(true);
					}
					else
					{
						if (curTime != Conductor.songPosition)
						{
							PlayState.instance.clearNotesBefore(curTime);
							PlayState.instance.setSongTime(curTime);
						}
						close();
					}
				case "Terminar Canción":
					close();
					PlayState.instance.finishSong(true);
				case 'Alternar Botplay':
					PlayState.instance.cpuControlled = !PlayState.instance.cpuControlled;
					PlayState.changedDifficulty = true;
					PlayState.instance.botplayTxt.visible = PlayState.instance.cpuControlled;
					PlayState.instance.botplayTxt.alpha = 1;
					PlayState.instance.botplaySine = 0;
				case 'Ir a Opciones':
					PlayState.instance.paused = true; // For lua
					PlayState.instance.vocals.volume = 0;
					options.OptionsState.onPlayState = true;
					MusicBeatState.switchState(new options.OptionsState());
					if(ClientPrefs.pauseMusic != 'Desactivado'){
						FlxG.sound.playMusic(Paths.music(Paths.formatToSongPath(ClientPrefs.pauseMusic)), pauseMusic.volume);
						FlxTween.tween(FlxG.sound.music, {volume: 1}, 0.8);
						FlxG.sound.music.time = pauseMusic.time;
					}
					if(ClientPrefs.pauseMusic == 'Song Inst.'){
						FlxG.sound.playMusic(Paths.inst(PlayState.SONG.song), pauseMusic.volume);
						FlxTween.tween(FlxG.sound.music, {volume: 1}, 0.8);
						FlxG.sound.music.time = pauseMusic.time;
					}
				case 'Abrir Editor de Charteo':
					MusicBeatState.switchState(new editors.ChartingState());
					PlayState.chartingMode = true;
				case "Salir al Menú":
					PlayState.deathCounter = 0;
					PlayState.seenCutscene = false;

					WeekData.loadTheFirstEnabledMod();
					if(PlayState.isStoryMode) {
						MusicBeatState.switchState(new StoryMenuState());
					} else {
						MusicBeatState.switchState(new FreeplayState());
					}
					PlayState.cancelMusicFadeTween();
					if (ClientPrefs.titleVer == 'DLC 1'){
						FlxG.sound.playMusic(Paths.music('freakyMenuDM1'));
					}else if (ClientPrefs.titleVer == 'DLC 2'){
						FlxG.sound.playMusic(Paths.music('freakyMenuDM2'));
					}else if (ClientPrefs.titleVer == 'DLC 3'){
						FlxG.sound.playMusic(Paths.music('freakyMenuDM3'));
					}else{
						FlxG.sound.playMusic(Paths.music('freakyMenu'));
					}
					PlayState.changedDifficulty = false;
			}
		}
	}

	function deleteSkipTimeText()
	{
		if(skipTimeText != null)
		{
			skipTimeText.kill();
			remove(skipTimeText);
			skipTimeText.destroy();
		}
		skipTimeText = null;
		skipTimeTracker = null;
	}

	public static function restartSong(noTrans:Bool = false)
	{
		PlayState.instance.paused = true; // For lua
		FlxG.sound.music.volume = 0;
		PlayState.instance.vocals.volume = 0;

		if(noTrans)
		{
			FlxTransitionableState.skipNextTransOut = true;
			FlxG.resetState();
		}
		else
		{
			MusicBeatState.resetState();
		}
	}

	override function destroy()
	{
		pauseMusic.destroy();

		super.destroy();
	}

	function changeSelection(change:Int = 0):Void
	{
		curSelected += change;

		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		if (curSelected < 0)
			curSelected = menuItems.length - 1;
		if (curSelected >= menuItems.length)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in grpMenuShit.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				// item.setGraphicSize(Std.int(item.width));

				if(item == skipTimeTracker)
				{
					curTime = Math.max(0, Conductor.songPosition);
					updateSkipTimeText();
				}
			}
		}
	}

	function regenMenu():Void {
		for (i in 0...grpMenuShit.members.length) {
			var obj = grpMenuShit.members[0];
			obj.kill();
			grpMenuShit.remove(obj, true);
			obj.destroy();
		}

		for (i in 0...menuItems.length) {
			var item = new Alphabet(90, 320, menuItems[i], true);
			item.isMenuItem = true;
			item.targetY = i;
			grpMenuShit.add(item);

			if(menuItems[i] == 'Saltar Tiempo')
			{
				skipTimeText = new FlxText(0, 0, 0, '', 64);
				skipTimeText.setFormat(Paths.font("vcr.ttf"), 64, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
				skipTimeText.scrollFactor.set();
				skipTimeText.borderSize = 2;
				skipTimeTracker = item;
				add(skipTimeText);

				updateSkipTextStuff();
				updateSkipTimeText();
			}
		}
		curSelected = 0;
		changeSelection();
	}
	
	function updateSkipTextStuff()
	{
		if(skipTimeText == null || skipTimeTracker == null) return;

		skipTimeText.x = skipTimeTracker.x + skipTimeTracker.width + 60;
		skipTimeText.y = skipTimeTracker.y;
		skipTimeText.visible = (skipTimeTracker.alpha >= 1);
	}

	function updateSkipTimeText()
	{
		skipTimeText.text = FlxStringUtil.formatTime(Math.max(0, Math.floor(curTime / 1000)), false) + ' / ' + FlxStringUtil.formatTime(Math.max(0, Math.floor(FlxG.sound.music.length / 1000)), false);
	}
}