require 'yaml'
require 'json'

KARABINER_CONFIG_DIR = "~/.config/karabiner/assets/complex_modifications"

# --------------------------------
# methods
# --------------------------------
def generate(filepath)
  config = YAML.load_file(filepath)
  filename = filepath.split("/")[1].gsub("yaml", "json")
  File.open("#{File.expand_path(KARABINER_CONFIG_DIR)}/#{filename}", mode = "w") { |f|
    f.write(JSON.pretty_generate(config))  # ファイルに書き込む
  }
end


# ----------------------------------
# 処理
# ----------------------------------
Dir.glob('complex_modifications/*') do |filepath|
  puts filepath
  generate(filepath)
end