#this image use centos image
FROM centos


#镜像操作指令
RUN yum install -y wget
RUN wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo

#更改安装源
#rpm -Uvh https://mirror.webtatic.com/yum/el7/epel-release.rpm


#安装nginx,php,redis
RUN yum install -y nginx



#更改nginx配置文件
ADD nginx.conf /etc/nginx/nginx.conf
#不以后台进程的方式启动
RUN echo "daemon off;" >> /etc/nginx/nginx.conf


#增加启动脚本
ADD start.sh  /etc/opt/start.sh
#增加执行权限
RUN chmod +x /etc/opt/start.sh

EXPOSE 80

#运行启动脚本,除了nginx以前端的方式运行之外,其他的服务都以后端的形式存在
ENTRYPOINT ["/etc/opt/start.sh"]
