
data "terraform_remote_state" "azure-policy-demo" {
  backend = "remote"

  config = {
    organization = "SAP_Multicloud"
    workspaces = {
      name = "azure-policies-demo"
    }
  }
}




data "azurerm_subscription" "current" {}



data "template_file" "requiredTag_policy_assign" {
  template = <<PARAMETERS
{
    "tagName": {
        "value": "${var.requiredTag}"
    }
}

PARAMETERS
}



resource "azurerm_policy_assignment" "blee-policy-1" {
  count                = var.policy_1_enabled
  name                 = "blee-policy-1-${var.requiredTag}"
  display_name         = "blee-policy-1 '${var.requiredTag}'"
  description          = "Assignment of Required Tag Policy for '${var.requiredTag}'"
  policy_definition_id = data.terraform_remote_state.azure-policy-demo.outputs.policy_1_id
  scope                = "${data.azurerm_subscription.current.id}"
  parameters           = "${data.template_file.requiredTag_policy_assign.rendered}"
  
  }
  
resource "azurerm_policy_assignment" "blee-policy-2" {
  count                = var.policy_2_enabled
  name                 = "blee-policy-2-${var.requiredTag}"
  display_name         = "blee-policy-2 '${var.requiredTag}'"
  description          = "Assignment of Required Tag Policy for '${var.requiredTag}'"
  policy_definition_id = data.terraform_remote_state.azure-policy-demo.outputs.policy_2_id
  scope                = "${data.azurerm_subscription.current.id}"
  parameters           = "${data.template_file.requiredTag_policy_assign.rendered}"
  
  }

resource "azurerm_policy_assignment" "blee-policy-3" {
  count                = var.policy_3_enabled
  name                 = "blee-policy-3-${var.requiredTag}"
  display_name         = "blee-policy-3 '${var.requiredTag}'"
  description          = "Assignment of Required Tag Policy for '${var.requiredTag}'"
  policy_definition_id = data.terraform_remote_state.azure-policy-demo.outputs.policy_3_id
  scope                = "${data.azurerm_subscription.current.id}"
  parameters           = "${data.template_file.requiredTag_policy_assign.rendered}"
  
  }
 
