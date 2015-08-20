des=/Users/weitingtang/Documents/Programming_Project/PTA_Result/testFiles/programs/
for file in ./*
do
  if test -d "$file"; then
    cd "$file"
    if test -e "CH_Analysis_anchors.xml"; then
      if test ! -d $des$file; then
        mkdir -p $des$file
        awk '1;(NR==1){print "<anchors>";}' CH_Analysis_anchors.xml > $des$file/CH_Analysis_anchors.xml
        echo "</anchors>" >> $des$file/CH_Analysis_anchors.xml
        awk '1;(NR==1){print "<dictionary>";}' CH_Analysis_dictionary.xml > $des$file/CH_Analysis_dictionary.xml
        echo "</dictionary>" >> $des$file/CH_Analysis_dictionary.xml
      fi
    fi
    cd ..
  fi
done
