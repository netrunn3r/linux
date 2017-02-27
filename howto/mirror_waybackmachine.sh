#!/bin/bash

# eg:
# wayback_url=http://web.archive.org/web/20160514215409/http://c.learncodethehardway.org/book/
# domain_name=c.learncodethehardway.org/book/
wayback_url=$1
#domain_name=$2

httrack\
    ${wayback_url}\
    '-*'\
    '+*/${domain_name}/*'\
    -N1005\
#    --advanced-progressinfo\
    --can-go-up-and-down\
    --display\
    --keep-alive\
    --mirror\
    --robots=0\
    --user-agent='Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.100 Safari/537.36'\
#    --verbose
