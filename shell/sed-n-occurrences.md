# Using sed to replace different patterns of occurrences

-   `sed 's/old/new/3'`: replaces third match
-   `sed 's/old/new/g`: replaces all matches
-   (GNU sed only) `sed 's/old/new/g3'`: replaces third match and all after
-   `sed -e 's/,/+/' -e 's/,/+/'`: replaces first two occurrences
