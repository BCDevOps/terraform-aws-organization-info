provider "aws" {
	version = "~> 2.0"
}

data "aws_organizations_organization" "org_root" {}

//all of the OU's within the org
data "aws_organizations_organizational_units" "org_ous" {
	parent_id = data.aws_organizations_organization.org_root.roots[0].id
}

//all of the OUs within the "Workloads" OU.  Each of these represent a "parent" for a set of accounts that contain application workloads
data "aws_organizations_organizational_units" "workload_ous" {
//	parent_id = [for ou in data.aws_organizations_organizational_units.org_ous.children : ou if ou.name == "Workloads" ][0].id
	parent_id = local.workload_ou.id
}

locals {
	// the OU that is the immedaite child of the org root that contains project-level workload OU's
	workload_ou = [for ou in data.aws_organizations_organizational_units.org_ous.children : ou if ou.name == "Workloads"][0]

	non_master_accounts = data.aws_organizations_organization.org_root.non_master_accounts[*]

	// determine the set of accounts that are workload accounts based on a naming convention where accounts are matched to ou's based on their names having a matching license plate elements in their names.
	// a workload ou will have the "bare" license plate as its name (no suffix) and the workload accounts related to it will have the license plate followed by a suffix, and separated by a hyphen.
	// yes, this is a bit of gynmastics and relies on a consistent naming convention, however, there is currently no way via the "aws_organizations_organizational_units" data source to enumerate the accounts *within* an OU.
	workload_ou_names = data.aws_organizations_organizational_units.workload_ous.children[*].name
	workload_accounts = { for account in local.non_master_accounts : split("-", account.name)[0] => account... if contains(local.workload_ou_names, split("-", account.name)[0]) }

	// determine the set of accounts that are shared accounts based on a naming convention where shared account names are prefixed with a string matching the regex "lz\d-" (e.g. "lz1-").
	// this is also less than ideal, but see note above about availability of data from aws organizations data source.
	shared_ou = [for ou in data.aws_organizations_organizational_units.org_ous.children : ou if ou.name == "Shared" ][0]
	shared_accounts = [ for account in local.non_master_accounts : account if length(regexall("lz\\d-",account.name)) > 0]

	labs_ou = [for ou in data.aws_organizations_organizational_units.org_ous.children : ou if ou.name == "Labs" ][0].id
	// grab the workload account names, so we can use for process of elimination to identify Labs accounts
	workoad_account_names = flatten([for workload_ou, workload_accounts in local.workload_accounts: [for account in workload_accounts : account.name]])
	// grab the shared account names, so we can use for process of elimination to identify Labs accounts
	shared_account_names = [for account in local.shared_accounts: account.name]
	// combine the sets of the names of account that are already within ou's.  the "remaining" accounts are determined to belong to the "Labs" OU.
	non_lab_account_names = setunion(local.workoad_account_names, local.shared_account_names)
	lab_accounts = { for account in local.non_master_accounts : local.labs_ou.name => account... if !contains(local.non_lab_account_names, account.name) }
}

