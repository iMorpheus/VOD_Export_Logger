#!/bin/zsh
set -euo pipefail
IFS=$'\n\t'

#### PURPOSE
# Type: Logger
# Purpose: Log exported Vods from Twitch to YouTube
####

### VOD INFO
PS3="Select Game: "
select Game in GTSport Returnal NMS FO76 GoT Podcast RDR2 CP2077
do
case $Game in
  GTSport)
    Game="GT Sport"
    ;;
  CP2077)
    Game="CP 2077"
    ;;
*)
esac
break
done

read -r "Date?Date: "
read -r "Title?What is the Vod's title: "
PS3="Select Hours: "
select HH in 01 02 03 04 05 06 07 08 09 10 11 12 13
do
break
done
read -r "MM?How many minutes long: "
read -r "SS?How many seconds long: "
PS3="Select Header: "
select THeader in Gaming Radio
do
case $THeader in
  Gaming)
     THeader="FCC Gaming:"
     ;;
  Radio)
     THeader="Fancy Coffee Club Radio:"
     ;;
*)
esac

break
done

### OUTPUT
print "$Date,$THeader $Title,$Game,$HH:$MM:$SS" | pbcopy

### FILE SELECT
PS3="Select Month: "
select Month in Jan Feb Mar Apr May Jun Jul Aug Sept Oct Nov Dec
do
case $Month in
  Jan)
    Month="01"
    ;;
  Feb)
    Month="02"
    ;;
  Mar)
    Month="03"
    ;;
  Apr)
    Month="04"
    ;;
  May)
    Month="05"
    ;;
  Jun)
    Month="06"
    ;;
  Jul)
    Month="07"
    ;;
  Aug)
    Month="08"
    ;;
  Sept)
    Month="09"
    ;;
  Oct)
    Month="10"
    ;;
  Nov)
    Month="11"
    ;;
  Dec)
    Month="12"
    ;;
*)
esac
break
done

### WRITE
pbpaste >> ~/[PathToFile]/"$Month"_2021_Vods.csv
