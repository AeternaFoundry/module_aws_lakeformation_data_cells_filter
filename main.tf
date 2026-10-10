resource "aws_lakeformation_data_cells_filter" "lakeformation_data_cells_filters" {
  for_each = var.lakeformation_data_cells_filters

  region = each.value.region

  dynamic "table_data" {
    for_each = each.value.table_data != null ? each.value.table_data : []
    content {
      column_names = table_data.value.column_names
      dynamic "column_wildcard" {
        for_each = table_data.value.column_wildcard != null ? table_data.value.column_wildcard : []
        content {
          excluded_column_names = column_wildcard.value.excluded_column_names
        }
      }
      database_name = table_data.value.database_name
      name          = table_data.value.name
      dynamic "row_filter" {
        for_each = table_data.value.row_filter != null ? table_data.value.row_filter : []
        content {
          dynamic "all_rows_wildcard" {
            for_each = row_filter.value.all_rows_wildcard != null ? row_filter.value.all_rows_wildcard : []
            content {
            }
          }
          filter_expression = row_filter.value.filter_expression
        }
      }
      table_catalog_id = table_data.value.table_catalog_id
      table_name       = table_data.value.table_name
      version_id       = table_data.value.version_id
    }
  }
}

