# Grav Docker container

### Simple use

```
docker run \
  -v $(pwd)/user:/var/www/html/user \
  -p 3030:80 \
  --name mygrav -d benjick/grav
docker exec mygrav bin/gpm install antimatter
```

Now you can go to localhost:3030 and see your page in action.

### Build your app

If you want to push your app to a registry this might be what your `Dockerfile` looks like

```
FROM benjick/grav:latest
COPY ./user /var/www/html/user
```

Where `user` is the user-folder for your Grav site

#### For Mac

https://github.com/adlogix/docker-machine-nfs
