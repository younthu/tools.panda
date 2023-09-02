docker login --username=651xxx@qq.com --password=xxxxxx1212036 registry.cn-shanghai.aliyuncs.com

docker pull registry.cn-shanghai.aliyuncs.com/younthu/tools.panda:latest

docker run --rm -e RACK_ENV=production registry.cn-shanghai.aliyuncs.com/younthu/tools.panda:latest bundle exec rake db:migrate

docker rm -f tools.panda_sidekiq

docker run -d --restart=always --name tools.panda_sidekiq registry.cn-shanghai.aliyuncs.com/younthu/tools.panda:latest bundle exec sidekiq -C config/sidekiq.yml -e production

docker rm -f tools.panda

docker run -d --restart=always -p 3000:3000 --name tools.panda registry.cn-shanghai.aliyuncs.com/younthu/tools.panda:latest bundle exec rails s -e production

docker image prune -f
docker container prune -f

docker ps

docker network connect --alias tools.panda tools.panda-net tools.panda

docker logs -f tools.panda
