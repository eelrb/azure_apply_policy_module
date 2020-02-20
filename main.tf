provider "tfe"{}

data "terraform_remote_state" "azure-policy-" {
  backend = "remote"

  config = {
    organization = "hashicorp"
    workspaces = {
      name = "vpc-prod"
    }
  }
}



/*


resource "azurerm_policy_assignment" "requiredTag" {
  ...
  policy_definition_id = "${azurerm_policy_definition.requiredTag.id}"
  ...
}

data "azurerm_subscription" "current" {}
​
resource "azurerm_policy_assignment" "requiredTag" {
  ...
  scope                = "${data.azurerm_subscription.current.id}"
  ...
}

data "template_file" "requiredTag_policy_assign" {
  template = <<PARAMETERS
{
    "tagName": {
        "value": "${var.requiredTag}"
    }
}
​
PARAMETERS
}
​
resource "azurerm_policy_assignment" "requiredTag" {
  ...
  parameters           = "${data.template_file.requiredTag_policy_assign.rendered}"
}


resource "azurerm_policy_assignment" "requiredTag" {
  name                 = "Audit-RequiredTag-${var.requiredTag}"
  display_name         = "Assign Required Tag '${var.requiredTag}'"
  description          = "Assignment of Required Tag Policy for '${var.requiredTag}'"
  policy_definition_id = "???"
  scope                = "???"
  parameters           = "???"
  
  }
  
  */
