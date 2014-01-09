#!/bin/bash
#
VERTEX=$1
HEAD="Content-Type: application/json"
SIGNER="413389c4-4bd6-4389-a33c-0c0ef3501ad7"
#ID=$2
CONFIGPATH=`pwd`
check_res () {
    
    if [ $? == 0 ]; then 
        echo "Sucess"
    else
        echo "Failed, something went wrong"
    fi  
}

#curl -v -H "$HEAD" -X GET "${VERTEX}:8080/VertexPlatform/certificate/provider/${SIGNER}/remotecerts"
curl -s -o /tmp/cert-mgmt-pro-id.list -H "$HEAD" -X GET "${VERTEX}:8080/VertexPlatform/certificate/provider"
cat /tmp/cert-mgmt-pro-id.list | grep -Po '"id":.*?[^\\]"' | awk -F "\"" '{print $4}' > /tmp/cert-mgmt-pro-id.list.1
ids=`wc -l /tmp/cert-mgmt-pro-id.list.1 | cut -f1 -d' '`
#echo $ids
#[ $ids > 1 ] && echo "Available IDs are "
cat /tmp/cert-mgmt-pro-id.list.1 | nl
