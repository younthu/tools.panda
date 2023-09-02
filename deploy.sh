RAILS_ENV=production bundle exec rails assets:precompile

docker build . -t registry.cn-shanghai.aliyuncs.com/younthu/tools.panda:latest

docker login --username=younthu --password=xxxxxxx registry.cn-shanghai.aliyuncs.com

docker push registry.cn-shanghai.aliyuncs.com/younthu/tools.panda:latest

ssh yoga.ilibrary.me "./restart_tools.panda.sh"
