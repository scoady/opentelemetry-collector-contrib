
version=$(cat ./version)
builder --config=otelcontribcol.yaml
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/f3w5w9e7
docker build -t public.ecr.aws/f3w5w9e7/snow-otelcol-contrib:$version . -f Dockerfile-custombuild
docker push public.ecr.aws/f3w5w9e7/snow-otelcol-contrib:$version