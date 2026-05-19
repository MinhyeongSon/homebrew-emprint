cask "emprint" do
  version "0.2.8"

  on_arm do
    sha256 "18a5063fbdc5a34c23663f5ca81035f83f6e5fd86c5a6461b0fa8746da05deb8"
    url "https://github.com/MinhyeongSon/emprint-release/releases/download/v0.2.8/Emprint-0.2.8-mac-arm64.zip"
  end

  on_intel do
    sha256 "8e5c3348b4f5abf4d479e959f6f5ef980426144c609684d558d36b8ae1fafa9b"
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
