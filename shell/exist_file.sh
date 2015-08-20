BIND_FOLDER=$1
FOLDER=$BIND_FOLDER"*"
for file in $FOLDER
        do
          #0 unzip the anchor file if it is zipped
            cd $file
            if test -e *.gv;
            then
              echo $file
            fi

done
echo "ALl programs done"
