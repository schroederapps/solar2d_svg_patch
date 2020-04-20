-- require nanosvg plugin
local function require_plugin()
  return require('plugin.nanosvg')
end
local has_plugin, nanosvg = pcall(require_plugin)

if not has_plugin then
  print("Display library not patched to support SVGs because you didn't inlcude the nanosvg plugin in build.settings")
else
  -- patch display.newImage to support SVG
  local newImage0 = display.newImage
  function display.newImage(...)
    local filename = nil
    local parent = nil
    for i, a in pairs(arg) do
      if type(a) == 'string' then
        filename = a
      elseif type(a) == 'table' and type(a.insert) == 'function' then
        parent = a
      end
    end
    if filename and filename:sub(-3):lower() == 'svg' then
      local img = nanosvg.newImage({
        filename = filename
      })
      if parent then
        parent:insert(img)
      end
      return img
    else
      return newImage0(unpack(arg))
    end
  end


  -- patch display.newImageRect to support SVG
  local newImageRect0 = display.newImageRect
  function display.newImageRect(...)
    local filename = nil
    local parent = nil
    for i, a in pairs(arg) do
      if type(a) == 'string' then
        filename = a
      elseif type(a) == 'table' and type(a.insert) == 'function' then
        parent = a
      end
    end
    if filename and filename:sub(-3):lower() == 'svg' then
      local img = nanosvg.newImage({
        filename = filename,
        width = arg[arg.n - 1],
        height = arg[arg.n],
      })
      if parent then
        parent:insert(img)
      end
      return img
    else
      return newImageRect0(unpack(arg))
    end
  end

  print("display.newImage and display.newImageRect have been patched to support SVG files.")
end
