### Build image

```bash
docker run -d -p 5000:5000 --restart=always --name registry registry:2 # only needed first time
docker buildx build -t localhost:5000/kicad-balena:latest --file Dockerfile .
docker push localhost:5000/kicad-balena:latest 
```