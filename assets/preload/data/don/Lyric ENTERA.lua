local colordon = "ededf2";
local textObj = nil;
local textTimer = 0;

function onCreate()
    makeLuaText('lyric','placeholder',screenWidth,0, 500);
	setTextBorder('lyric',5,'7300ff');
	setTextSize('lyric',40);
	setTextAlignment('lyric', 'center')
end
--Letra completa de don (No tenía que hace sorry :c)
--Me sorprende que pueda poner tíldes y otros carácteres jajajajaja wtf
function onUpdate()
	if downscroll then
		setProperty('lyric.y', 120)
	end
	if curStep == 70 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Quiero saber que me pasa');
		addLuaText('lyric');
	end
	if curStep == 84 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Te pregunto, ');
		addLuaText('lyric');
	end
    if curStep == 91 then
		setTextColor('lyric',colordon);
		setTextString('lyric','¿Qué me pasa?');
		addLuaText('lyric');
	end
    if curStep == 97 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Y no sabes');
		addLuaText('lyric');
	end
    if curStep == 106 then
		setTextColor('lyric',colordon);
		setTextString('lyric','porque claro');
		addLuaText('lyric');
	end
    if curStep == 116 then
		setTextColor('lyric',colordon);
		setTextString('lyric','de seguro');
		addLuaText('lyric');
	end
	if curStep == 123 then
		setTextColor('lyric',colordon);
		setTextString('lyric','yo ya');
		addLuaText('lyric');
	end
    if curStep == 129 then
		setTextColor('lyric',colordon);
		setTextString('lyric','te marié');
		addLuaText('lyric');
	end
    if curStep == 135 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Con mis idas y vueltas');
		addLuaText('lyric');
	end
    if curStep == 147 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Te cansé con mi cámara lenta');
		addLuaText('lyric');
	end
    if curStep == 163 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Y aunque trato');
		addLuaText('lyric');
	end
    if curStep == 172 then
		setTextColor('lyric',colordon);
		setTextString('lyric','nunca puedo');
		addLuaText('lyric');
	end
    if curStep == 179 then
		setTextColor('lyric',colordon);
		setTextString('lyric','apurar mi decisión.');
		addLuaText('lyric');
	end
	if curStep == 190 then
		removeLuaText('lyric',false);
	end
    if curStep == 199 then
		setTextColor('lyric',colordon);
		setTextString('lyric','En el preciso momento');
		addLuaText('lyric');
	end
    if curStep == 205 then
		setTextColor('lyric',colordon);
		setTextString('lyric','en que to-do');
		addLuaText('lyric');
	end
    if curStep == 211 then
		setTextColor('lyric',colordon);
		setTextString('lyric','va cambiando');
		addLuaText('lyric');
	end
    if curStep == 224 then
		setTextColor('lyric',colordon);
		setTextString('lyric','para mí.');
		addLuaText('lyric');
	end
    if curStep == 234 then
		setTextColor('lyric',colordon);
		setTextString('lyric','En ese instante');
		addLuaText('lyric');
	end
    if curStep == 244 then
		setTextColor('lyric',colordon);
		setTextString('lyric','te aseguro');
		addLuaText('lyric');
	end
    if curStep == 252 then
		setTextColor('lyric',colordon);
		setTextString('lyric','que una señal te di.');
		addLuaText('lyric');
	end
    if curStep == 264 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Pero no me escuchaste,');
		addLuaText('lyric');
	end
    if curStep == 276 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Pero sin intención de tu parte');
		addLuaText('lyric');
	end
    if curStep == 292 then
		setTextColor('lyric',colordon);
		setTextString('lyric','puede serte,');
		addLuaText('lyric');
	end
    if curStep == 300 then
		setTextColor('lyric',colordon);
		setTextString('lyric','un poco débil,');
		addLuaText('lyric');
	end
    if curStep == 307 then
		setTextColor('lyric',colordon);
		setTextString('lyric','el sonido de mi voz.');
		addLuaText('lyric');
	end
    if curStep == 319 then
		removeLuaText('lyric',false);
	end
    if curStep == 327 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Y...');
		addLuaText('lyric');
	end
    if curStep == 337 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Una mañana');
		addLuaText('lyric');
	end
    if curStep == 347 then
		setTextColor('lyric',colordon);
		setTextString('lyric','te veré');
		addLuaText('lyric');
	end
    if curStep == 354 then
		setTextColor('lyric',colordon);
		setTextString('lyric','llegar.');
		addLuaText('lyric');
	end
    if curStep == 357 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Y descubriré');
		addLuaText('lyric');
	end
    if curStep == 367 then
		setTextColor('lyric',colordon);
		setTextString('lyric','yo');
		addLuaText('lyric');
	end
    if curStep == 373 then
		setTextColor('lyric',colordon);
		setTextString('lyric','solo ya no');
		addLuaText('lyric');
	end
    if curStep == 382 then
		setTextColor('lyric',colordon);
		setTextString('lyric','estoy mejor.');
		addLuaText('lyric');
	end
    if curStep == 390 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Y...');
		addLuaText('lyric');
	end
    if curStep == 401 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Te pediré');
		addLuaText('lyric');
	end
    if curStep == 409 then
		setTextColor('lyric',colordon);
		setTextString('lyric','que me acompañes.');
		addLuaText('lyric');
	end
    if curStep == 420 then
        --UNO DE LOS NÚMEROS GRACIOSO ¡QUE CHISTOSO! AAJAJAJJAJAJAJAJJAKAKAKAKS *se muere*
		setTextColor('lyric',colordon);
		setTextString('lyric','¿A dónde? En verdad');
		addLuaText('lyric');
	end
    if curStep == 429 then
		setTextColor('lyric',colordon);
		setTextString('lyric','no lo sé,');
		addLuaText('lyric');
	end
    if curStep == 436 then
		setTextColor('lyric',colordon);
		setTextString('lyric','dime que sí,');
		addLuaText('lyric');
	end
    if curStep == 442 then
		setTextColor('lyric',colordon);
		setTextString('lyric','míenteme.');
		addLuaText('lyric');
	end
    if curStep == 453 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Podría ser');
		addLuaText('lyric');
	end
    if curStep == 457 then
		setTextColor('lyric',colordon);
		setTextString('lyric','que al');
		addLuaText('lyric');
	end
    if curStep == 462 then
		setTextColor('lyric',colordon);
		setTextString('lyric','final.');
		addLuaText('lyric');
	end
    if curStep == 468 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Rompiste el cristal');
		addLuaText('lyric');
	end
    if curStep == 472 then
		setTextColor('lyric',colordon);
		setTextString('lyric','que hay...');
		addLuaText('lyric');
	end
    if curStep == 476 then
		setTextColor('lyric',colordon);
		setTextString('lyric','en mí.');
		addLuaText('lyric');
	end
    if curStep == 485 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Podría pasar');
		addLuaText('lyric');
	end
    if curStep == 495 then
		setTextColor('lyric',colordon);
		setTextString('lyric','que me hagas hablar.');
		addLuaText('lyric');
	end
    if curStep == 503 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Yo creo que');
		addLuaText('lyric');
	end
    if curStep == 506 then
		setTextColor('lyric',colordon);
		setTextString('lyric','tienes el don');
		addLuaText('lyric');
	end
    if curStep == 511 then
		setTextColor('lyric',colordon);
		setTextString('lyric','para curar este mal');
		addLuaText('lyric');
	end
    if curStep == 521 then
		removeLuaText('lyric',false);
	end
	if curStep == 583 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Siento que debo');
		addLuaText('lyric');
	end
	if curStep == 588 then
		setTextColor('lyric',colordon);
		setTextString('lyric','encontrarte');
		addLuaText('lyric');
	end
	if curStep == 596 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Y sin embargo');
		addLuaText('lyric');
	end
	if curStep == 604 then
		setTextColor('lyric',colordon);
		setTextString('lyric','pasa el tiempo');
		addLuaText('lyric');
	end
	if curStep == 609 then
		setTextColor('lyric',colordon);
		setTextString('lyric','yéndome.');
		addLuaText('lyric');
	end
	if curStep == 617 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Hacía mi mismo.');
		addLuaText('lyric');
	end
	if curStep == 627 then
		setTextColor('lyric',colordon);
		setTextString('lyric','A mi centro.');
		addLuaText('lyric');
	end
	if curStep == 617 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Hacía mi mismo');
		addLuaText('lyric');
	end
	if curStep == 636 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Que jamás');
		addLuaText('lyric');
	end
	if curStep == 641 then
		setTextColor('lyric',colordon);
		setTextString('lyric','encontraré.');
		addLuaText('lyric');
	end
	if curStep == 648 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Yo quisiera');
		addLuaText('lyric');
	end
	if curStep == 652 then
		setTextColor('lyric',colordon);
		setTextString('lyric','tenerte.');
		addLuaText('lyric');
	end
	if curStep == 659 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Y tratarte de');
		addLuaText('lyric');
	end
	if curStep == 665 then
		setTextColor('lyric',colordon);
		setTextString('lyric','manera decente.');
		addLuaText('lyric');
	end
	if curStep == 675 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Pero ves');
		addLuaText('lyric');
	end
	if curStep == 680 then
		setTextColor('lyric',colordon);
		setTextString('lyric','que.');
		addLuaText('lyric');
	end
	if curStep == 684 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Ya no puedo.');
		addLuaText('lyric');
	end
	if curStep == 691 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Despegar de');
		addLuaText('lyric');
	end
	if curStep == 697 then
		setTextColor('lyric',colordon);
		setTextString('lyric','mi papel.');
		addLuaText('lyric');
	end
	if curStep == 703 then
		removeLuaText('lyric',false);
	end
	if curStep == 710 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Deberé');
		addLuaText('lyric');
	end
	if curStep == 715 then
		setTextColor('lyric',colordon);
		setTextString('lyric','tranquilizarme.');
		addLuaText('lyric');
	end
	if curStep == 724 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Y jugar');
		addLuaText('lyric');
	end
	if curStep == 731 then
		setTextColor('lyric',colordon);
		setTextString('lyric','al juego que');
		addLuaText('lyric');
	end
	if curStep == 737 then
		setTextColor('lyric',colordon);
		setTextString('lyric','me proponés.');
		addLuaText('lyric');
	end
	if curStep == 746 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Bajo la');
		addLuaText('lyric');
	end
	if curStep == 749 then
		setTextColor('lyric',colordon);
		setTextString('lyric','guardia,');
		addLuaText('lyric');
	end
	if curStep == 756 then
		setTextColor('lyric',colordon);
		setTextString('lyric','te recibo');
		addLuaText('lyric');
	end
	if curStep == 763 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Y me abrigo');
		addLuaText('lyric');
	end
	if curStep == 769 then
		setTextColor('lyric',colordon);
		setTextString('lyric','con tu piel.');
		addLuaText('lyric');
	end
	if curStep == 776 then
		setTextColor('lyric',colordon);
		setTextString('lyric','El destino');
		addLuaText('lyric');
	end
	if curStep == 779 then
		setTextColor('lyric',colordon);
		setTextString('lyric','me ha');
		addLuaText('lyric');
	end
	if curStep == 783 then
		setTextColor('lyric',colordon);
		setTextString('lyric','da-do.');
		addLuaText('lyric');
	end
	if curStep == 787 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Corazones');
		addLuaText('lyric');
	end
	if curStep == 795 then
		setTextColor('lyric',colordon);
		setTextString('lyric','desequilibrados.');
		addLuaText('lyric');
	end
	if curStep == 803 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Tu palabra.');
		addLuaText('lyric');
	end
	if curStep == 811 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Me nivela');
		addLuaText('lyric');
	end
	if curStep == 819 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Y detiene');
		addLuaText('lyric');
	end
	if curStep == 826 then
		setTextColor('lyric',colordon);
		setTextString('lyric','mi caer.');
		addLuaText('lyric');
	end
	if curStep == 831 then
		removeLuaText('lyric',false);
	end
	if curStep == 870 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Y...');
		addLuaText('lyric');
	end
	if curStep == 880 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Una');
		addLuaText('lyric');
	end
	if curStep == 884 then
		setTextColor('lyric',colordon);
		setTextString('lyric','mañana');
		addLuaText('lyric');
	end
	if curStep == 892 then
		setTextColor('lyric',colordon);
		setTextString('lyric','te veré');
		addLuaText('lyric');
	end
	if curStep == 896 then
		setTextColor('lyric',colordon);
		setTextString('lyric','llegar');
		addLuaText('lyric');
	end
	if curStep == 902 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Y descubriré');
		addLuaText('lyric');
	end
	if curStep == 910 then
		setTextColor('lyric',colordon);
		setTextString('lyric','que yo');
		addLuaText('lyric');
	end
	if curStep == 916 then
		setTextColor('lyric',colordon);
		setTextString('lyric','solo ya');
		addLuaText('lyric');
	end
	if curStep == 920 then
		setTextColor('lyric',colordon);
		setTextString('lyric','ya no');
		addLuaText('lyric');
	end
	if curStep == 923 then
		setTextColor('lyric',colordon);
		setTextString('lyric','estoy mejor');
		addLuaText('lyric');
	end
	if curStep == 934 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Y...');
		addLuaText('lyric');
	end
	if curStep == 945 then
		setTextColor('lyric',colordon);
		setTextString('lyric','te pediré');
		addLuaText('lyric');
	end
	if curStep == 950 then
		setTextColor('lyric',colordon);
		setTextString('lyric','que me');
		addLuaText('lyric');
	end
	if curStep == 957 then
		setTextColor('lyric',colordon);
		setTextString('lyric','acompañes.');
		addLuaText('lyric');
	end
	if curStep == 966 then
		setTextColor('lyric',colordon);
		setTextString('lyric','A dónde en verdad');
		addLuaText('lyric');
	end
	if curStep == 973 then
		setTextColor('lyric',colordon);
		setTextString('lyric','no lo sé.');
		addLuaText('lyric');
	end
	if curStep == 980 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Dime que sí');
		addLuaText('lyric');
	end
	if curStep == 987 then
		setTextColor('lyric',colordon);
		setTextString('lyric','míenteme.');
		addLuaText('lyric');
	end
	if curStep == 996 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Podría ser');
		addLuaText('lyric');
	end
    if curStep == 1003 then
		setTextColor('lyric',colordon);
		setTextString('lyric','que al');
		addLuaText('lyric');
	end
    if curStep == 1006 then
		setTextColor('lyric',colordon);
		setTextString('lyric','final.');
		addLuaText('lyric');
	end
    if curStep == 1013 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Rompiste el cristal');
		addLuaText('lyric');
	end
    if curStep == 1018 then
		setTextColor('lyric',colordon);
		setTextString('lyric','que hay...');
		addLuaText('lyric');
	end
    if curStep == 1022 then
		setTextColor('lyric',colordon);
		setTextString('lyric','en mí.');
		addLuaText('lyric');
	end
    if curStep == 1028 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Podría pasar');
		addLuaText('lyric');
	end
    if curStep == 1036 then
		setTextColor('lyric',colordon);
		setTextString('lyric','que me hagas hablar.');
		addLuaText('lyric');
	end
    if curStep == 1046 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Yo creo que');
		addLuaText('lyric');
	end
    if curStep == 1052 then
		setTextColor('lyric',colordon);
		setTextString('lyric','tienes el don');
		addLuaText('lyric');
	end
    if curStep == 1058 then
		setTextColor('lyric',colordon);
		setTextString('lyric','para curar este mal');
		addLuaText('lyric');
	end
	if curStep == 1065 then
		removeLuaText('lyric',false);
	end
	if curStep == 1067 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Es un so-looo.');
		addLuaText('lyric');
	end
	if curStep == 1079 then
		removeLuaText('lyric',false);
	end
	if curStep == 1083 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Es la guitarra de lolo');
		addLuaText('lyric');
	end
	if curStep == 1094 then
		removeLuaText('lyric',false);
	end
	if curStep == 1220 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Podría ser');
		addLuaText('lyric');
	end
    if curStep == 1226 then
		setTextColor('lyric',colordon);
		setTextString('lyric','que al');
		addLuaText('lyric');
	end
    if curStep == 1231 then
		setTextColor('lyric',colordon);
		setTextString('lyric','final.');
		addLuaText('lyric');
	end
    if curStep == 1237 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Rompiste el cristal');
		addLuaText('lyric');
	end
    if curStep == 1244 then
		setTextColor('lyric',colordon);
		setTextString('lyric','que hay...');
		addLuaText('lyric');
	end
    if curStep == 1247 then
		setTextColor('lyric',colordon);
		setTextString('lyric','en mí.');
		addLuaText('lyric');
	end
    if curStep == 1252 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Abriste mi piel');
		addLuaText('lyric');
	end
    if curStep == 1261 then
		setTextColor('lyric',colordon);
		setTextString('lyric','que estaba tan mal.');
		addLuaText('lyric');
	end
    if curStep == 1269 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Quebraste el');
		addLuaText('lyric');
	end
    if curStep == 1274 then
		setTextColor('lyric',colordon);
		setTextString('lyric','silencio.');
		addLuaText('lyric');
	end
    if curStep == 1276 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Que me hizo');
		addLuaText('lyric');
	end
	if curStep == 1283 then
		setTextColor('lyric',colordon);
		setTextString('lyric','alejar');
		addLuaText('lyric');
	end
	if curStep == 1286 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Quízas seas tú');
		addLuaText('lyric');
	end
	if curStep == 1294 then
		setTextColor('lyric',colordon);
		setTextString('lyric','quién me hará regresar');
		addLuaText('lyric');
	end
	if curStep == 1302 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Intuyo que sabes');
		addLuaText('lyric');
	end
	if curStep == 1311 then
		setTextColor('lyric',colordon);
		setTextString('lyric','la forma mejor.');
		addLuaText('lyric');
	end
	if curStep == 1319 then
		setTextColor('lyric',colordon);
		setTextString('lyric','Y tienes el don');
		addLuaText('lyric');
	end
	if curStep == 1326 then
		setTextColor('lyric',colordon);
		setTextString('lyric','que requiere curar este mal.');
		addLuaText('lyric');
	end
	if curStep == 1343 then
		removeLuaText('lyric',false);
	end
end	