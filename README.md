# wordpress-bitbucket-pipelines
🐳 Docker Image for testing and deploying WordPress projects through Pipelines

[![](https://images.microbadger.com/badges/version/terriann/wordpress-bitbucket-pipelines.svg)](https://microbadger.com/images/terriann/wordpress-bitbucket-pipelines "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/terriann/wordpress-bitbucket-pipelines.svg)](https://microbadger.com/images/terriann/wordpress-bitbucket-pipelines "Get your own image badge on microbadger.com")

Originally based on github project [peakshift/wordpress-bitbucket-pipelines](https://hub.docker.com/r/peakshift/wordpress-bitbucket-pipelines/~/dockerfile/)


## Kick it off Locally

```sh
docker build -t terriann/wordpress-bitbucket-pipelines:latest .
docker run -d terriann/wordpress-bitbucket-pipelines
```

### To push an update to Dockerhub

This could be automated with webhooks but I'm not quite sure how.

```sh
docker push terriann/wordpress-bitbucket-pipelines
```
