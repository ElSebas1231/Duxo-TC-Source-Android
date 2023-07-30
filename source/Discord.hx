package;

#if desktop
import Sys.sleep;
import discord_rpc.DiscordRpc;
#end

#if LUA_ALLOWED
import llua.Lua;
import llua.State;
#end

using StringTools;

class DiscordClient
{
	public static var isInitialized:Bool = false;
	public function new()
	{
		#if desktop
		trace("Cliente de Discord iniciando...");
		DiscordRpc.start({
			clientID: "1053303809394360461",
			onReady: onReady,
			onError: onError,
			onDisconnected: onDisconnected
		});
		trace("Cliente de Discord iniciado.");

		while (true)
		{
			DiscordRpc.process();
			sleep(2);
			//trace("Discord Client Update");
		}

		DiscordRpc.shutdown();
		#end
	}
	
	public static function shutdown()
	{
		#if desktop
		DiscordRpc.shutdown();
		#end
	}
	
	static function onReady()
	{
		#if desktop
		DiscordRpc.presence({
			details: "Empezando el juego...",
			state: null,
			largeImageKey: 'icon',
			largeImageText: "FNF X DUXO: Complete Trilogy"
		});
		#end
	}

	static function onError(_code:Int, _message:String)
	{
		trace('Error! $_code : $_message');
	}

	static function onDisconnected(_code:Int, _message:String)
	{
		trace('Desconectado! $_code : $_message');
	}

	public static function initialize()
	{
		#if desktop
		var DiscordDaemon = sys.thread.Thread.create(() ->
		{
			new DiscordClient();
		});
		trace("Cliente de Discord iniciado");
		isInitialized = true;
		#end
	}

	public static function changePresence(details:String, state:Null<String>, ?smallImageKey : String, ?hasStartTimestamp : Bool, ?endTimestamp: Float, ?stagePortrait : String)
	{
		#if desktop
		var startTimestamp:Float = if(hasStartTimestamp) Date.now().getTime() else 0;

		if (endTimestamp > 0)
		{
			endTimestamp = startTimestamp + endTimestamp;
		}

		DiscordRpc.presence({
			details: details,
			state: state,
			largeImageKey: stagePortrait, //used to change the RPC Image
			largeImageText: "Versión de Psych Engine: " + MainMenuState.psychEngineVersion,
			smallImageKey : smallImageKey,
			// Obtained times are in milliseconds so they are divided so Discord can use it
			startTimestamp : Std.int(startTimestamp / 1000),
            endTimestamp : Std.int(endTimestamp / 1000)	
		});
		#end
		
		//trace('RPC de Discord Actualizada. Argumentos: $details, $state, $smallImageKey, $hasStartTimestamp, $endTimestamp');
	}

	#if LUA_ALLOWED
	public static function addLuaCallbacks(lua:State) {
		Lua_helper.add_callback(lua, "changePresence", function(details:String, state:Null<String>, ?smallImageKey:String, ?hasStartTimestamp:Bool, ?endTimestamp:Float) {
			changePresence(details, state, smallImageKey, hasStartTimestamp, endTimestamp);
		});
	}
	#end
}