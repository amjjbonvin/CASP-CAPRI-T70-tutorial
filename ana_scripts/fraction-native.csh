#!/bin/csh
#
if (! $?WDIR) then
  echo "Define first the target environment variables by"
  echo "sourcing the set-target.csh file in ana_scripts"
endif

cat /dev/null >file.nam_fnat
mkdir contacts
foreach i ($argv)
  $WDIR/contact $i 5.0 > contacts/$i:t:r".contacts"
  echo $i |awk '{printf "%s ",$1}' >>file.nam_fnat
  awk '{nr = 100000 * $1 + $4} FILENAME == ARGV[1] && (!(nr in done1)){done1[nr] = 1; counter++; contact[nr] = $1} FILENAME == ARGV[2] && (!(nr in done2)) {done2[nr] = 1; if(nr in contact) natcounter++} END {print natcounter / counter}' $CONTACT contacts/$i:t:r".contacts" >>file.nam_fnat
end

