cask "emprint" do
  version "0.2.8"

  on_arm do
    sha256 "d813e337aedb8eb83ccaca5ff8a6f037ac3dcf0e6aa6221d463df4e204d1116f"
    url "https://github.com/MinhyeongSon/emprint-release/releases/download/v0.2.8/Emprint-0.2.8-mac-arm64.zip"
  end

  on_intel do
    sha256 "9890514e4ccf075c3a9d6ef8614c88db8d87660beb64a5cf03d083792ccae80a"
    url "https://github.com/MinhyeongSon/emprint-release/releases/download/v0.2.8/Emprint-0.2.8-mac-x64.zip"
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
