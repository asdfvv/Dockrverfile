FROM alpine
LABEL AUTHOR="Akira <e.akimoto.akira@gmail.com>" \
        VERSION=0.0.7 \
        UPDATE_CONTENT="增加汽车之家极速版及相关配置更新,修正汽车之家极速版多账号执行异常bug，请参考dockerhub仓库(https://hub.docker.com/r/akyakya/pack_some_script)readme配置"

RUN set -ex \
        && apk update && apk upgrade\
        && apk add --no-cache tzdata \
        git \
        nodejs \
        moreutils \
        npm \
        python3-dev \
        py3-pip \
        py3-cryptography \
        jq \
        curl \
        && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
        && echo "Asia/Shanghai" > /etc/timezone

# 配置镜像仓库配置相关文件夹
# 创建工作目录
RUN mkdir /logs \
        && mkdir /pss \
        && cd  /pss \
        && git init \
        && git remote add -f origin https://github.com/asdfvv/Dockrverfile.git \
        && git config core.sparsecheckout true \
        && echo pack_some_script/* >> /pss/.git/info/sparse-checkout \
        && git pull origin master \
        && cp /pss/pack_some_script/crontab_list.sh /pss/crontab_list.sh


# github action 构建
COPY ./pack_some_script/docker_entrypoint.sh /usr/local/bin/
# 本地构建
# COPY ./docker_entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker_entrypoint.sh \
        &&  crontab /pss/crontab_list.sh




ENTRYPOINT ["docker_entrypoint.sh"]
