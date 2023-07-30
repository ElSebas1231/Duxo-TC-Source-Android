-------------- [[                   Important                    ]] --------------------
-- Hey, feel free to use this script for an example or if you just want to add something.
-- This script if just to test some shaders, if this is use for a mod, it's not necessary to credit me.
--
-- [Atte. ElSebas1231]
-- Original use in FNF X DUXO: Complete Trilogy
----------------------- [[Shaders stuff]] -------------------------------

local shader = ""
			
---------------------- [Shader List ] -----------------------------------

--[[
  - bloom         (Shader used in bbpanzu's mod)
  - crt           (Analogic TV Shader)
  - vhs           (Shader from Lofi Funkin')
  - vhs 2         (VHS Effect)
  - pixel         (Pixel Censor Shader)
  - snowfall      (Shader used in Frostbite)
  ]]

-------------------------------------------------------------------------
function onCreate()
    if shader == "bloom" then
        addLuaScript('extrastuff/bloom shader')
    end
    if shader == "crt" then
        addLuaScript('extrastuff/crt shader')
    end
    if shader == "vhs" then
        addLuaScript('extrastuff/vhs shader')
    end
    if shader == "vhs 2" then
        addLuaScript('extrastuff/vhs shader 2')
    end
    if shader == "glitch" then
        addLuaScript('extrastuff/glitch')
    end
    if shader == "pixel" then
        addLuaScript('extrastuff/pixel shader')
    end
    if shader == "snowfall" then
        addLuaScript('extrastuff/snowfall')
    end
    if shader == "demon blur" then
        addLuaScript('extrastuff/demon blur shader')
    end
end