import { defineConfig } from "vite"
import RubyPlugin from "vite-plugin-ruby"
import FullReload from "vite-plugin-full-reload"
import StimulusHMRPlugin from "vite-plugin-stimulus-hmr";

export default defineConfig({
  plugins: [
    RubyPlugin(),
    FullReload(["config/routes.rb", "app/views/**/*"], { delay: 100 }),
    StimulusHMRPlugin(),
  ]
})
