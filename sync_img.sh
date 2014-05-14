#!/bin/bash

rsync -e ssh -avz --delete-after static/img/  adrien@vps65859.ovh.net:~/ExerciceDeStyle/static/img/ 

exit 0
