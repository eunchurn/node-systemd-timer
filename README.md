# node-systemd-timer

system daemon timer tester in CentOS

## Usage

- `yarn` install dependencies
- `yarn build` build source to `dist`

## Local test

### Env

```sh
yarn local:dev
```

### Container run & log

```sh
docker-compose up -d && docker-compose exec server journalctl -f -u sample.service
```

only loggin with running container

```sh
docker-compose exec server journalctl -f -u sample.service
```
