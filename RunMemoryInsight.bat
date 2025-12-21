@echo off
title Starting Engine

cd /d "D:\Unreal\UE_5.5\Engine\Binaries\Win64\"

start "" UnrealInsights.exe -trace=default,memory,metadata,assetmetadata

start "" UnrealEditor.exe -trace=default,memory,metadata,assetmetadata

pause
