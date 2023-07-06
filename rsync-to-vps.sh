#! /bin/bash
rsync -Pazv -e 'ssh -p 2323' --delete  /media/cardinal/NextcloudSSD/vscode/crdnlvps/hugo/* root@65.109.143.28:/mnt/HC_Volume_29512218/docker/hugo/
