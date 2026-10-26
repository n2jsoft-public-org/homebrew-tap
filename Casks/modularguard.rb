cask "modularguard" do
  version "0.0.15"

  on_macos do
    on_arm do
      sha256 "1aac19e720c35db65cbabea360a05c632e9d8253a7d6c769a7ab49cda8ac8868"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-osx-arm64.tar.gz"
    end
    on_intel do
      sha256 "82a2c1d4415c19dd742c6b7b21bd99eb6a1b0748877abd7bf02390c8993cd14a"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-osx-x64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "4937e6717026e60f2b5273b5f7bf0247ada1c6d92ca1958716ffc01d7408fdd6"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-linux-arm64.tar.gz"
    end
    on_intel do
      sha256 "87ab53e143e9ce799ce103a2581ddecaae204d5aa0020f81249831e365f1af57"
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
