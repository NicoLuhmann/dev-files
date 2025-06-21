if not vim.g.vscode then
  -- Set up persistent undo
  vim.opt.undofile = true
  local undodir = vim.fn.stdpath("state") .. "/undo"
  vim.fn.mkdir(undodir, "p")
  vim.opt.undodir = undodir

  -- cleanup undo
  local uv = vim.loop

  -- Path to last-run timestamp file
  local function get_timestamp_file()
    return vim.fn.stdpath("cache") .. "/undo-clean-last-run"
  end

  -- Read last run timestamp (returns 0 if file doesn't exist)
  local function read_last_run()
    local path = get_timestamp_file()
    local fd = uv.fs_open(path, "r", 438)  -- 438 = 0666
    if not fd then return 0 end
    local data = uv.fs_read(fd, 64, 0)
    uv.fs_close(fd)
    return tonumber(data) or 0
  end

  -- Write current timestamp to file
  local function write_last_run()
    local path = get_timestamp_file()
    local fd = uv.fs_open(path, "w", 420)  -- 420 = 0644
    if fd then
      uv.fs_write(fd, tostring(os.time()), 0)
      uv.fs_close(fd)
    end
  end

  -- Actual async cleanup function
  local function clean_undo_dir_async(days)
    days = days or 90
    local undodir = vim.fn.stdpath("state") .. "/undo"
    local cutoff = os.time() - (days * 24 * 60 * 60)

    uv.fs_scandir(undodir, function(err, handle)
      if err or not handle then return end

      local function scan_next()
        local name, type_ = uv.fs_scandir_next(handle)
        if not name then return end

        if type_ == "file" then
          local filepath = undodir .. "/" .. name
          uv.fs_stat(filepath, function(stat_err, stat)
            if not stat_err and stat and stat.mtime.sec < cutoff then
              uv.fs_unlink(filepath, function(_) end)
            end
            scan_next()
          end)
        else
          scan_next()
        end
      end

      scan_next()
    end)
  end

  -- Check if 7 days passed, then run cleanup
  local function maybe_clean_undo()
    local last = read_last_run()
    local now = os.time()
    local one_week = 7 * 24 * 60 * 60

    if now - last >= one_week then
      clean_undo_dir_async(90)
      write_last_run()
    end
  end

  -- Run on startup or in undotree plugin setup
  maybe_clean_undo()
end
