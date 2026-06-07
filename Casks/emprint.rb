cask "emprint" do
  version "0.3.0"

  on_arm do
    sha256 "62ce87ff517581a0fe481589726fdc8c6871108d40608c8a0c21b3a47f6edc9c"
    url "https://github.com/devminson/emprint-release/releases/download/v0.3.0/Emprint-0.3.0-mac-arm64.zip"
  end

  on_intel do
    sha256 "08447c17192d2a45466aa1610b7d578cc73cbce5565faeda261480a31cd517b6"
    url "https://github.com/devminson/emprint-release/releases/download/v0.3.0/Emprint-0.3.0-mac-x64.zip"
  end

  name "Emprint"
  desc "Local-first, Git-native workspace runtime for creators"
  homepage "https://devminson.github.io/emprint-home/"

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
