
# <application_license_badge>
<!--- [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](./LICENSE) --->

# BC Gov Terraform Template

This repo provides a starting point for users who want to create valid Terraform modules stored in GitHub.  

## Third-Party Products/Libraries used and the licenses they are covered by
<!--- product/library and path to the LICENSE --->
<!--- Example: <library_name> - [![GitHub](<shield_icon_link>)](<path_to_library_LICENSE>) --->

## Project Status
- [x] Development
- [ ] Production/Maintenance

# Documentation

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.11.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.11.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_organizations_organization.org_root](https://registry.terraform.io/providers/hashicorp/aws/3.11.0/docs/data-sources/organizations_organization) | data source |
| [aws_organizations_organizational_units.org_ous](https://registry.terraform.io/providers/hashicorp/aws/3.11.0/docs/data-sources/organizations_organizational_units) | data source |
| [aws_organizations_organizational_units.workload_ous](https://registry.terraform.io/providers/hashicorp/aws/3.11.0/docs/data-sources/organizations_organizational_units) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lab_accounts"></a> [lab\_accounts](#output\_lab\_accounts) | the accounts within the "Lab" OU |
| <a name="output_master_account"></a> [master\_account](#output\_master\_account) | n/a |
| <a name="output_root"></a> [root](#output\_root) | n/a |
| <a name="output_shared_accounts"></a> [shared\_accounts](#output\_shared\_accounts) | the accounts within the "Shared" OU |
| <a name="output_workload_accounts"></a> [workload\_accounts](#output\_workload\_accounts) | the accounts within the "Workloads" OUs |
| <a name="output_workload_ou"></a> [workload\_ou](#output\_workload\_ou) | the OU that is the immedaite child of the org root that contains project-level workload OU's |
| <a name="output_workload_ous"></a> [workload\_ous](#output\_workload\_ous) | all of the OUs within the "Workloads" OU.  Each of these represent a "parent" for a set of accounts that contain application workloads |
<!-- END_TF_DOCS -->

## Getting Started
<!--- setup env vars, secrets, instructions... --->

## Getting Help or Reporting an Issue
<!--- Example below, modify accordingly --->
To report bugs/issues/feature requests, please file an [issue](../../issues).


## How to Contribute
<!--- Example below, modify accordingly --->
If you would like to contribute, please see our [CONTRIBUTING](./CONTRIBUTING.md) guidelines.

Please note that this project is released with a [Contributor Code of Conduct](./CODE_OF_CONDUCT.md). 
By participating in this project you agree to abide by its terms.


## License
<!--- Example below, modify accordingly --->
    Copyright 2018 Province of British Columbia

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
