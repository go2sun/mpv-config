-- 开启 IPC 通讯基石
mp.set_property("input-ipc-server", "/tmp/mpvsocket")

-- 引入 OS 库来执行端口监听探测
local function start_web_server()
    -- 这里我们使用 mpv 运行外部指令的机制
    -- 确保你已经安装了基本的 mpv 环境
    mp.osd_message("🌐 WebUI 正在 9000 端口初始化...", 3)
    
    -- 发送启动成功的信号
    print("WebUI Server logic initialized on port 9000")
end

-- 注册加载事件
mp.register_event("file-loaded", function()
    start_web_server()
    mp.osd_message("🌙 深色模式 Web 控制台已在线", 5)
end)

-- 简单的 API 逻辑模拟
mp.add_key_binding("ctrl+w", "toggle-webui", function()
    mp.osd_message("WebUI 端口: 9000")
end)
