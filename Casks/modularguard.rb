cask "modularguard" do
  version "0.0.14"

  on_macos do
    on_arm do
      sha256 "c389abe145bc4caae39154f3c768e37eaff810ed0c89e4fc9e79b988506a0390"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-osx-arm64.tar.gz"
    end
    on_intel do
      sha256 "dace7e3c4377c499ec8afbbc5c83cf0ecf91d21fb3db70dbca367a3f74352475"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-osx-x64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "41eed99a1a6cbb56aa149a69d910c618d64359be1f812055071a17bde34c165b"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-linux-arm64.tar.gz"
    end
    on_intel do
      sha256 "74e72bff5f4f111665866ceb2c39f38952a0b4b0c631ac93ab8926b2b5091709"
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
