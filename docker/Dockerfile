FROM alpine:3.12

LABEL AUTHOR="none" \
      VERSION=0.1.4

ARG KEY="-----BEGIN RSA PRIVATE KEY-----
MIIEoQIBAAKCAQEAqxaYwZWqAXWZ0g+NEjPjKFDJyIGYu/nMU8CD3Drr+jEb2SWo
H+FBB6LOorDRAQAKnadwFdUUCh0LT65XW8u1aJJO+INcFZPKZBggW3sue/qpyfPw
XRLOA6WQFS7UHfS8ZxOPUd6ENqCZAN+CZ5uyGo7amGIpCbiMPFXZG5o76MTGNRW9
JGA1d4XFzrvlYHq68f5W/vPlVTg2I7Jf9b1+QhZ1P1JWRQfLR/+CD5DcG7ApqviN
y6hoddBxgc3RZ2tn5LNAc/KE7LvZinQw3Waa3QwCmlbXcbXnpFVRQKRzNzCySYfU
yCKEAR4ZpV2fLt52umE42V0EXjASOdt7mnd3YwIBIwKCAQBX/P4aajosouFkt4ph
If/Ll0Mz6uDVs6rpPm+zFv0EU8Ut2NofBiFxpC/BYj+aHUdJw9M+bZVHB59qzrCV
m/blUo8DdsGksmgWOEsnu7GBltr6Ja7Qx9eqGqHfAiPyJhe/+25HXH6CfnqSvBct
+Ez3ty6XgvCIqA2bX1m2bJPWysFv4k6MzV1PLaWev2H/YQz+7jxrzmmZLnPeBMJt
IDgJt5OgQgfANUEPm04A055mPdcdpre20X8PvuuvgGi9etFWBsyjlINlvnV0yhkm
akr0HxIhCos/Ht7O8X9XHkcX6sQ0F06OfhlIo30p3NfTBGqoxJ82OKxLflW1ejiG
MhO7AoGBAN8OqMoD8l2Xd/CGnPiCFZd6qrfj3x8fq9CynG3fq5U3t2Nh5U5jacQD
torOJg4o0Q+EPMHSOu5B9GK5QwMQgBOqZV9q44SnALi1TzFLNw+6gtwD3uimMRRe
T3yiCvxlL8ukRI7JnrNHX21PFdxyhHIwe+4R+PS2RUCEiCUz2wE9AoGBAMRbGHbV
whQ3373oxzyKRN+HoNRJdTHElaCWt1uXNtFpQTns7KN6GgjCYhh4suEPn777TPT5
gMo/6NK6ZnR0tWfaJDauiqtxrFjj1Osc0qQO92bkcacmHiII910DbNAjf4WVTtfp
ci3I8o5L/eYwQzUlSob6Z6QxkZzUc+h+HqUfAoGBANivJ5+sEAMlbTLL6PFobL8J
cqQB7rCFKpA4erPgmA1METv4st5vM4s2zpV3zTJTiUJF8eDa2ilHYm6IFTYtSTes
14FDQ2rrX8lfrAP/7FhsCheOu0hm7dlFrE0vsuaOLm4NSenLLHOka1Q+Mn5gnetF
CqzBAHixEBLJ41dW8gEzAoGAZPumLnyPsqBkcEvULcNz4Kwm05N+GZhM84C2Edi9
Gz1yAIh5syjaMGP371QEOTs8NlVaxyE666vW0sZDUdWfH3eAVqLoOuoA3UH4eOpA
caFMCQfFa+e3ubt35rFN52K2nHisNIavv8ZuHUunJezvXSkfA5a49VtSM2Xyd5FR
lr8CgYBh8PAN+FbS/6hdlW3oFRXB4ITtJbpO2X+9wZG7z95enTsy8Q70goBy8pGc
vyddAO4rv1wRpyCI4DCPf/c6Ox6e2323rhBnao075d2loM7EJXemCYWWRl2DuIv7
S9TEXYFZqklKrtLmbK/tQmwzIScHVLTOxdrN4reezKlVnRitAg==
-----END RSA PRIVATE KEY----"
ENV DEFAULT_LIST_FILE=crontab_list.sh \
    CUSTOM_LIST_MERGE_TYPE=append \
    COOKIES_LIST=/scripts/logs/cookies.list \
    REPO_URL=https://github.com/asdfvv/rvdongdong.git \
    REPO_BRANCH=main

RUN set -ex \
    && apk update \
    && apk upgrade \
    && apk add --no-cache tzdata git nodejs moreutils npm curl jq openssh-client \
    && rm -rf /var/cache/apk/* \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && mkdir -p /root/.ssh \
    && echo -e $KEY > /root/.ssh/id_rsa \
    && chmod 600 /root/.ssh/id_rsa \
    && ssh-keyscan gitee.com > /root/.ssh/known_hosts \
    && git clone -b $REPO_BRANCH $REPO_URL /scripts \
    && cd /scripts \
    && mkdir logs \
    && npm config set registry https://registry.npm.taobao.org \
    && npm install \
    && cp /scripts/docker/docker_entrypoint.sh /usr/local/bin \
    && chmod +x /usr/local/bin/docker_entrypoint.sh

WORKDIR /scripts

ENTRYPOINT ["docker_entrypoint.sh"]

CMD [ "crond" ]
