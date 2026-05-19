cask "emprint" do
  version "0.2.10"

  on_arm do
    sha256 "4377432f4d42f4a9c440dcb5f7761cdd924805c8f6d51cb2ead237d47065cb6e"
    url "https://github.com/devminson/emprint-release/releases/download/v0.2.10/Emprint-0.2.10-mac-arm64.zip"
  end

  on_intel do
    sha256 "478f4963d131fc842dd537c054a8c732f6317277690521b897a38c7861a6ae23"
    url "https://github.com/devminson/emprint-release/releases/download/v0.2.10/Emprint-0.2.10-mac-x64.zip"
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
