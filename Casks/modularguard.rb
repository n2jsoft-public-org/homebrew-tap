cask "modularguard" do
  version "0.0.17"

  on_macos do
    on_arm do
      sha256 "264d49ce4419649c9485baae7cff5f4812fcdb2366b7c01cefa285b458503a03"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-osx-arm64.tar.gz"
    end
    on_intel do
      sha256 "d297e1ac7981ef293e63ab38b27eba5dbf0feb2ba5189b1bebdbf654e34bac0d"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-osx-x64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "f65643cc39771f20839f5b0bbdc1cd84bd6e18a6df88489b8fc0b30796e59f5b"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-linux-arm64.tar.gz"
    end
    on_intel do
      sha256 "4e57ed8aa00d4f280909c80641fb77037ffb71651ac2952d176155780edea3d6"
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
