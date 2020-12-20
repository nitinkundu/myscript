if [ $(docker ps -qf "name=$1") ]
then
echo "from if block"
docker kill $1 && docker rm $1
echo "$1 container is killed and removed"
docker run -d -e PGPASSWORD=$3 -e https_proxy=$4 -e http_proxy=$5 --name $1 $2 sleep infinity
docker ps
else
echo "from else block"
docker run -d -e PGPASSWORD=$3 -e https_proxy=$4 -e http_proxy=$5 --name $1 $2 sleep infinity
docker ps
fi
