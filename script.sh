mkdir tmp
cat list.txt | while read line 
do

number=$( echo $line | cut -d' ' -f1)
first_name=$( echo $line | cut -d' ' -f2)
last_name=$( echo $line | cut -d' ' -f3)
#last_name="Mc Donald"


filename=tmp/founding-member-mug-design-draft3-name-to-merge.$number.$first_name.$last_name.svg

cp member-mug-design-name-to-merge-2023.svg $filename
#cp founding-member-mug-design-draft3-name-to-merge.svg $filename ##old design
#cp sources/supporters/founding-supporter-mug-design-name-to-merge.svg $filename

sed -i 's/Rebs/'$first_name'/g' $filename
sed -i 's/Price/'"$last_name"'/g' $filename
echo $first_name
echo $last_name
inkscape $filename --export-png=$number.$first_name.$last_name.png
rm $filename

done 


