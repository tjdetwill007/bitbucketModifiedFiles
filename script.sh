#! /bin/bash
a=`git diff --name-only HEAD~ HEAD`
echo $a
if [[ -n $a ]];then
	pwd=`pwd`
	mkdir myfiles
	for i in $a
	do 
		cd "$pwd"
		echo "finding answers"
		
		absolute_path= `find ./ $i | grep -E "(^|\s)$i($|\s)" > absolute.text`
		echo "Last was answer"
		# absolute_path=`find ./ $i | grep "$i" | head -1 > absolute.text`
		cat absolute.text
		# final_path=`sed -i "s/^\./""/" absolute.text`
		path=`cat absolute.text`
		# echo $pwd > pwd.txt
		# final_path1=`cat pwd.txt absolute.text | tr -d '\n'`
		install -D "./$path" "myfiles/$path"


		
	done

fi