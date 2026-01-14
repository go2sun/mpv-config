-- 强制开启 IPC 服务器，确保通讯基石
mp.set_property("input-ipc-server", "/tmp/mpvsocket")

-- 模拟 Web 服务器响应，直接注入带 CSS 的 HTML
local html_content = [[
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        :root { --bg: #ffffff; --text: #000000; --accent: #007aff; }
        @media (prefers-color-scheme: dark) {
            :root { --bg: #1c1c1e; --text: #f2f2f7; --accent: #0a84ff; }
        }
        body { background: var(--bg); color: var(--text); font-family: -apple-system; text-align: center; transition: 0.3s; }
        .btn { padding: 15px; margin: 10px; background: var(--accent); color: white; border-radius: 12px; display: inline-block; cursor: pointer; }
    </style>
</head>
<body>
    <h1>🎬 go2sun Remote</h1>
    <div class="btn" onclick="cmd('cycle pause')">⏯ Play/Pause</div>
    <div class="btn" onclick="cmd('add volume 5')">🔊 Vol+</div>
    <div class="btn" onclick="cmd('add volume -5')">🔉 Vol-</div>
    <script>
        function cmd(c) { fetch('/api/run?arg=' + encodeURIComponent(c)); }
    </script>
</body>
</html>
]]

-- 加载成功后的 OSD 提示
mp.register_event("file-loaded", function()
    mp.osd_message("🌙 深色模式 Web 控制台已在线", 5)
end)
