cask "modularguard" do
  version "0.0.20"

  on_macos do
    on_arm do
      sha256 "064f96b62959b2a1374904668b32e01919cd1cc515cfcee1362ef1bd76b12af2"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-osx-arm64.tar.gz"
    end
    on_intel do
      sha256 "1b0737a1a26e191b10815ce1e74408975aea7b12ad29fd6c4eefcd929e47f3a3"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-osx-x64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "5e2e742ee26204dbcf60a77e307ceb26b7cf982dced7ee47c4912607b4e5ef5c"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-linux-arm64.tar.gz"
    end
    on_intel do
      sha256 "3d8bdec307b1134eeac3ce5aba3f1007c5324c8ea87b756f7379ab197334a985"
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
