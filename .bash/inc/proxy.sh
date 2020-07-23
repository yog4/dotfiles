proxy_print() {
    echo HTTP_PROXY=$HTTP_PROXY;
    echo HTTPS_PROXY=$HTTPS_PROXY;
    echo NO_PROXY=$NO_PROXY
    echo http_proxy=$http_proxy;
    echo https_proxy=$https_proxy;
    echo no_proxy=$no_proxy
}

proxy_config_edit() {
    code /usr/local/etc/cntlm.conf
}

proxy_config_print() {
    cat /usr/local/etc/cntlm.conf
}

proxy_verify() {
    cntlm -v -M http://google.com
}

proxy_foreground() {
    cntlm -v -f
}

proxy_status() {
    brew services list | grep --color=never 'Name\|cntlm'
}

proxy_stop() {
    brew services stop cntlm
    proxy_status
}

proxy_start() {
    brew services start cntlm
    proxy_status
}

proxy_restart() {
    proxy_stop
    proxy_start
}

proxy_unset() {
    unset NO_PROXY ALL_PROXY HTTP_PROXY HTTPS_PROXY no_proxy all_proxy http_proxy https_proxy
    proxy_print
}

proxy_set() {
    export NO_PROXY=$BASH_IT_NO_PROXY
    export ALL_PROXY=$BASH_IT_HTTP_PROXY
    export HTTP_PROXY=$BASH_IT_HTTP_PROXY
    export HTTPS_PROXY=$BASH_IT_HTTPS_PROXY

    export no_proxy=$BASH_IT_NO_PROXY
    export all_proxy=$BASH_IT_HTTP_PROXY
    export http_proxy=$BASH_IT_HTTP_PROXY
    export https_proxy=$BASH_IT_HTTPS_PROXY
}

proxy_enable() {
    proxy_set
    if [ ! -e $HOME/.proxy_enable ]; then
        if [ -n "$BASH_VERSION" ]; then
            bash-it enable plugin proxy
            enable-proxy
        fi
        if [ "$(uname)" = "Darwin" ]; then
            # networksetup -switchtolocation "Automatic" > /dev/null
            networksetup -setwebproxy Wi-Fi 127.0.0.1 3128 off
            networksetup -setsecurewebproxy Wi-Fi 127.0.0.1 3128 off
        fi
        touch $HOME/.proxy_enable
    fi
}

proxy_disable() {
    proxy_unset

    if [ -e $HOME/.proxy_enable ]; then
        rm -f $HOME/.proxy_enable
        if [ -n "$BASH_VERSION" ]; then
            disable-proxy
        fi
        if [ "$(uname)" = "Darwin" ]; then
            # networksetup -switchtolocation "No Proxy" > /dev/null
            networksetup -setwebproxystate Wi-Fi off
            networksetup -setsecurewebproxystate Wi-Fi off
        fi
    fi
}
