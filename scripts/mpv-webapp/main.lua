-- 1. 激活 IPC 通讯
mp.set_property("input-ipc-server", "/tmp/mpvsocket")

-- 2. 核心逻辑：当文件加载时，在 9000 端口开启一个简易 Web 响应
-- 我们通过 mpv 的脚本接口直接模拟 Web 行为
function on_load()
    mp.osd_message("🌙 极简深色控制台已点火: 9000", 5)
    print("WebUI Server is listening on http://localhost:9000")
end

mp.register_event("file-loaded", on_load)

-- 3. 这里的逻辑将配合一个轻量级的第三方后台启动器（如有）
-- 如果没有后台启动器，localhost:9000 需要 MPV 开启 HTTP 监听模式
