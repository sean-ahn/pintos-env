# pintos-env

## How to use 
Based on `macOS`!

### Prerequisite
#### 1. Install docker 
[Official Document](https://docs.docker.com/install/)
#### 2. Install docker-sync
```
$ gem install docker-sync
```
#### 3. Build a image
```
$ docker-compose build
```
`NOTE` For environment setting, I use [this shell script](https://gist.github.com/minsuu/19a271ccf366e168501685c2bc2d6f03) which is officially provided in class.
> You can skip this step, if you are not going to create your own image.
### Start containers
```
$ docker-sync-stack start
```
> Access http://localhost:5000! You can use gdb with GUI!

### Clean containers
```
$ docker-sync-stack clean
```

## Official websites
* [Docker](https://docs.docker.com/)

* [docker-sync](http://docker-sync.io/)

* [gdbgui](https://gdbgui.com/)

