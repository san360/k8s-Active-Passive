#!/bin/sh

podhealth() {
        hostName=$HOSTNAME
        statefulSetName=${hostName%??} #Remove -0,-1 from stateful set name       
        activepod=$(for i in 0 1; do echo $statefulSetName-$i;done | grep -v $HOSTNAME)
        echo "executing curl for "$activepod.$POD_SERVICE_NAME.$POD_NAMESPACE.svc.cluster.local
        curl -I $activepod.$POD_SERVICE_NAME.$POD_NAMESPACE.svc.cluster.local
        if [[ $? -ne 0 ]] #check the status of curl request
          then
            return 0 #success status code
          else
            return 1 #failure code
        fi
}

podhealth