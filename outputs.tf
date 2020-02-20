output "policy_assign_id" {
  value = join("", azurerm_policy_assignment.requiredTag.*.id) 
}



