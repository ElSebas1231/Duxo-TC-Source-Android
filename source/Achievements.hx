import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxColor;
import flixel.text.FlxText;

using StringTools;

class Achievements {
	public static var achievementsStuff:Array<Dynamic> = [ //Name, Description, Achievement save tag, Hidden achievement
		["¡Como en el juego!",			"Abre el juego en el día Viernes. ¡Y en la noche!\n¿Tú sabes que hace el 9?",		'friday_night_play',	 	true],
		["¡¡¡RICKROLLEADO!!!",			"Pasa la semana 1 del DLC 1 sin fallar una nota.",									'weeka1D1_nomiss',			false],
		["¿El Ship sigue?",				"Pasa la semana 2 del DLC 1 sin fallar una nota.",									'weeka2D1_nomiss',			false],
		["¡¿C3JO de Fornite?!",			"Pasa la semana 3 del DLC 1 sin fallar una nota.",									'weeka3D1_nomiss',			false],
		["Mata Gatos",					"Pasa la semana 4 del DLC 1 sin fallar una nota.",									'weeka4D1_nomiss',			false],
		["Mall Agresivo",				"Pasa la semana 5 del DLC 1 sin fallar una nota.",									'weeka5D1_nomiss',			false],
		["¡RATAS!",						"Pasa la semana 6 del DLC 1 sin fallar una nota.",									'weeka6D1_nomiss',			false],
		["Feria Extraña",				"Pasa la semana 7 del DLC 1 sin fallar una nota.",									'weeka7D1_nomiss',			false],
		["¿Soaring?",					"Pasa la semana 1 del DLC 2 sin fallar una nota.",									'weekaa1D2_nomiss',			false],
		["¡¿Y mis videos?!",			"Pasa la semana 2 del DLC 2 sin fallar una nota.",									'weekaa2D2_nomiss',			false],
		["Pe Causa Mortal",				"Pasa la semana 3 del DLC 2 sin fallar una nota.",									'weekaa3D2_nomiss',			false],
		["Limo Mortal",					"Pasa la semana 4 del DLC 2 sin fallar una nota.",									'weekaa4D2_nomiss',			false],
		["Viejos Conocidos...",			"Pasa la semana 5 del DLC 2 sin fallar una nota.",									'weekaa5D2_nomiss',			false],
		["Gata Espacial",				"Pasa la semana 1 del DLC 3 sin fallar una nota.",									'weekab1D3_nomiss',			false],
		["Ya no hay Shippeo :(",		"Pasa la semana 2 del DLC 3 sin fallar una nota.",									'weekab2D3_nomiss',			false],
		["Mongolón",					"Pasa la semana 3 del DLC 3 sin fallar una nota.",									'weekab3D3_nomiss',			false],
		["Pequeño aventón",				"Pasa la semana 4 del DLC 3 sin fallar una nota.",									'weekab4D3_nomiss',			false],
		["Un restaurante peculiar",		"Pasa la semana 5 del DLC 3 sin fallar una nota.",									'weekab5D3_nomiss',			false],
		["¿El Final?",					"Pasa la semana 6 del DLC 3 sin fallar una nota.",									'weekab6D3_nomiss',			false],
		["¡Un nuevo amigo encontré!",	"Pasa la canción de \"Enano\"",														'enano',					true],
		["Gato corrupto",				"Pasa la canción de \"Maussigno\"",													'maussigno',				true],
		["¡COMIENZA LA GATASTROFE!",	"Pasa la canción de \"Restless\"",													'restless',					true],
		["¿Chicos? ¿Están bien...?",	"Pasa la canción de \"Triple Trouble\"",											'triple_trouble',			true],
		["¡Pero que manco!",			"Pasa una canción con una Presición menor a 20%",									'ur_bad',					false],
		["Perfección pura",				"Pasa una canción con un 100% de Presición.",										'ur_good',					false],
	];
	public static var achievementsMap:Map<String, Bool> = new Map<String, Bool>();

	public static var henchmenDeath:Int = 0;
	public static function unlockAchievement(name:String):Void {
		FlxG.log.add('Logro adquirido: "' + name +'"');
		achievementsMap.set(name, true);
		FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
	}

	public static function isAchievementUnlocked(name:String) {
		if(achievementsMap.exists(name) && achievementsMap.get(name)) {
			return true;
		}
		return false;
	}

	public static function getAchievementIndex(name:String) {
		for (i in 0...achievementsStuff.length) {
			if(achievementsStuff[i][2] == name) {
				return i;
			}
		}
		return -1;
	}

	public static function loadAchievements():Void {
		if(FlxG.save.data != null) {
			if(FlxG.save.data.achievementsMap != null) {
				achievementsMap = FlxG.save.data.achievementsMap;
			}
			if(henchmenDeath == 0 && FlxG.save.data.henchmenDeath != null) {
				henchmenDeath = FlxG.save.data.henchmenDeath;
			}
		}
	}
}

class AttachedAchievement extends FlxSprite {
	public var sprTracker:FlxSprite;
	private var tag:String;
	public function new(x:Float = 0, y:Float = 0, name:String) {
		super(x, y);

		changeAchievement(name);
		antialiasing = ClientPrefs.globalAntialiasing;
	}

	public function changeAchievement(tag:String) {
		this.tag = tag;
		reloadAchievementImage();
	}

	public function reloadAchievementImage() {
		if(Achievements.isAchievementUnlocked(tag)) {
			loadGraphic(Paths.image('achievements/' + tag));
		} else {
			loadGraphic(Paths.image('achievements/lockedachievement'));
		}
		scale.set(0.7, 0.7);
		updateHitbox();
	}

	override function update(elapsed:Float) {
		if (sprTracker != null)
			setPosition(sprTracker.x - 130, sprTracker.y + 25);

		super.update(elapsed);
	}
}

class AchievementObject extends FlxSpriteGroup {
	public var onFinish:Void->Void = null;
	var alphaTween:FlxTween;
	public function new(name:String, ?camera:FlxCamera = null)
	{
		super(x, y);
		ClientPrefs.saveSettings();

		var id:Int = Achievements.getAchievementIndex(name);
		var achievementBG:FlxSprite = new FlxSprite(60, 50).makeGraphic(420, 120, FlxColor.BLACK);
		achievementBG.scrollFactor.set();

		var achievementIcon:FlxSprite = new FlxSprite(achievementBG.x + 10, achievementBG.y + 10).loadGraphic(Paths.image('achievements/' + name));
		achievementIcon.scrollFactor.set();
		achievementIcon.setGraphicSize(Std.int(achievementIcon.width * (2 / 3)));
		achievementIcon.updateHitbox();
		achievementIcon.antialiasing = ClientPrefs.globalAntialiasing;

		var achievementName:FlxText = new FlxText(achievementIcon.x + achievementIcon.width + 20, achievementIcon.y + 16, 280, Achievements.achievementsStuff[id][0], 16);
		achievementName.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, LEFT);
		achievementName.scrollFactor.set();

		var achievementText:FlxText = new FlxText(achievementName.x, achievementName.y + 32, 280, Achievements.achievementsStuff[id][1], 16);
		achievementText.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, LEFT);
		achievementText.scrollFactor.set();

		add(achievementBG);
		add(achievementName);
		add(achievementText);
		add(achievementIcon);

		var cam:Array<FlxCamera> = FlxCamera.defaultCameras;
		if(camera != null) {
			cam = [camera];
		}
		alpha = 0;
		achievementBG.cameras = cam;
		achievementName.cameras = cam;
		achievementText.cameras = cam;
		achievementIcon.cameras = cam;
		alphaTween = FlxTween.tween(this, {alpha: 1}, 0.5, {onComplete: function (twn:FlxTween) {
			alphaTween = FlxTween.tween(this, {alpha: 0}, 0.5, {
				startDelay: 2.5,
				onComplete: function(twn:FlxTween) {
					alphaTween = null;
					remove(this);
					if(onFinish != null) onFinish();
				}
			});
		}});
	}

	override function destroy() {
		if(alphaTween != null) {
			alphaTween.cancel();
		}
		super.destroy();
	}
}