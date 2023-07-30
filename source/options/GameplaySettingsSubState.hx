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
#if android
import android.Hardware;
#end

using StringTools;

class GameplaySettingsSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Opciones de Gameplay';
		rpcTitle = 'Gameplay Settings Menu'; //for Discord Rich Presence

		var option:Option = new Option('Mando activo',
			'Marca esto si quieres jugar\ncon un mando en vez de usar tu teclado.',
			'controllerMode',
			'bool',
			#if android true #else false #end);
		addOption(option);

		//I'd suggest using "Downscroll" as an example for making your own option since it is the simplest here
		var option:Option = new Option('Downscroll', //Name
			'Si está marcado, las flechas irán hacia abajo\nen vez de ir hacia arriba.', //Description
			'downScroll', //Save data variable name
			'bool', //Variable type
			false); //Default value
		addOption(option);

		var option:Option = new Option('Middlescroll',
			'Si está marcado, tus notas estarán centradas.',
			'middleScroll',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option('Notas del oponente',
			'Si está marcado, se ocultarán las notas del oponente.',
			'opponentStrums',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Ghost Tapping',
			"Si está marcado, no tendrás fallos mientras\nno haya notas que pulsar.",
			'ghostTapping',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Desactivar el botón Reset',
			"Si está marcado, desativará poder reiniciar\nal presionar la teclar de Reset.",
			'noReset',
			'bool',
			false);
		addOption(option);

		#if android
		var option:Option = new Option('Vibrations',
			"Si no está marcado, tu telefóno no vibrará.",
			'vibration',
			'bool',
			true);
		addOption(option);
		option.onChange = onChangeVibration;
		#end

		var option:Option = new Option('Volumen de Hit:',
			'Se hace un \"¡Tick!\" cuando presionas una nota."',
			'hitsoundVolume',
			'percent',
			0);
		addOption(option);
		option.scrollSpeed = 1.6;
		option.minValue = 0.0;
		option.maxValue = 1;
		option.changeValue = 0.1;
		option.decimals = 1;
		option.onChange = onChangeHitsoundVolume;

		var option:Option = new Option('Rating Offset',
			'Cambia que tan tarde/antes tienes que pulsar para tener un "Sick!"\nValores altos significan que tan tarde tienes que pulsar.',
			'ratingOffset',
			'int',
			0);
		option.displayFormat = '%vms';
		option.scrollSpeed = 20;
		option.minValue = -30;
		option.maxValue = 30;
		addOption(option);

		var option:Option = new Option('Sick! Hit ms:',
			'Cambia la cantidad de tiempo que tienes\npara obtener un "Sick!" en millisegundos.',
			'sickWindow',
			'int',
			45);
		option.displayFormat = '%vms';
		option.scrollSpeed = 15;
		option.minValue = 15;
		option.maxValue = 45;
		addOption(option);

		var option:Option = new Option('Good Hit ms:',
			'Cambia la cantidad de tiempo que tienes\npara obtener un "Good" en millisegundos.',
			'goodWindow',
			'int',
			90);
		option.displayFormat = '%vms';
		option.scrollSpeed = 30;
		option.minValue = 15;
		option.maxValue = 90;
		addOption(option);

		var option:Option = new Option('Bad Hit ms:',
			'Cambia la cantidad de tiempo que tienes\npara obtener un "Bad" en millisegundos.',
			'badWindow',
			'int',
			135);
		option.displayFormat = '%vms';
		option.scrollSpeed = 60;
		option.minValue = 15;
		option.maxValue = 135;
		addOption(option);

		var option:Option = new Option('Safe Frames',
			'Cambia cuantos frames tienes\npara pulsar una nota antes o tarde.',
			'safeFrames',
			'float',
			10);
		option.scrollSpeed = 5;
		option.minValue = 2;
		option.maxValue = 10;
		option.changeValue = 0.1;
		addOption(option);

		super();
	}

	function onChangeHitsoundVolume()
	{
		FlxG.sound.play(Paths.sound('hitsound'), ClientPrefs.hitsoundVolume);
	}

	#if android
	function onChangeVibration()
	{
		if(ClientPrefs.vibration)
		{
			Hardware.vibrate(500);
		}
	}
	#end
}