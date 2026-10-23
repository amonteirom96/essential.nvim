-- Per-build blend helpers for adapted highlight modules. No shared palette state.
local function blend(fg, bg, alpha)
  if fg == "NONE" or bg == "NONE" then return "NONE" end
  return require("essential.util").blend(fg, bg, alpha)
end
return function(c)
  return {
    blend = function(fg, alpha, bg) return blend(fg, bg, alpha) end,
    blend_bg = function(fg, alpha, bg) return blend(fg, bg or c.bg, alpha) end,
    blend_fg = function(bg, alpha, fg) return blend(bg, fg or c.fg, alpha) end,
  }
end
