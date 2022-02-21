local M = {}

local utils = require "core.utils"
-- local config = utils.user_settings()

local packer_status_ok, packer = pcall(require, "packer")
if not packer_status_ok then
  return
end





packer.startup {
    function(use)
        -- Plugin manager
        use {
            "wbthomason/packer.nvim",
        }
    end,
}


return M
