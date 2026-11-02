cask "modularguard" do
  version "0.0.18"

  on_macos do
    on_arm do
      sha256 "feb3be01bf69ef063593c9ef57dfdb488c19a4daacdde891495f90fef4332ba8"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-osx-arm64.tar.gz"
    end
    on_intel do
      sha256 "6a751dbe46e7f1586cf49f70587af845c3fad5748b2e355ef7657eb3a26c8a23"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-osx-x64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "9df569557e5a4d0f3b4215483999f1ef1a1c2e2e72b616889af25e4c047f036f"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-linux-arm64.tar.gz"
    end
    on_intel do
      sha256 "2d2c0bf31700cde255c5d9de1b4c008ff68e61f0acd600ece5dda9a2ed01796e"
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
