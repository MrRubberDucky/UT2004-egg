#!/bin/sh
# Game types:
#
# XGame.xDeathMatch			Standard DeathMatch
# BonusPack.xLastManStandingGame	Last Man Standing
# XGame.xTeamGame			Team DeathMatch
# Onslaught.ONSOnslaughtGame		Onslaught
# XGame.xBombingRun			Bombing Run
# SkaarjPack.Invasion			Invasion
# XGame.xVehicleCTFGame			Vehicle CTF
# UT2K4Assault.ASGameInfo		Assault
# XGame.xDoubleDom			Double Domination
# BonusPack.xMutantGame			Mutant
# XGame.xCTFGame			Capture The Flag
#
# Mutators.
#
# XWeapons.MutArena			Arena
# UnrealGame.MutBigHead			Big Head
# XGame.MutHeliumCorpses		Float-Away Corpses
# XGame.MutInstaGibS			Instagib
# XGame.MutZoomInstaGib			Zoom Instagib
# UnrealGame.MutLowGrav			Low Gravity
# XGame.MutNoAdrenaline			No Adrenaline
# XWeapons.MutNoSuperWeapon		No Super Weapons
# XGame.MutQuadJump			Quad Jump
# XGame.MutRegen			Auto Healing
# XGame.MutSlomoDeath			Slow Motion Deaths
# XGame.MutSpeciesStats			Species Specific Stats
# XGame.MutVampire			Vampire
# UT2004RPG.MutUT2004RPG
################################################################
GAMEDIR=/home/container
INIFILE=${GAMEDIR}/System/UT2004.ini
echo "Modifying ListenPort for WebAdmin"
sed -i "s/^ListenPort=.*/ListenPort=${WEBADMIN_PORT}/" UT2004.ini
echo "Starting UT2004 server"
cd ./System/
./ucc-bin server "${MAP_NAME}?game=${GAMEMODE}?AdminName=${ADMIN_USERNAME}?AdminPassword=${ADMIN_PASSWORD}?Mutator=${MUTATORS}?GamePassword=${GAME_PASSWORD}" -ini="${INIFILE}" -nohomedir -port="${GAME_PORT}"
