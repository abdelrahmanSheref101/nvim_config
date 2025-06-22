local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function make_guard ()
        local name = vim.fn.expand("%:t"):gsub("%.", "_")
        return string.upper(name)
end

return {
  s("main", {
    t({
      "#include <stdio.h>",
      "",
      "int main() {",
      "        "
    }),
    i(1, 'printf("Hello, World!\\n");'),
    t({
      "",
      "    return 0;",
      "}"
    }),
  }),
        s("header_guard", {
            f(function() return "#ifndef " .. make_guard() end, {}),
            t({"", "#define "}),
            f(function() return make_guard() end, {}),
            t({"", "", ""}),
            i(0),
            t({"", "", "#endif"}),
          }),
}

