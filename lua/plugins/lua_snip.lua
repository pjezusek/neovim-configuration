require("luasnip.loaders.from_vscode").lazy_load()

local luasnip = require 'luasnip'
luasnip.filetype_extend("typescript", { "javascript" })
luasnip.filetype_extend("vue", { "javascript", "typescript" })
luasnip.filetype_extend("ruby", { "rails" })

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("rails", {
  s({ name = "has_many", trig = "hm" }, {
    t("has_many :"), i(1, "assocation_name"),
    t({ ",", "\tclass_name: '" }), i(2, "Assocation::Class"),
    t({ "',", "\tforeign_key: :" }), i(3, "foreign_key"),
    t({ ",", "\tinverse_of: :" }), i(4, "inverse_association"),
    t({ ",", "\tdependent: :" }), i(5, "restrict_with_error"),
  }),
})
ls.add_snippets("rails", {
  s({ name = "belongs_to", trig = "bt" }, {
    t("belongs_to :"), i(1, "assocation_name"),
    t({ ",", "\tclass_name: '" }), i(2, "Assocation::Class"),
    t({ "',", "\tforeign_key: :" }), i(3, "foreign_key"),
    t({ ",", "\tinverse_of: :" }), i(4, "inverse_association"),
  }),
})
ls.add_snippets("rails", {
  s({ name = "has_one", trig = "ho" }, {
    t("has_one :"), i(1, "assocation_name"),
    t({ ",", "\tclass_name: '" }), i(2, "Assocation::Class"),
    t({ "',", "\tforeign_key: :" }), i(3, "foreign_key"),
    t({ ",", "\tinverse_of: :" }), i(4, "inverse_association"),
    t({ ",", "\tdependent: :" }), i(5, "restrict_with_error"),
  }),
})
ls.add_snippets("rails", {
  s({ name = "has_one through", trig = "hot" }, {
    t("has_one :"), i(1, "assocation_name"),
    t({ ",", "\tclass_name: '" }), i(2, "Assocation::Class"),
    t({ "',", "\tforeign_key: :" }), i(3, "foreign_key"),
    t({ ",", "\tinverse_of: :" }), i(4, "inverse_association"),
    t({ ",", "\tthrough: :" }), i(5, "through_association"),
    t({ ",", "\tdependent: :" }), i(5, "destroy"),
  }),
})
ls.add_snippets("rails", {
  s({ name = "validates string", trig = "vs" }, {
    t("validates :"), i(1, "attribute"),
    t({ ",", "\tpresence: true,", "\tlength: { maximum: 255 }" }),
  }),
})
ls.add_snippets("rails", {
  s({ name = "validates unique", trig = "vu" }, {
    t("validates :"), i(1, "attribute"), t({ ", uniqueness: { scope: " }), i(2, ":scope"), t(" }")
  }),
})
ls.add_snippets("rails", {
  s({ name = "validates unique string", trig = "vus" }, {
    t("validates :"), i(1, "attribute"),
    t({ ",", "\tpresence: true,", "\tlength: { maximum: 255 }" }),
    t({ ",", "\tuniqueness: { allow_blank: true, case_sensitive: false, scope: " }), i(2, ":scope"), t(" }")
  }),
})

ls.add_snippets("rails", {
  s({ name = "validates presence", trig = "vp" }, {
    t("validates :"), i(1, "attribute"), t({ ", presence: true" })
  }),
})
