cask "modularguard" do
  version "0.0.19"

  on_macos do
    on_arm do
      sha256 "8aa2c9324a075f0e08caf382dda5ccd6b73820a65c8c9f4f9c92f2c893e0c06d"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-osx-arm64.tar.gz"
    end
    on_intel do
      sha256 "0fda285e995c99c49f33acad13f5724825358f38301797e4be2925600149e75b"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-osx-x64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "2fb9ed461f894439f66dc59bde7b7af3da41b179331023c031a6874a8cb8304a"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-linux-arm64.tar.gz"
    end
    on_intel do
      sha256 "4cae003f430697a2bb31dc40855f86e87aaa7ebacd8223dde08932be098ce9b1"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-linux-x64.tar.gz"
    end
  end

  name "modularguard"
  desc "Validate project references in a modular monolith .NET solution"
  homepage "https://github.com/n2jsoft-public-org/ModularGuard"

  binary "modularguard"

  livecheck do
    skip "Auto-generated on release."
  end

  # The binaries are not notarized: without this, macOS refuses to run them.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/modularguard"] if OS.mac?
  end
end
