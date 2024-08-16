// vite.config.js
import { fileURLToPath, URL } from "node:url";
import { defineConfig } from "file:///E:/test/xwj2001/vue/node_modules/vite/dist/node/index.js";
import vue from "file:///E:/test/xwj2001/vue/node_modules/@vitejs/plugin-vue/dist/index.mjs";
var __vite_injected_original_import_meta_url = "file:///E:/test/xwj2001/vue/vite.config.js";
var vite_config_default = defineConfig({
  plugins: [
    vue()
  ],
  resolve: {
    alias: {
      "@": fileURLToPath(new URL("./src", __vite_injected_original_import_meta_url))
    }
  },
  //代理请求路径
  proxyTable: {
    "/api": {
      target: "http://localhost:2001/",
      changeOrigin: true,
      pathRewrite: {
        "^/api": ""
      }
    }
  }
});
export {
  vite_config_default as default
};
//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAic291cmNlcyI6IFsidml0ZS5jb25maWcuanMiXSwKICAic291cmNlc0NvbnRlbnQiOiBbImNvbnN0IF9fdml0ZV9pbmplY3RlZF9vcmlnaW5hbF9kaXJuYW1lID0gXCJFOlxcXFx0ZXN0XFxcXHh3ajIwMDFcXFxcdnVlXCI7Y29uc3QgX192aXRlX2luamVjdGVkX29yaWdpbmFsX2ZpbGVuYW1lID0gXCJFOlxcXFx0ZXN0XFxcXHh3ajIwMDFcXFxcdnVlXFxcXHZpdGUuY29uZmlnLmpzXCI7Y29uc3QgX192aXRlX2luamVjdGVkX29yaWdpbmFsX2ltcG9ydF9tZXRhX3VybCA9IFwiZmlsZTovLy9FOi90ZXN0L3h3ajIwMDEvdnVlL3ZpdGUuY29uZmlnLmpzXCI7aW1wb3J0IHsgZmlsZVVSTFRvUGF0aCwgVVJMIH0gZnJvbSAnbm9kZTp1cmwnXG5cbmltcG9ydCB7IGRlZmluZUNvbmZpZyB9IGZyb20gJ3ZpdGUnXG5pbXBvcnQgdnVlIGZyb20gJ0B2aXRlanMvcGx1Z2luLXZ1ZSdcblxuLy8gaHR0cHM6Ly92aXRlanMuZGV2L2NvbmZpZy9cbmV4cG9ydCBkZWZhdWx0IGRlZmluZUNvbmZpZyh7XG4gIHBsdWdpbnM6IFtcbiAgICB2dWUoKSxcbiAgXSxcbiAgcmVzb2x2ZToge1xuICAgIGFsaWFzOiB7XG4gICAgICAnQCc6IGZpbGVVUkxUb1BhdGgobmV3IFVSTCgnLi9zcmMnLCBpbXBvcnQubWV0YS51cmwpKVxuICAgIH1cbiAgfSxcblxuICAvL1x1NEVFM1x1NzQwNlx1OEJGN1x1NkM0Mlx1OERFRlx1NUY4NFxuICBwcm94eVRhYmxlOiB7XG4gICAgJy9hcGknOntcbiAgICAgIHRhcmdldDpcImh0dHA6Ly9sb2NhbGhvc3Q6MjAwMS9cIixcbiAgICAgIGNoYW5nZU9yaWdpbjp0cnVlLFxuICAgICAgcGF0aFJld3JpdGU6e1xuICAgICAgICAnXi9hcGknOicnXG4gICAgICB9XG4gICAgfVxuICB9LFxufSlcblxuIl0sCiAgIm1hcHBpbmdzIjogIjtBQUFtUCxTQUFTLGVBQWUsV0FBVztBQUV0UixTQUFTLG9CQUFvQjtBQUM3QixPQUFPLFNBQVM7QUFIcUksSUFBTSwyQ0FBMkM7QUFNdE0sSUFBTyxzQkFBUSxhQUFhO0FBQUEsRUFDMUIsU0FBUztBQUFBLElBQ1AsSUFBSTtBQUFBLEVBQ047QUFBQSxFQUNBLFNBQVM7QUFBQSxJQUNQLE9BQU87QUFBQSxNQUNMLEtBQUssY0FBYyxJQUFJLElBQUksU0FBUyx3Q0FBZSxDQUFDO0FBQUEsSUFDdEQ7QUFBQSxFQUNGO0FBQUE7QUFBQSxFQUdBLFlBQVk7QUFBQSxJQUNWLFFBQU87QUFBQSxNQUNMLFFBQU87QUFBQSxNQUNQLGNBQWE7QUFBQSxNQUNiLGFBQVk7QUFBQSxRQUNWLFNBQVE7QUFBQSxNQUNWO0FBQUEsSUFDRjtBQUFBLEVBQ0Y7QUFDRixDQUFDOyIsCiAgIm5hbWVzIjogW10KfQo=
