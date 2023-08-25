#! /bin/bash
a=`git diff --name-only HEAD~ HEAD`
if [ -n $a ];then
	pwd=`pwd`
	mkdir myfiles
	for i in $a
	do 
		cd "$pwd"
		
		absolute_path=`find ./ $i | grep "$i" | head -1 > absolute.text`
		final_path=`sed -i "s/^\./""/" absolute.text`
		path=`cat absolute.text`
		# echo $pwd > pwd.txt
		# final_path1=`cat pwd.txt absolute.text | tr -d '\n'`
		install -D ".$path" "myfiles$path"


		
	done

fi