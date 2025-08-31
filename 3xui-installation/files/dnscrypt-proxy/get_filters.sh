#!/bin/bash
filter_path=/opt/dnscrypt-proxy/filters

curl -so $filter_path/ruAdguard.txt https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_1_Russian/filter.txt
curl -so $filter_path/shakal.txt https://schakal.ru/hosts/hosts.txt
curl -so $filter_path/stevenBlack.txt https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts

cat $filter_path/ruAdguard.txt $filter_path/shakal.txt $filter_path/stevenBlack.txt > $filter_path/blocked-names.txt
rm -f $filter_path/ruAdguard.txt $filter_path/shakal.txt $filter_path/stevenBlack.txt
dos2unix $filter_path/blocked-names.txt
awk '/^0.0.0.0/ {print $2}' $filter_path/blocked-names.txt | sort | uniq > $filter_path/formatted-blocked-names.txt
