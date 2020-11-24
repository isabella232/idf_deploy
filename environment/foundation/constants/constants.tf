locals {
  constants = {
    // Domain Information
    org_id          = "288991023210"
    billing_account = "01122E-72D62B-0B0581"
    domain          = "lsst.cloud"

    // The project label used to identify `owner` on Cloud Control Plane projects
    core_projects_owner = "rubin"

    domains_to_allow = ["lsst.cloud"]

    // Google Workspace / Cloud Identity Google Groups
    groups = {
      org_admins      = "gcp-organization-administrators@lsst.cloud"
      billing_admins  = "gcp-billing-administrators@lsst.cloud"
      network_admins  = "gcp-network-administrators@lsst.cloud"
      security_admins = "gcp-security-administrators@lsst.cloud"
      org_viewers     = "gcp_org_viewer@lsst.cloud"
    }

    // Shared VPC
    default_region = "us-central1"

    //Optional - for development.  Will place all resources under a specific folder instead of org root
    parent_folder = ""

    // Optional bootstrap configurations
    # bootstrap = {
    #   org_project_creators = []
    # }
  }
}