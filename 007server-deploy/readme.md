## ubuntu [java web maven] 部署脚本

1. 部署环境

    > 需要安装或下载以下软件和包
    
    - maven
        
        > `mvn` 加入环境变量
        
    - svn
    
        > `svn` 加入环境变量
        
    - tomcat
    

2. 服务器结构

    - /opt/sources
        
        > svn checkout 源码的路径（可自定义）
        
        > 假设已经在此文件夹checkout了名为 `my-blog` 的项目 
        
        
    - /opt/tomcat7_my_blog
    
    
        > tomcat 路径（可自定义）
    
3. 如何使用

    - 部署
    
        > 创建 `deploy_my_blog.sh` 文件
        
            #!/bin/sh
            #build dependency projects
            
            #读取maven -P 的参数
            export profile=`cat profile`
            #指定checkout源码路径
            export sourceroot=/opt/sources
            
            #打包war
            ./mbuild.sh my_blog package $profile
            #部署war，会自动重启tomcat
            ./mdeploy.sh my_blog /opt/tomcat7_my_blog/


