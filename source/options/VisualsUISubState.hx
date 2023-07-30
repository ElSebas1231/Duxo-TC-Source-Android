package options;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;

using StringTools;

class VisualsUISubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Visuales & UI';

		var option:Option = new Option('Note Splashes',
			"Si no está marcado, cuando tengas un \"Sick!\", no se mostrará un splash.",
			'noteSplashes',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Ocultar HUD',
			'Si está marcado, oculta la mayoría de elementos del HUD.',
			'hideHud',
			'bool',false);
		addOption(option);
		
		var option:Option = new Option('Barra de Tiempo:',
			"¿Qué debería de mostrar la Barra de Tiempo?",
			'timeBarType',
			'string',
			'Tiempo Restante',
			['Tiempo Restante', 'Tiempo transcurrido', 'Nombre de la canción', 'Desactivado']);
		addOption(option);

		var option:Option = new Option('Luces Parpadeantes',
			"¡Desactiva esto si eres fotosensible a luces parpadeantes!",
			'flashing',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Zooms de Cámara',
			"Si está desactivado, el HUD no hará un zoom en un Beat.",
			'camZooms',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Zoom de Puntuación en aciertos',
			"Si está desactivado, desactiva el zoom de la puntuación\ncada vez que pulses una nota.",
			'scoreZoom',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Transparencia de HealtBar:',
			'¿Qué tanta transparencia quieres que sea de la barra de vida e íconos?',
			'healthBarAlpha',
			'percent',
			1);
		option.scrollSpeed = 1.6;
		option.minValue = 0.0;
		option.maxValue = 1;
		option.changeValue = 0.1;
		option.decimals = 1;
		addOption(option);
		
		#if !mobile
		var option:Option = new Option('Contador de FPS',
			'Si no está marcada, oculta el contador de FPS.',
			'showFPS',
			'bool',
			true);
		addOption(option);
		option.onChange = onChangeFPSCounter;
		#end
		
		var option:Option = new Option('Canción de Pausa:',
			"¿Qué opción/canción prefieres escuchar en al pausar el juego?",
			'pauseMusic',
			'string',
			'Tea Time',
			['Desactivado', 'Breakfast', 'Tea Time', 'Song Inst.']);
		addOption(option);
		option.onChange = onChangePauseMusic;

		var option:Option = new Option('Pantalla de inicio:',
			"¿Qué versión de la pantalla de título prefieres?\n(Incluye su respectivo tema del menú principal)",
			'titleVer',
			'string',
			'Default',
			['DLC 1', 'DLC 2', 'DLC 3', 'Default']);
		addOption(option);
		option.onChange = onChangeMenuMusic;
		
		#if CHECK_FOR_UPDATES
		var option:Option = new Option('Revisar actualizaciones',
			'En builds de release, desactiva el recibir un mensaje de actualización.',
			'checkForUpdates',
			'bool',
			true);
		addOption(option);
		#end

		var option:Option = new Option('Combo Stacking',
			"Si no está marcado, Ratings y Combo no se amontonarán, ahorrando memoria y haciéndolos más fáciles de ver",
			'comboStacking',
			'bool',
			true);
		addOption(option);

		super();
	}

	var changedMusic:Bool = false;
	var changedMenu:Bool = false;

	function onChangePauseMusic()
	{
		if(ClientPrefs.pauseMusic == 'Desactivado')
			FlxG.sound.music.volume = 0;
		if(ClientPrefs.pauseMusic == 'Song Inst.')
			FlxG.sound.playMusic(Paths.inst('test'));
		else
			FlxG.sound.playMusic(Paths.music(Paths.formatToSongPath(ClientPrefs.pauseMusic)));

		changedMusic = true;
	}

	function onChangeMenuMusic()
	{
		if (ClientPrefs.titleVer == 'DLC 1'){
			FlxG.sound.playMusic(Paths.music('freakyMenuDM1'));
		}else if (ClientPrefs.titleVer == 'DLC 2'){
			FlxG.sound.playMusic(Paths.music('freakyMenuDM2'));
		}else if (ClientPrefs.titleVer == 'DLC 3'){
			FlxG.sound.playMusic(Paths.music('freakyMenuDM3'));
		}else{
			FlxG.sound.playMusic(Paths.music('freakyMenu'));
		}
		changedMenu = true;
	}

	override function destroy()
	{
		if(changedMusic  && !options.OptionsState.onPlayState){
			if (ClientPrefs.titleVer == 'DLC 1'){
				FlxG.sound.playMusic(Paths.music('freakyMenuDM1'));
			}else if (ClientPrefs.titleVer == 'DLC 2'){
				FlxG.sound.playMusic(Paths.music('freakyMenuDM2'));
			}else if (ClientPrefs.titleVer == 'DLC 3'){
				FlxG.sound.playMusic(Paths.music('freakyMenuDM3'));
			}else{
				FlxG.sound.playMusic(Paths.music('freakyMenu'));
			}
		}

		if(changedMenu){
			FreeplayState.instPlay = false;
		}

		super.destroy();
	}

	#if !mobile
	function onChangeFPSCounter()
	{
		if(Main.fpsVar != null)
			Main.fpsVar.visible = ClientPrefs.showFPS;
	}
	#end
}