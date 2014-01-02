rm *temp-*m4a

for thing in *.m4a
do
AtomicParsley "$thing" -W \
--artist 'The Gregory Brothers' \
--track "$(echo "$thing" | egrep -o '[0-9]+ ' | head -n1 | xargs printf "%d")"/$(ls -1 *.m4a | wc -l) \
--title "$(echo "$thing" | egrep -o ' - (.*).m4a' | sed -r s'/\.-[a-zA-Z0-9]+\.m4a$//' | sed -r s/'^ - '//)"
done

# Un-tempfile-ify
for thing in *temp*
do
mv "$thing" "$(echo -n "$thing" | sed -r 's/-temp-[0-9]+.m4a//' | xargs -0 -n1 printf "%s.m4a\n")"
done
