#!/bin/bash

echo "APT Repository Packages Creation/Update Script"
echo "Created by EthanRDoesMC"

echo "Would you like to remove the current Packages file(s)?"
select yn in "Yes" "No"; do
case $yn in
Yes ) rm Packages; rm Packages.gz; rm Packages.bz2; break;;
No ) mv Packages OldPackages; mv Packages.gz OldPackages.gz; mv Packages.bz2 OldPackages.bz2; break;;
esac
done


dpkg-scanpackages --multiversion debs > Packages


echo "Would you like to convert the newly created Packages file into gzip/bzip2?"
select yn in "Yes" "No"; do
case $yn in
Yes ) gzip -c9 Packages > Packages.gz; bzip2 -c9 Packages > Packages.bz2; break;;
No ) break;;
esac
done

echo "Done!"
exit