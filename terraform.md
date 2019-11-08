## terraform refresh
The command terraform refresh updates this state file, reconciling what Terraform thinks is running and its configuration, with what actually is. All plan and apply commands run refresh first, prior to any other work.

## terraform plan and apply
Detect drift with terraform plan, which reconciles desired configuration with real-world state and tells you what Terraform will do during terraform apply. Terraform provides more fine grained control of how to manage drift with lifecycle parameters prevent_destroy and ignore_changes.

## terraform show
Provide human-readable output from a state or plan file. This can be used to inspect a plan to ensure that the planned operations are expected, or to inspect the current state as Terraform sees it.

