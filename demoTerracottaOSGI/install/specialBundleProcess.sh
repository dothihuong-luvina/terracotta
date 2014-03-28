self="$0"
dir=`dirname "$self"`
CUR_DIR=`cd "$dir/" && pwd`
echo $CUR_DIR
echo "I will proceed special request for Quartz and terracotta bundle"
cd demoTerracottaBundle
eval "mvn clean install"
DESTINATION=$CUR_DIR/../lib/java/bundle
if [ ! -d $DESTINATION ]
then
	mkdir $DESTINATION
fi
cp target/terracottaInMavenBundle-1.0.jar $DESTINATION/terracottaInMavenBundle-1.0.jar

cd $CUR_DIR
if [ ! -d quartz-2.2.1 ]
then
	./checkoutAndInstallQuartz.sh
fi
cp quartz-2.2.1/target/quartz-2.2.1.jar $DESTINATION/quartz-2.2.1.jar

