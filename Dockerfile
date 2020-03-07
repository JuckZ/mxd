# 用于创建hexo博客
# 作者：Juck
# 创建时间 2020/2/21
# 基础镜像
FROM node:13.8.0
# 设置挂载目录，用于持久化文件
# VOLUME [ "/mnt/hgfs/VMShare/dockerHD/blog/hexoBlog" ]

# 声明要使用的端口，但不是真正映射出去，需要运行时加-p或-P参数
EXPOSE 4020/tcp

# 设置enterpoint
# ENTRYPOINT [ "" ]

# 设置npm国内镜像源
RUN npm config set registry https://registry.npm.taobao.org --global
RUN npm config set disturl https://npm.taobao.org/dist --global


# 设置apt镜像源，注意第一行是一个>，其后每一行是两个>
# RUN echo "deb -----" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/debian/ stretch main non-free contrib" > /etc/apt/sources.list \ 
&& echo "deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib" >> /etc/apt/sources.list \ 
&& echo "deb http://mirrors.163.com/debian/ stretch-backports main non-free contrib" >> /etc/apt/sources.list \ 
&& echo "deb-src http://mirrors.163.com/debian/ stretch main non-free contrib" >> /etc/apt/sources.list \ 
&& echo "deb-src http://mirrors.163.com/debian/ stretch-updates main non-free contrib" >> /etc/apt/sources.list \ 
&& echo "deb-src http://mirrors.163.com/debian/ stretch-backports main non-free contrib" >> /etc/apt/sources.list \ 
&& echo "deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib" >> /etc/apt/sources.list \ 
&& echo "deb-src http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib" >> /etc/apt/sources.list

RUN npm install http-server -g
WORKDIR /var/mxd