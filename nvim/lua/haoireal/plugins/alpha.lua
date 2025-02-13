return {
  "goolord/alpha-nvim",
  event = "VimEnter", -- Kích hoạt plugin khi bắt đầu Neovim
  config = function()
    local alpha = require("alpha") -- Yêu cầu module alpha
    local dashboard = require("alpha.themes.dashboard") -- Sử dụng chủ đề dashboard cho alpha
    -- Đảm bảo định nghĩa hàm trước khi sử dụng
    local function get_current_time()
      return os.date("%H:%M")
    end

    -- Cài đặt tiêu đề
    dashboard.section.header.val =
    { 
      " ██░ ██  ▄▄▄       ▒█████   ██▓ ██▀███  ▓█████ ▄▄▄       ██▓     ",   
      "▓██░ ██▒▒████▄    ▒██▒  ██▒▓██▒▓██ ▒ ██▒▓█   ▀▒████▄    ▓██▒     ",  
      "▒██▀▀██░▒██  ▀█▄  ▒██░  ██▒▒██▒▓██ ░▄█ ▒▒███  ▒██  ▀█▄  ▒██░     ",
      "░▓█ ░██ ░██▄▄▄▄██ ▒██   ██░░██░▒██▀▀█▄  ▒▓█  ▄░██▄▄▄▄██ ▒██░     ",
      "░▓█▒░██▓ ▓█   ▓██▒░ ████▓▒░░██░░██▓ ▒██▒░▒████▒▓█   ▓██▒░██████▒ ",
      " ▒ ░░▒░▒ ▒▒   ▓▒█░░ ▒░▒░▒░ ░▓  ░ ▒▓ ░▒▓░░░ ▒░ ░▒▒   ▓▒█░░ ▒░▓  ░ ",
      " ▒ ░▒░ ░  ▒   ▒▒ ░  ░ ▒ ▒░  ▒ ░  ░▒ ░ ▒░ ░ ░  ░ ▒   ▒▒ ░░ ░ ▒  ░ ",
      " ░  ░░ ░  ░   ▒   ░ ░ ░ ▒   ▒ ░  ░░   ░    ░    ░   ▒     ░ ░    ",
      " ░  ░  ░      ░  ░    ░ ░   ░     ░        ░  ░     ░  ░    ░  ░ ",
      " ",
      "              Hi, Fuck you Haoireal 💗 now is " .. get_current_time() .."       ",
    }

    -- Cài đặt menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"), -- Tạo tệp mới
      dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"), -- Mở/tắt trình duyệt tệp
      dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"), -- Tìm kiếm tệp
      dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"), -- Tìm kiếm từ trong dự án
      dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"), -- Khôi phục phiên làm việc tại thư mục hiện tại
      dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"), -- Thoát Neovim
    }
    -- Đồng bộ màu nền
    dashboard.section.header.opts.hl = "Type"
    dashboard.section.buttons.opts.hl = "Keyword"
    dashboard.section.footer.opts.hl = "Comment"
    -- Gửi cấu hình đến alpha
    alpha.setup(dashboard.opts)

    -- Tắt tính năng gấp dòng (folding) trong buffer alpha
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}

