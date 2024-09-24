mkdir tmp
cat list.txt | while read line 
do

number=$( echo $line | cut -d' ' -f1)
first_name=$( echo $line | cut -d' ' -f2)
last_name=$( echo $line | cut -d' ' -f3)
#last_name="Mc Donald"


filename=tmp/volunteer-20-name-to-merge.$number.$first_name.$last_name.svg


cp sources/Volunteer-20-mug-base-tomerge-2.png.svg $filename
#cp sources/supporters/founding-supporter-mug-design-name-to-merge.svg $filename

sed -i 's/Jerry/'$first_name'/g' $filename
sed -i 's/Dylan/'"$last_name"'/g' $filename
echo $first_name
echo $last_name
inkscape $filename --export-png=$number.$first_name.$last_name.png
rm $filename

done 


