#!/bin/bash

mount -t cifs -o username=USER,domain=DOMAIN,uid=1000,gid=1000 //xxx.xxx.xxx.xxx/Files /media/fs/
