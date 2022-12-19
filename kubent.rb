class Kubent < Formula
  desc "Easily check your clusters for use of deprecated APIs"
  homepage "https://github.com/doitintl/kube-no-trouble"
  license "MIT"
  head "https://github.com/doitintl/kube-no-trouble.git", branch: "master"

  depends_on "go" => [:build]

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{Utils.git_head}
      -X main.gitSha=#{Utils.git_head}
    ]

    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/kubent"
  end
end
