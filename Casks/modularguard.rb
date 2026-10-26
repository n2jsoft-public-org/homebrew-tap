cask "modularguard" do
  version "0.0.16"

  on_macos do
    on_arm do
      sha256 "e7f5ba64b3b54d759835d5e0f2d863d4229e106c3bbb12525441e6da6ca1f5fa"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-osx-arm64.tar.gz"
    end
    on_intel do
      sha256 "4d068207ada928d4eb10c7ee455b28148c3fa1de041dc5147e97acacbbcab2aa"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-osx-x64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "3a77ea8166d6d5c92f169e198d2a6a9c3b5571178983b1abfb09d63657559d97"
      url "https://github.com/n2jsoft-public-org/ModularGuard/releases/download/v#{version}/modularguard-linux-arm64.tar.gz"
    end
    on_intel do
      sha256 "796b3af41de97753ed2843592e629dd3b4d3359fe44db2cdec7eaed514afdee2"
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
