PetClinic
----

Requirements
====
✓ The applications homepage is accessible at the root context i.e. http://<IP Address>/

- Achieved through nginx proxy

✓ Deployments can be triggered without requiring server access

- Triggered from local environment / CI through running `deploy.sh`

✓ Only authorised users can trigger the deployment process

- Only users with vault password able to trigger. Secrets checked in to repository encrypted with ansible-vault with AES-256 standard.

✓ Releases can be rolled back to the previous version

- Deployment can rollback to previous version through instructions below


Deploy
=====
- `./deploy.sh` will create ansible environment and run the build and deploy script

Deployment secrets are protected. Only users with the vault password can run this script (hint: it's `supersecret`). Note: verbose level is optional


`$ SERVER_IP=192.168.0.31 ./deploy.sh -v`

In real-world this IP would be from a dynamic inventory (e.g. AWS EC2 tag) or piped from a previous role which would have created a fresh instance


Rollback
=====

In order to rollback simply run `./deploy.sh` and pass the git commit or branch of the application repository as environment variable as the application version, e.g.:

`$ RELEASE_VERSION=release-tag SERVER_IP=192.168.0.31 ./deploy.sh`

This will allow deploying of a previous git release tag, commit or branch in order to rollback. In CI context this parameter could be selectable from a list of branches in CI, or have option to rollback to previous release.


Troubleshooting
---
- Please see logs by tomcat or catalina in `/var/log/tomcat7`
