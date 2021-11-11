include "./config/dependencies.lua"
workspace "OpenGL Games"

    include "./config/configurations.lua"
    include "./config/platforms.lua"

    flags
    {
        MultiProcessorCompile
    }

    filter {"platforms:Win64 or Linux64 or Mac64"}		--	x86_64
        architecture "x86_64"

    filter {"platforms:Win32 or Linux32 or Mac32"}		--	x86
        architecture "x86"

    filter {"platforms:iOS-ARM or Android-ARM"}				--	ARM
        architecture "ARM"

    filter {"system:windows"}			--	WINDOWS
        removeplatforms { "Linux32", "Linux64", "Mac32", "Mac64" }
        defaultplatform "Win64"

    filter {"system:linux"}				--	LINUX
        removeplatforms { "Win32", "Win64", "Mac32", "Mac64" }
        defaultplatform "Linux64"

    filter {"system:macosx"}			--	MACOS
        removeplatforms { "Linux32", "Linux64", "Win32", "Win64" }
        defaultplatform "Mac64"
    filter ""

    -- Debug/Release/Dist /-/ Built on OS /-/ Built for OS
    outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.platform}"

    group "Dependencies"
        include "vendor/premake"
        include "vendor/glfw"
        include "vendor/Glad"
    group ""

    group "Games"
        include "testing"
    group ""

