-- MPV WebUI 核心启动逻辑
local socket_path = "/tmp/mpvsocket"
mp.set_property("input-ipc-server", socket_path)

-- 启动通知
mp.register_event("file-loaded", function()
    mp.osd_message("🌐 Web 控制台已在线: localhost:9000")
end)
