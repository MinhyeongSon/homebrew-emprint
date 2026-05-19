cask "emprint" do
  version "0.2.9"

  on_arm do
    sha256 "ef1e9466c28090e61e0f4cf4b28e7103678c097c8fc7222f23974e66071340ba"
    url "https://github.com/MinhyeongSon/emprint-release/releases/download/v0.2.9/Emprint-0.2.9-mac-arm64.zip"
  end

  on_intel do
    sha256 "0c2bcf5b43d23eccc92eeee3278ee8a9f5f685b68febc71fb620a13cd0fe84e5"
    url "https://github.com/MinhyeongSon/emprint-release/releases/download/v0.2.9/Emprint-0.2.9-mac-x64.zip"
  end

  name "Emprint"
  desc "Local-first, Git-native workspace runtime for creators"
  homepage "https://minhyeongson.github.io/emprint-home/"

  app "Emprint.app"

  # Casks use postflight (not formula post_install). Re-sign after install for unsigned builds.
  postflight do
    app = "#{appdir}/Emprint.app"
    system_command "/usr/bin/xattr",
                      args: ["-dr", "com.apple.quarantine", app]
    system_command "/usr/bin/codesign",
                      args: ["--force", "--deep", "--sign", "-", app]
  end

  caveats <<~EOS
    Emprint requires Node.js 22+ for Design preview (npm run dev).
    Install: brew install node
  EOS
end
