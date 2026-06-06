terraform {
  required_providers {
    iosxe = {
      source = "CiscoDevNet/iosxe"
    }
  }
}

# TODO(exercise): create an iosxe_access_list_extended resource using var.name and the two entries.
# Reference: ../../solution/modules/acl/main.tf
