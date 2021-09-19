vim.g.vrc_trigger = '<leader>rr'
vim.g.vrc_response_default_content_type = 'application/json'
vim.g.vrc_auto_format_response_patterns = {
  json = 'jq .'
}
vim.g.vrc_body_preprocessor = 'yaml2json | jq -c .'
vim.g.vrc_allow_get_request_body = 1
vim.g.vrc_horizontal_split = 1
