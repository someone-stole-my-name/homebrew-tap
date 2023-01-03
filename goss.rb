class Goss < Formula
  desc "Quick and Easy server testing/validation"
  homepage "https://goss.rocks"
  license "Apache-2.0"
  head "https://github.com/goss-org/goss.git", branch: "master"

  depends_on "go" => [:build]

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{Utils.git_head}
    ]

    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/goss"
  end
end
