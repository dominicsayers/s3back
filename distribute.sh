#!/bin/bash
cd "$(dirname $0)"

BASE=$(pwd)

set -a
source .awsrc
set +a

mkdir -p backups
chmod a+w backups
cd backups

for f in *
do
        EXTENSION=
        ROOT=${f}

        while [[ ${ROOT} = ?*.* ]] ; do
                EXTENSION=${ROOT##*.}.${EXTENSION}
                ROOT=${ROOT%.*}
        done

        EXTENSION=${EXTENSION%.*}

        if [[ ${ROOT} != postgres ]] && [[ ${ROOT} != template1 ]];
        then
                BUCKET=$(echo ${ROOT} | sed -e s/_/-/)
                echo Sending ${ROOT} to bucket ${BUCKET}
                # s3cmd -c "${BASE}/.s3cfg" --rr -H put ${f} "s3://${BUCKET}/backups/${ROOT}-`date +%Y-%m-%d`.${EXTENSION}"
                aws s3 cp ${f} "s3://${BUCKET}/backups/${ROOT}-`date +%Y-%m-%d`.${EXTENSION}"
        fi
done
