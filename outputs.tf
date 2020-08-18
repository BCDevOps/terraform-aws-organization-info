output "root" {
	value = data.aws_organizations_organization.org_root
}

output "master_account" {
	value = {
		"id" = data.aws_organizations_organization.org_root.master_account_id
		"email" = data.aws_organizations_organization.org_root.master_account_email
	}
}


// the OU that is the immedaite child of the org root that contains project-level workload OU's
output "workload_ou" {
	value = local.workload_ou
}

//all of the OUs within the "Workloads" OU.  Each of these represent a "parent" for a set of accounts that contain application workloads
output "workload_ous" {
	value = data.aws_organizations_organizational_units.workload_ous
}

//the accounts within the "Workloads" OUs
output "workload_accounts" {
	value = local.workload_accounts
}

//the accounts within the "Lab" OU
output "lab_accounts" {
	value = local.lab_accounts
}

//the accounts within the "Shared" OU
output "shared_accounts" {
	value = local.shared_accounts
}
