cask "modularguard" do
  version "0.0.12"

  on_macos do
    on_arm do
      sha256 "24f2bd7c2dc549cfb07e786e35a29b809f9d066fb34615f1e8c7f0e6e5e49777"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-osx-arm64.tar.gz"
    end
    on_intel do
      sha256 "6a59c4b39d37b31e7a3227f138678d9ff8d2319d0effcfef219c45c010a24233"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-osx-x64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "5561b8cac1149b8c55dde593ab25e22c5927347d3a239f075781dd57ae34ffcf"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-linux-arm64.tar.gz"
    end
    on_intel do
      sha256 "98d498a4aaa24923371099bb6b539581c4feda48429e9014fb28fe086cb601f4"
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
