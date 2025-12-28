# Monitoring

Prometheus monitoring is available at https://prometheus.dos.cit.tum.de with
alerts forwarded to https://alertmanager.dos.cit.tum.de.

## Adding or removing machines from monitoring

Machine targets are defined in `modules/monitoring/prometheus-targets.nix` and
automatically published to GitHub releases via GitHub Actions. This allows
updating monitored machines without redeploying the Prometheus server.

To add or remove a machine:

1. Edit `modules/monitoring/prometheus-targets.nix`
2. Commit and push to master
3. GitHub Actions will build and publish the updated target list

The targets are available at:
https://tum-dse.github.io/doctor-cluster-config/telegraf.json

Prometheus fetches this file every 5 minutes via HTTP service discovery.

## Target file format

The target file follows the [Prometheus HTTP SD format](https://prometheus.io/docs/prometheus/latest/configuration/configuration/#http_sd_config):

```nix
# modules/monitoring/prometheus-targets.nix
{
  telegraf = [
    {
      targets = map (host: "${host}.r:9273") [
        "ace"
        "adelaide"
        # ... more hosts
      ];
      labels.org = "uni";
    }
  ];
}
```

This generates JSON:

```json
[
  {
    "targets": ["ace.r:9273", "adelaide.r:9273", ...],
    "labels": { "org": "uni" }
  }
]
```

## Building targets locally

To verify target definitions before pushing:

```console
$ nix build .#prometheus-http-sd
$ cat result/telegraf.json | jq .
```

## Architecture

```
prometheus-targets.nix
        |
        v (nix build)
   telegraf.json
        |
        v (GitHub Actions)
   GitHub Pages
        |
        v (http_sd_configs, every 5m)
   Prometheus instances
```

Both the doctor-cluster Prometheus and https://grafana.thalheim.io fetch from
the same GitHub Pages URL, ensuring consistent target definitions.

## Alert rules

Alert rules are defined in `modules/monitoring/prometheus/rules.nix`. Changes
to alert rules require redeploying the Prometheus server.
