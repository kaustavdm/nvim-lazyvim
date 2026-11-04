-- Completion is off by default for prose filetypes. Buffer-local `vim.b.completion`
-- overrides everything; otherwise prose filetypes are off and `vim.g.completion` decides.
local prose = { "markdown", "text" }

local function is_enabled(buf)
  buf = buf or 0
  local b = vim.b[buf].completion
  if b ~= nil then
    return b
  end
  if vim.tbl_contains(prose, vim.bo[buf].filetype) then
    return false
  end
  return vim.g.completion ~= false
end

return {
  {
    "saghen/blink.cmp",
    opts = {
      enabled = function()
        return is_enabled()
      end,
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        once = true,
        callback = function()
          Snacks.toggle({
            name = "Auto Completion (Buffer)",
            get = function()
              return is_enabled()
            end,
            set = function(state)
              vim.b.completion = state
            end,
          }):map("<leader>uk")
          Snacks.toggle({
            name = "Auto Completion (Global)",
            get = function()
              return vim.g.completion ~= false
            end,
            set = function(state)
              vim.g.completion = state
              -- drop per-buffer overrides so the global toggle takes effect everywhere
              for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                vim.b[buf].completion = nil
              end
            end,
          }):map("<leader>uK")
        end,
      })
    end,
  },
}
