vim.b["start"] = "php -d auto_prepend_file=%:p:S -a"
vim.b["dispatch"] = "php % && exit 1"

vim.b.minisurround_config = {
  custom_surroundings = {
    ["-"] = {
      input = { "<%?php%s?().-()%s?%?>" },
      output = { left = "<?php ", right = " ?>" },
    },
  },
}
