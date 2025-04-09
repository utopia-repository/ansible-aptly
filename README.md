# utopia-openinfra

This repo contains Ansible code to configure an apt repository using [aptly](https://www.aptly.info/). I use this to bootstrap the Utopia Repository, along with its mirrors.

See `hosts.yml` and `group_vars/all.yml` for detailed configuration.

## Contents

- Aptly configuration - default in `/srv/aptly`
- SFTP-only user accounts to upload .changes files for [`aptly include`](https://www.aptly.info/doc/aptly/repo/include/)
- Optional mirroring via rsync

## Items NOT covered here

- GnuPG signing keys (upload or generate these manually)
- Cron jobs for [automation scripts](https://github.com/utopia-repository/utopia-scripts/) - these are generally very deployment specific
