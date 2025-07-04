# develop_environment
## 第一步
- 优先执行init脚本进行创建容器依赖的文件及文件夹
```
docker-compose run --rm init
```
- 查看脚本是否创建文件夹与文件
```
cd /opt
ll
cd /opt/nginx
ll
cd /opt/emqx
ll
cd /opt/mysql
ll
cd /opt/redis
ll
```

## 第二步
- 执行容器与镜像的创建
```
docker-compose up -d
```
- 查看镜像与容器是否正常
```
docker images // 查看镜像

docker ps // 正常执行的容器

docker ps -a // 全部容器（包括执行失败的）

docker stop xx // 结束容器

docker start xx // 开启容器

docker rm xx // 删除容器

docker rmi xx // 删除镜像
```