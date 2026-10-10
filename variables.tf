variable "lakeformation_data_cells_filters" {
  description = <<EOT
Map of lakeformation_data_cells_filters, attributes below
Optional:
    - region
    - table_data (block):
        - column_names (optional)
        - column_wildcard (optional, block):
            - excluded_column_names (optional)
        - database_name (required)
        - name (required)
        - row_filter (optional, block):
            - all_rows_wildcard (optional, block):
            - filter_expression (optional)
        - table_catalog_id (required)
        - table_name (required)
        - version_id (optional)
EOT

  type = map(object({
    region = optional(string)
    table_data = optional(list(object({
      column_names = optional(set(string))
      column_wildcard = optional(list(object({
        excluded_column_names = optional(set(string))
      })))
      database_name = string
      name          = string
      row_filter = optional(list(object({
        all_rows_wildcard = optional(list(object({
        })))
        filter_expression = optional(string)
      })))
      table_catalog_id = string
      table_name       = string
      version_id       = optional(string)
    })))
  }))
}

