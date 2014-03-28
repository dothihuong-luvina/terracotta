self="$0"
while [ -h "$self" ]; do
	res=`ls -ld "$self"`
	ref=`expr "$res" : '.*-> \(.*\)$'`
	if expr "$ref" : '/.*' > /dev/null; then
		self="$ref"
	else
		self="`dirname \"$self\"`/$ref"
	fi
done

dir=`dirname "$self"`
CUR_DIR=`cd "$dir/" && pwd`
SPECIAL_REQUEST=FALSE
# Get input parameters
while [ "$1" != "" ]; do
	case $1 in 
		-sp | --special ) SPECIAL_REQUEST="TRUE"
		;;
		-h | --help )	usage
				exit
		;;
	esac
	shift
done

while read line
do
	while IFS=',' read -ra ADDR; do
		echo Artifact: ${ADDR[0]}
		echo Destination: ${CUR_DIR}${ADDR[1]}
		DESTINATION=${CUR_DIR}${ADDR[1]}
		echo Repository: ${ADDR[2]}
		if [ ! -d $DESTINATION ]
		then
			mkdir -p $DESTINATION
		fi
		./getBundle.sh ${ADDR[0]} $DESTINATION/ ${ADDR[2]}
	done <<< $line
done < listBundle

if [ "$SPECIAL_REQUEST" == "TRUE" ]
then
	./specialBundleProcess.sh
fi

