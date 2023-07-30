package;

#if android
import android.Tools;
import android.Permissions;
import android.PermissionsList;
#end
import lime.app.Application;
import openfl.events.UncaughtErrorEvent;
import openfl.utils.Assets as OpenFlAssets;
import openfl.Lib;
import haxe.CallStack.StackItem;
import haxe.CallStack;
import haxe.io.Path;
import sys.FileSystem;
import sys.io.File;
import flash.system.System;

/**
 * ...
 * @author: Saw (M.A. Jigsaw)
 */

using StringTools;

class SUtil
{
	#if android
	private static var aDir:String = null; // android dir
	#end

	public static function getPath():String
	{
		#if android
		if (aDir != null && aDir.length > 0)
			return aDir;
		else
			return aDir = Tools.getExternalStorageDirectory() + '/' + '.' + Application.current.meta.get('file') + '/';
		#else
		return '';
		#end
	}

	public static function doTheCheck()
	{
		#if android
		if (!Permissions.getGrantedPermissions().contains(PermissionsList.READ_EXTERNAL_STORAGE) || !Permissions.getGrantedPermissions().contains(PermissionsList.WRITE_EXTERNAL_STORAGE))
		{
			Permissions.requestPermissions([PermissionsList.READ_EXTERNAL_STORAGE, PermissionsList.WRITE_EXTERNAL_STORAGE]);
			SUtil.applicationAlert('Permisos', "Si aceptaste los permisos el juego no va a crashear, de lo contrario este crashea" + '\n' + 'Presiona Ok para ver si todo anda bien.');
		}

		if (Permissions.getGrantedPermissions().contains(PermissionsList.READ_EXTERNAL_STORAGE) || Permissions.getGrantedPermissions().contains(PermissionsList.WRITE_EXTERNAL_STORAGE))
		{
			if (!FileSystem.exists(Tools.getExternalStorageDirectory() + '/' + '.' + Application.current.meta.get('file')))
				FileSystem.createDirectory(Tools.getExternalStorageDirectory() + '/' + '.' + Application.current.meta.get('file'));

			if (!FileSystem.exists(SUtil.getPath() + 'assets') && !FileSystem.exists(SUtil.getPath() + 'mods'))
			{
				SUtil.applicationAlert('Error Inesperado.', "Ups, parece que no extrajiste bien los archivos del .APK\nPor favor, revisa que lo hayas hecho bien.");
				System.exit(0);
			}
			else
			{
				if (!FileSystem.exists(SUtil.getPath() + 'assets'))
				{
					SUtil.applicationAlert('Error Inesperado.', "Ups, parece que no extrajiste bien la carpeta 'assets/' de los archivos del .APK\nPor favor, revisa que lo hayas hecho bien.");
					System.exit(0);
				}

				if (!FileSystem.exists(SUtil.getPath() + 'mods'))
				{
					SUtil.applicationAlert('Error Inesperado.', "Ups, parece que no extrajiste bien la carpeta 'mods/' de los archivos del .APK\nPor favor, revisa que lo hayas hecho bien.");
					System.exit(0);
				}
			}
		}
		#end
	}

	public static function gameCrashCheck()
	{
		Lib.current.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, onCrash);
	}

	public static function onCrash(e:UncaughtErrorEvent):Void
	{
		var callStack:Array<StackItem> = CallStack.exceptionStack(true);
		var dateNow:String = Date.now().toString();
		dateNow = StringTools.replace(dateNow, " ", "_");
		dateNow = StringTools.replace(dateNow, ":", "'");

		var path:String = "./crashlogs/" + "DUXOTC_" + dateNow + ".txt";
		var errMsg:String = "";

		for (stackItem in callStack)
		{
			switch (stackItem)
			{
				case FilePos(s, file, line, column):
					errMsg += "Archivo: " + file + " (en la linea " + line + ")\n";
				default:
					Sys.println(stackItem);
			}
		}

		errMsg += "\nError Inesperado: " + e.error + "\nSi el error es grave, reporte este error en: https://github.com/ShadowMario/FNF-PsychEngine\nNo te preocupes, todos cometemos errores.\n\n> Crash Handler escrito por: sqirra-rng\n> Modificado por: ElSebas1231";

		if (!FileSystem.exists(SUtil.getPath() + "crashlogs"))
		FileSystem.createDirectory(SUtil.getPath() + "crashlogs");

		File.saveContent(SUtil.getPath() + path, errMsg + "\n");

		Sys.println(errMsg);
		Sys.println("Log de crasheo guardado en: " + Path.normalize(path));

		SUtil.applicationAlert("ERROR", errMsg);
		System.exit(0);
	}

	private static function applicationAlert(title:String, description:String)
	{
		Application.current.window.alert(description, title);
	}

	#if android
	public static function saveContent(fileName:String = 'file', fileExtension:String = '.json', fileData:String = 'Olvidaste poner algo en tu code')
	{
		if (!FileSystem.exists(SUtil.getPath() + 'saves'))
			FileSystem.createDirectory(SUtil.getPath() + 'saves');

		File.saveContent(SUtil.getPath() + 'saves/' + fileName + fileExtension, fileData);
		SUtil.applicationAlert('Hecho :D', 'Archivo guardado correctamente.');
	}

	public static function saveClipboard(fileData:String = 'Olvidaste poner algo en tu code')
	{
		openfl.system.System.setClipboard(fileData);
		SUtil.applicationAlert('Hecho :D', 'Data guardada al portapeles correctamente.');
	}

	public static function copyContent(copyPath:String, savePath:String)
	{
		if (!FileSystem.exists(savePath))
			File.saveBytes(savePath, OpenFlAssets.getBytes(copyPath));
	}
	#end
}