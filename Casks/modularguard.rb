cask "modularguard" do
  version "0.0.10"

  on_macos do
    on_arm do
      sha256 "46d5b570cd8b3d70ccce4c52ead2aa77894b8414ef5cd19cdc93e539aaf552cb"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-osx-arm64.tar.gz"
    end
    on_intel do
      sha256 "3f873ece2a9579e5786730e60e54727ee566ed4e2c6aa442b69e015089022cc3"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-osx-x64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "2364729451712c7f034352c32d38e45562b90c28d0e6d686de68b6a7d2553a46"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-linux-arm64.tar.gz"
    end
    on_intel do
      sha256 "f5ab0757acef277af7c6cfb0183a3d9e397a5fdbec831d6e5abe7f98ffb84e87"
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
