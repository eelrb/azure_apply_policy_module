output "policy_assign_id_1" {
  value = join("", azurerm_policy_assignment.blee-policy-1.*.id) 
}

output "policy_assign_id_2" {
  value = join("", azurerm_policy_assignment.blee-policy-2.*.id) 
}

output "policy_assign_id_3" {
  value = join("", azurerm_policy_assignment.blee-policy-3.*.id) 
}



