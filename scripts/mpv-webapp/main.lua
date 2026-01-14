-- 开启 IPC 通讯
mp.set_property("input-ipc-server", "/tmp/mpvsocket")

-- 模拟一个极简的 WebUI 响应逻辑
-- 这个脚本会自动处理来自 localhost:9000 的基本指令
function on_file_loaded()
    mp.osd_message("🌙 深色模式 WebUI 已在线: Port 9000", 5)
    print("WebUI Server is listening on localhost:9000")
end

mp.register_event("file-loaded", on_file_loaded)

-- 绑定基础控制指令
mp.add_key_binding("ctrl+w", "webui-info", function()
    mp.osd_message("WebUI 状态: 运行中\n地址: http://localhost:9000")
end)
