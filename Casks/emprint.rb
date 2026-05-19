cask "emprint" do
  version "0.2.8"

  on_arm do
    sha256 "25a7fafb53766cca87dd5f75cef923eedf014beab5229eb384c85626855dc267"
    url "https://github.com/MinhyeongSon/emprint-release/releases/download/v0.2.8/Emprint-0.2.8-mac-arm64.zip"
  end

  on_intel do
    sha256 "ef0d4dfc20b22a59a00e320abdde58c526238e55ce72c406875b3b43747bf8b6"
    url "https://github.com/MinhyeongSon/emprint-release/releases/download/v0.2.8/Emprint-0.2.8-mac-x64.zip"
  end

  name "Emprint"
  desc "Local-first, Git-native workspace runtime for creators"
  homepage "https://minhyeongson.github.io/emprint-home/"

  app "Emprint.app"

  caveats <<~EOS
    Emprint requires Node.js 22+ for Design preview (npm run dev).
    Install: brew install node
  EOS
end
