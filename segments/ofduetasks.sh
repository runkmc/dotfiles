#!/bin/sh
# Ver 0.05
# Lists the specifics of overdue items
# Changes the handling of time zones
OFOC="com.omnigroup.OmniFocus"
if [ ! -d "$HOME/Library/Caches/$OFOC" ]; then OFOC=$OFOC.MacAppStore; fi
OFQUERY="sqlite3 $HOME/Library/Caches/$OFOC/OmniFocusDatabase2"
TODAY=$(date -v0H -v0M -v0S +%s) #Midnight at the start of today: set the time component to 00:00
NOW=$(date +%s)  # the date command automatically allows for daylight savings like BST in the UK
DAY=86400;
NEXTWEEK=$(($NOW + (7 * $DAY)));
YESTERDAY=$(($NOW - $DAY));

ZONERESET=$(date +%z | awk '
{if (substr($1,1,1)!="+") {printf "+"} else {printf "-"} print substr($1,2,4)}') 
YEARZERO=$(date -j -f "%Y-%m-%d %H:%M:%S %z" "2001-01-01 0:0:0 $ZONERESET" "+%s")
DUE="($YEARZERO + t.effectiveDateDue)";
DAY=86400

JOIN="(((task tt left join projectinfo pi on tt.containingprojectinfo=pi.pk) t
left join task p on t.task=p.persistentIdentifier)
left join context c on t.context = c.persistentIdentifier)
left join folder f on t.folder=f.persistentIdentifier"

MATCHES="status='active' and (t.dateCompleted is null and  $DUE < ($NOW + (7 * $DAY))) and ($DUE >= $TODAY)"
OVERMATCHES="status='active' and (t.dateCompleted is null) and ($DUE < $TODAY)"
NEXTMATCHES="(status='active') and ($DUE < ($NOW + (14 * $DAY))) and ($DUE > ($NOW + (7 * $DAY)))"
read overTOTAL weekTOTAL foreTOTAL  <<< $($OFQUERY "
	SELECT count(*) FROM $JOIN WHERE $OVERMATCHES;
	SELECT count(*) FROM $JOIN WHERE $MATCHES;
	SELECT count(*) FROM $JOIN WHERE $NEXTMATCHES;
")

printf "DUE (%s in coming week)\n\n" "$weekTOTAL"

$OFQUERY "
SELECT strftime('%w|%m|%d|%Y|%H:%M',$DUE, 'unixepoch'), p.name, t.name
FROM $JOIN
WHERE $MATCHES
ORDER BY t.effectiveDateDue, f.name, p.name, c.name
" | awk '
function monthname(i) {
	return substr("JanFebMarAprMayJunJulAugSepOctNovDec",((i-1)*3)+1,3)
}
function dayname(i) {
	return substr("SunMonTueWedThuFriSat",(i*3)+1,3)
}
BEGIN {FS="\|"; day=0; year=0; prj=0}
{
	if (day!=$3) {day=$3;
		print dayname($1), monthname($2), $3, $4
	}
	if (prj!=$6) {prj=$6;
		if (prj!="") {print "    " prj ":"}
	}
	print "    •", $5, $7
}'
printf "\nOVERDUE (%s tasks)\n\n" "$overTOTAL"

$OFQUERY "
SELECT strftime('%w|%m|%d|%Y|%H:%M',$DUE, 'unixepoch'), p.name, t.name
FROM $JOIN
WHERE $OVERMATCHES
ORDER BY t.effectiveDateDue, f.name, p.name, c.name
" | awk '
function monthname(i) {
	return substr("JanFebMarAprMayJunJulAugSepOctNovDec",((i-1)*3)+1,3)
}
function dayname(i) {
	return substr("SunMonTueWedThuFriSat",(i*3)+1,3)
}
BEGIN {FS="\|"; day=0; year=0; prj=0}
{
    if ($7 != "") {
	    if (day!=$3 || year!=$4) {day=$3; year=$4;
		    print "Was due " dayname($1), monthname($2), $3, $4
	    }
	    if (prj!=$6) {prj=$6;
		    if (prj!="") {print "    " prj ":"}
	    }
	    print "    •", $5, $7
    }
}'
printf "\n(%s due in following week)\n" "$foreTOTAL"
