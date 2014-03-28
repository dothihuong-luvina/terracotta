if [ "$3"="" ] 
then
	mvn org.apache.maven.plugins:maven-dependency-plugin:2.8:get -Dartifact=$1 -Ddest=$2 -DrepoUrl=mvnrepository.com
else
	mvn org.apache.maven.plugins:maven-dependency-plugin:2.8:get dependency:get -Dartifact=$1 -Ddest=$2 -DrepoUrl=$3
fi
