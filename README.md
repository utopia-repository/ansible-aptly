# utopia-openinfra

This repo contains Ansible code to configure an apt repository using [aptly](https://www.aptly.info/). I use this to bootstrap the Utopia Repository, along with its mirrors.

See `hosts.yml` and `group_vars/all.yml` for detailed configuration.

## Contents

- Aptly configuration - default in `/srv/aptly`
- nginx configuration - serves `/srv/aptly` and `/srv/aptly-web` (the latter being static web files if enabled)
- SFTP-only user accounts to upload .changes files for [`aptly include`](https://www.aptly.info/doc/aptly/repo/include/)
- Optional mirroring via rsync

## Items NOT covered here

- GnuPG signing keys (upload or generate these manually)
- TLS certificates for HTTPS support
  - This playbook creates an example config for [`certpush`](https://github.com/jlu5/certpush), a tool I built to bootstrap Let's Encrypt certificates for sites hosted from multiple backends.
  - If you don't care about mirroring and only want a master server, any Let's Encrypt setup or external TLS certificate will do.
- Cron jobs for [automation scripts](https://github.com/utopia-repository/utopia-scripts/) - these are generally very deployment specific

## TODO

- Nightlies autobuilder bootstrap
