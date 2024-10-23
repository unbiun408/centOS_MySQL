#centOS 7作为基础镜像
FROM centos:7.9.2009
维护者信息
LABEL maintainer="2514770920@qq.com"
#设置MySQL版本环境变量
ENV MYSQL_VERSION 5.7.36
 #移除已经安装的mysql及其依赖
RUN yum remove mysql* -y
#安装前配置
COPY ./mysql_entrypoint.sh /mysql_entrypoint.sh                  #将启动脚本拷贝到容器
RUN chmod 755 /mysql_entrypoint.sh \                          #将启动脚本配置为可执行
&& ln -s /mysql_entrypoint.sh /usr/bin/mysql_entrypoint.sh       #创建启动脚本软件软链接
#安装Mysql5.7
RUN yum update -y && \
    yum install -y wget && \
    wget http://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm && \
    yum -y install mysql57-community-release-el7-11.noarch.rpm && \
    rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022 && \
    yum -y install mysql-server
CMD ["mysql_safe"] 
