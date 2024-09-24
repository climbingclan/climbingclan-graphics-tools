mkdir tmp
cat events.txt | while read line 
do

dates=$( echo $line | cut -d',' -f2)
event_name=$( echo $line | cut -d',' -f1)
filename=tmp/weekend.$event_name.svg

cp Social-Media.1.svg $filename
sed -i 's/'18th-20thMarch'/'$dates'/g' $filename
sed -i 's/'SouthSnowdoniaWeekend'/'$event_name'/g' $filename
echo $dates
echo $event_name
inkscape $filename --export-png=weekend.$event_name.png
rm $filename

done 


