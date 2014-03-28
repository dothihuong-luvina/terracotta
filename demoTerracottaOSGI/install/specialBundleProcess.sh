self="$0"
dir=`dirname "$self"`
CUR_DIR=`cd "$dir/" && pwd`
echo $CUR_DIR
echo "I will proceed special request for Quartz and terracotta bundle"
cd demoTerracottaBundle
eval "mvn clean install"

if [ ! -d $CUR_DIR/lib/java/bundle ]
then
	mkdir $CUR_DIR/lib/java/bundle
fi
cp target/terracottaInMavenBundle-1.0.jar $CUR_DIR/lib/java/bundle/terracottaInMavenBundle-1.0.jar

cd $CUR_DIR
if [ ! -d quartz-2.2.1 ]
then
	./checkoutAndInstallQuartz.sh
fi
cp quartz-2.2.1/target/quartz-2.2.1.jar $CUR_DIR/lib/java/bundle/quartz-2.2.1.jar

