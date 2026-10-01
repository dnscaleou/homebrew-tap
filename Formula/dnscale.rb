class Dnscale < Formula
  desc "Manage DNS zones and records, inspect DNSSEC, and read usage"
  homepage "https://github.com/dnscaleou/dnscale-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dnscaleou/dnscale-cli/releases/download/v1.0.0/dnscale_1.0.0_darwin_arm64.tar.gz"
      sha256 "4dda3d445675b1cde2539f5142b60d8c8ea0df1707088c8c18aff641cefce592"
    end
    on_intel do
      url "https://github.com/dnscaleou/dnscale-cli/releases/download/v1.0.0/dnscale_1.0.0_darwin_amd64.tar.gz"
      sha256 "416a9bb49e5bb0403b6b163cd36ab9f82aff5a7077fc0af7883f6eeda011e80e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dnscaleou/dnscale-cli/releases/download/v1.0.0/dnscale_1.0.0_linux_arm64.tar.gz"
      sha256 "39f7b222f37375eb5a5a5dded400c78211e3d81c1e39acaf9d04ee35ac1f15f8"
    end
    on_intel do
      url "https://github.com/dnscaleou/dnscale-cli/releases/download/v1.0.0/dnscale_1.0.0_linux_amd64.tar.gz"
      sha256 "41780a8deaad82b191f3c4a6a1122ba2db1a5a940ec1ca08dba98afc702a99fe"
    end
  end

  def install
    bin.install "dnscale"
    doc.install "README.md", "QUICKSTART.md", "CHANGELOG.md", "LICENSE", "THIRD_PARTY_NOTICES.txt"
    pkgshare.install "examples"
    generate_completions_from_executable(bin/"dnscale", "completion")
  end

  test do
    assert_match "dnscale version #{version}", shell_output("#{bin}/dnscale --version")
    result = JSON.parse(shell_output("#{bin}/dnscale records create example.com " \
                                     "--file #{pkgshare}/examples/record.json --dry-run --json"))
    data = result.fetch("data")
    assert_equal true, data.fetch("valid")
    assert_equal false, data.fetch("submitted")
    assert_equal "local_only", data.fetch("validation")
    assert_equal "192.0.2.10", data.fetch("record").fetch("content")
    assert_path_exists bash_completion/"dnscale"
    assert_path_exists zsh_completion/"_dnscale"
    assert_path_exists fish_completion/"dnscale.fish"
  end
end
