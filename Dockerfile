FROM busybox:1.31.1

ENTRYPOINT sh -c "cd /tmp/.githooks && ls | xargs chmod +x && cd /tmp/.git/hooks && find ../../.githooks -type f -exec ln -sf {} /tmp/.git/hooks/ \; && echo 'githooks installed'"
