local MODE = {}

function MODE.get()
  local env = os.getenv("NVIM_MODE_LUH")
  if env then return env end
  return "min"
end

return MODE
