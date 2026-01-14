-- 强制开启 IPC 服务器，这是 WebUI 通讯的基石
mp.set_property("input-ipc-server", "/tmp/mpvsocket")

-- 加载成功后的 OSD 提示
mp.register_event("file-loaded", function()
    mp.osd_message("🌐 Web 控制台已在线: localhost:9000", 5)
    print("WebUI Server started on localhost:9000")
end)
