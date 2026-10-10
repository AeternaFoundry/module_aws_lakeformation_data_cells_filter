output "lakeformation_data_cells_filters_id" {
  description = "Map of id values across all lakeformation_data_cells_filters, keyed the same as var.lakeformation_data_cells_filters"
  value       = { for k, v in aws_lakeformation_data_cells_filter.lakeformation_data_cells_filters : k => v.id if v.id != null && length(v.id) > 0 }
}
output "lakeformation_data_cells_filters_region" {
  description = "Map of region values across all lakeformation_data_cells_filters, keyed the same as var.lakeformation_data_cells_filters"
  value       = { for k, v in aws_lakeformation_data_cells_filter.lakeformation_data_cells_filters : k => v.region if v.region != null && length(v.region) > 0 }
}
output "lakeformation_data_cells_filters_table_data" {
  description = "Map of table_data values across all lakeformation_data_cells_filters, keyed the same as var.lakeformation_data_cells_filters"
  value       = { for k, v in aws_lakeformation_data_cells_filter.lakeformation_data_cells_filters : k => v.table_data if v.table_data != null && length(v.table_data) > 0 }
}

