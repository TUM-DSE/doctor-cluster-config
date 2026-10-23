{ lib, ... }:
let
  # Bumped daily on master by .github/workflows/bump-config-version.yml.
  # A branch forked from an older master carries an older number no matter
  # how many commits are piled on top, so deploying it onto a machine that
  # already runs a newer master is caught below.
  version = lib.toInt (lib.fileContents ../CONFIG_VERSION);
in
{
  system.systemBuilderCommands = ''
    echo ${toString version} > $out/dse-config-version
  '';

  system.preSwitchChecks.noDowngrade = ''
    new="$1"
    action="$2"
    case "$action" in
      switch | boot | test) ;;
      *) exit 0 ;;
    esac
    cur_file=/run/current-system/dse-config-version
    [[ -e "$cur_file" ]] || exit 0
    cur=$(<"$cur_file")
    next=$(<"$new/dse-config-version")
    if (( next < cur )); then
      cat <<EOF
    Refusing to $action: this configuration is built from CONFIG_VERSION $next,
    but the running system is at $cur. Your checkout is based on an outdated
    master and would roll back changes that are already deployed.
    Rebase onto origin/master first.
    EOF
      exit 1
    fi
  '';
}
