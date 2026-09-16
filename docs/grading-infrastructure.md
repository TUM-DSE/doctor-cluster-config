# Practical course grading infrastructure

We host our own grading infrastructure for small practical courses (at the time of writing, just the compiler-hw co-design lab).
We want to try out having our own small system instead of relying on external systems.

The source code for the grader can be found [here](https://github.com/martin-fink/srg-grading).

The grader contains a few components:

1. Web proxy: deployed on a RBG vm (grading.dos.cit.tum.de)
2. Grading: deployed on Astrid
3. Grading runners: deployed via Kubernetes, currently only on Mickey

## Web proxy

Just there so we have a public-facing proxy that tunnels all requests to Astrid.

## Grading Web

Contains postgres, migrations, web, background tasks, backups, monitoring, executor and a second nginx.
These run directly on Astrid as systemd services. Postgres is only accessible locally to the grading services and staff.
On Astrid, we generate a self-signed CA, which the web proxy trusts. This allows the web proxy to talk to Astrid using TLS.
Astrid also deploys the web proxy using ansible.

The executor picks up student submissions and creates Kubernetes jobs. Kubernetes then schedules these on the enabled runners.
The executor collects the results and sends them back to the grading service, where students can view them.
Nix takes care of registering the executor and providing its credentials.

### Shared storage

Astrid prepares the student submissions and grader files in a staging directory and shares it with the runners over NFS.
This allows jobs to run on any enabled runner without having to copy the files to a specific machine first.
Only the enabled runners can mount this share. Each job gets access to the files it needs; student jobs cannot read the private grader files.

The database and saved submissions, graders and reports stay on Astrid. They are backed up separately from this temporary staging data.

## Grading Runners

Student jobs run on the runners, in kubernetes-managed containers. Currently, this is only deployed on Mickey, we might
add more machines in the future.

The grader scripts also run in Kubernetes, in separate containers from the student code. They ask the executor to start
student commands and use their output to determine the score. All orchestration stays on Astrid; the runners only execute the containers.

We use gVisor to isolate these containers. They have no network access and have limits on runtime, CPU, memory and storage.

### Runner image

The jobs use a shared runner image containing the compilers and tools needed by the exercises. Nix builds this image and
loads it onto the runners during deployment. It also tells the grading CLI which image to use, so there is no manual image
build, upload or registry login needed.

Templates, tests and grader scripts live in the exercise repositories. Adding an exercise or changing its tests does not
require a cluster config change. Adding tools to the runner image does require a new deployment.

### Adding another worker

In that host's configuration:

```nix
imports = [ ../modules/k3s/agent.nix ../modules/grading ];
services.grading-worker.enable = true;
```

Deploy the new worker and Astrid from the same config revision. Astrid automatically allows the new worker to access the
NFS share.
Workers currently need the same CPU architecture as Astrid's runner image.

## Use the CLI on Astrid

You can use `gradingctl` on Astrid to run admin tasks. You must be in the `staff` group to do so.

```sh
gradingctl --database-url-file /etc/grading/admin.url admin grant --github-username $GH_USERNAME --reason 'Initial administrator'
gradingctl --database-url-file /etc/grading/admin.url admin list
gradingctl course apply ./course.toml --dry-run
```
## TODO
- document the RBG VM requirements (firewall, etc)
- document Github setup for a new course (installing the github app, etc.)

Documenting this once we try this for a new course. :)
