class Goss < Formula
  desc "Quick and Easy server testing/validation"
  homepage "https://goss.rocks"
  url "https://github.com/goss-org/goss/archive/refs/tags/v0.3.20.tar.gz"
  sha256 "5330d62826261533c8b1474799d9bc932fd50977e6f5a193b72244e0aaaf8946"
  license "Apache-2.0"
  head "https://github.com/goss-org/goss.git", branch: "master"

  depends_on "go" => [:build]

  def install
    ldflags = "-s -w"
    ldflags += if build.head?
      " -X main.version=#{Utils.git_head}"
    else
      " -X main.version=v#{version}"
    end

    system "go", "build", "-ldflags", ldflags, "./cmd/goss"
  end
end
