output "policy_assign_id" {
  value = azurerm_policy_assignment.requiredTag.[0].id 
}
