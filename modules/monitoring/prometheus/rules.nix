{ lib, ... }:
{
  srvos.prometheus = {
    ruleGroups.srvosAlerts.alertRules =
      (lib.genAttrs
        [
          "borgbackup-job-nfs-home.service"
          "borgbackup-job-nfs-share.service"
        ]
        (name: {
          expr = ''absent_over_time(task_last_run{name="${name}"}[1d])'';
          annotations.description = "status of ${name} is unknown: no data for a day";
        })
      )
      // {
        GradingBackupStale = {
          expr = "grading_backup_age_seconds > 129600";
          annotations.description = "Grading backup on Astrid has not completed for 36 hours";
        };
        GradingMonitoringStale = {
          expr = "time() - grading_last_run > 900";
          annotations.description = "Grading health collection on Astrid has stopped";
        };
        GradingServiceFailed = {
          expr = "{__name__=~\"grading_(postgresql|migrate|web|tasks|github|backup|sync|web_provision)_failed\"} > 0";
          annotations.description = "A grading maintenance service failed on Astrid";
        };
        GradingQueueStalled = {
          expr = "grading_queue_oldest_seconds > 3600 or grading_leases_stale > 0 or grading_locks_pending > 0 or grading_metrics_failed > 0";
          for = "15m";
          annotations.description = "Grading queue, worker metrics, or deadline locking needs attention";
        };
        GradingTaskFailures = {
          expr = "grading_tasks_failed > 0 or grading_provisioning_failed > 0";
          for = "15m";
          annotations.description = "The grading service reports failed tasks or repository provisioning";
        };
        BorgbackupJobFailed = {
          expr = ''task_exit_status{name=~"borgbackup-job-.*"} != 0'';
          annotations.description = "{{$labels.name}} on {{$labels.host}} failed with exit status {{$value}}";
        };
      }
      // (lib.genAttrs
        [
          "syncoid-home"
          "syncoid-share"
        ]
        (name: {
          expr = ''absent_over_time(task_last_run{name="${name}"}[10m])'';
          annotations.description = "status of ${name} is unknown: no data for 10 minutes";
        })
      )
      // {
        PublicRunnerActionOnline = {
          expr = ''count(http_busy{name=~"runner.*", status="online"}) < 2'';
          annotations.description = "{{$labels.instance}}: There are no public github action runner registerd with github (see https://github.com/organizations/ls1-sys-prog-course/settings/actions)";
        };

        InternalRunnerActionOnline = {
          expr = ''count(http_busy{name=~"internal-runner.*", status="online"}) < 1'';
          annotations.description = "{{$labels.instance}}: There are no interal github action runner registerd with github (see https://github.com/organizations/ls1-sys-prog-course-internal/settings/actions)";
        };

        # we don't have this course this semester
        #CloudlabGithubActionRunner = {
        #  expr = ''count(kubernetes_pod_container_state_code{pod_name=~"cloudlab-runner-deployment.*", state="running",container_name="runner"}) == 0'';
        #  annotations.description = "{{$labels.instance}}: There are no github action runner {{$value}} for (https://github.com/organizations/ls1-sys-prog-course/settings/actions)";
        #};

        #CloudlabGithubActionRunnerPresent = {
        #  expr = ''absent_over_time(kubernetes_pod_container_state_code{pod_name=~"cloudlab-runner-deployment.*", state="running",container_name="runner"}[10m])'';
        #  annotations.description = "status of public github action runner is unknown: no data for 10 minutes";
        #};

        InternalGithubActionRunner = {
          expr = ''count(kubernetes_pod_container_state_code{pod_name=~"internal-runner-deployment.*", state="running",container_name="runner"}) == 0'';
          annotations.description = "{{$labels.instance}}: There are no github action runner {{$value}} for (https://github.com/organizations/ls1-sys-prog-course-internal/settings/actions)";
        };

        InternalGithubActionRunnerPresent = {
          expr = ''absent_over_time(kubernetes_pod_container_state_code{pod_name=~"internal-runner-deployment.*", state="running",container_name="runner"}[10m])'';
          annotations.description = "status of internal github action runner is unknown: no data for 10 minutes";
        };
      };
  };
}
