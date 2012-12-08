#!/bin/bash

TRG='~/public_html/'

if [ $1 ] # optional name

	then
		DIR=$1;

	else
		DIR="${PWD##*/}";
fi

export DIR


if [ -d $TRG/sites/$DIR ];

	then
		echo "Host Directory already exists !";

	else
		ln -s $PWD $TRG/sites
		mkdir $TRG/_logs/$DIR
		echo "Created Directory,";
fi


# Run this script as root if not already.
as_root () {

	if [ ! $( id -u ) -eq 0 ]; then

		echo "Please enter your password."
		exec sudo su -c "${0} ${CMDLN_ARGS}" # Call this prog as root
		exit ${?}
	fi

}

as_root										# execute as sudo

# read template - replace data - write into a new file
cat /etc/apache2/sites-available/_template | sed "s/{template}/$DIR/g" | cat > /etc/apache2/sites-available/$DIR

a2ensite $DIR								# enable add virtual host

service apache2 reload						# restart server

echo 127.0.0.1		$DIR.dev >> /etc/hosts	# create reference
