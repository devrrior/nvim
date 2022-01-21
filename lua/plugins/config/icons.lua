local present, icons = pcall(require, "nvim-web-devicons")
if not present then
   return
end


icons.setup {
   override = {
      c = {
         icon = "",
         color = "#3644A5",
         name = "c",
      },
      css = {
         icon = "",
         color = "#0096DC",
         name = "css",
      },
      deb = {
         icon = "",
         color = "#CC074D",
         name = "deb",
      },
      Dockerfile = {
         icon = "",
         color = "#208FE0",
         name = "Dockerfile",
      },
      dockerfile = {
         icon = "",
         color = "#208FE0",
         name = "Dockerfile",
      },
      html = {
         icon = "",
         color = "#F36518",
         name = "html",
      },
      jpeg = {
         icon = "",
         color = "#460081",
         name = "jpeg",
      },
      jpg = {
         icon = "",
         color = "#460081",
         name = "jpg",
      },
      js = {
         icon = "",
         color = "#E8D319",
         name = "js",
      },
      kt = {
         icon = "󱈙",
         name = "kt",
      },
      lock = {
         icon = "",
         color = "#F10101",
         name = "lock",
      },
      -- lua = {
      --    icon = "",
         -- color = "#00007A",
         -- name = "lua",
      -- },
      md = {
        icon = "",
        name = "Md",
      },
      mp3 = {
         icon = "",
         color = "#F2F2F2",
         name = "mp3",
      },
      mp4 = {
         icon = "",
         color = "#F2F2F2",
         name = "mp4",
      },
      out = {
         icon = "",
         color = "#F2F2F2",
         name = "out",
      },
      png = {
         icon = "",
         color = "#460081",
         name = "png",
      },
      py = {
         icon = "",
         color = "#366A9A",
         name = "py",
      },
      ["robots.txt"] = {
         icon = "ﮧ",
         color = "#F10101",
         name = "robots",
      },
      toml = {
         icon = "",
         color = "#3644A5",
         name = "toml",
      },
      ts = {
         icon = "ﯤ",
         color = "#0074C2",
         name = "ts",
      },
      ttf = {
         icon = "",
         color = "#F2F2F2",
         name = "TrueTypeFont",
      },
      rb = {
         icon = "",
         color = "#A11402",
         name = "rb",
      },
      rpm = {
         icon = "",
         color = "#E9990D",
         name = "rpm",
      },
      vue = {
         icon = "﵂",
         color = "#3EAF7C",
         name = "vue",
      },
      woff = {
         icon = "",
         color = "#F2F2F2",
         name = "WebOpenFontFormat",
      },
      woff2 = {
         icon = "",
         color = "#F2F2F2",
         name = "WebOpenFontFormat2",
      },
      xz = {
         icon = "",
         color = "#E8D319",
         name = "xz",
      },
      zip = {
         icon = "",
         color = "#E8D319",
         name = "zip",
      },
   },
}
