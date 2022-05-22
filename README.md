andrewrothstein.kn
=========

![Build Status](https://github.com/andrewrothstein/ansible-kn/actions/workflows/build.yml/badge.svg)

Installs the knative [kn](https://github.com/knative/client) cli.

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.kn
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
