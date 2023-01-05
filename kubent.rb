class Kubent < Formula
  desc "Easily check your clusters for use of deprecated APIs"
  homepage "https://github.com/doitintl/kube-no-trouble"
  url "https://github.com/doitintl/kube-no-trouble/archive/refs/tags/0.7.0.tar.gz"
  sha256 "a0517831170b48648aba3fcabfd553350dc75764597a5d7c02bad6253ddeaa90"
  license "MIT"
  head "https://github.com/doitintl/kube-no-trouble.git", branch: "master"

  depends_on "go" => [:build]

  def install
    ldflags = "-s -w"

    if build.head?
      ldflags += " -X main.version=#{Utils.git_head}"
      ldflags += " -X main.gitSha=#{Utils.git_head}"
    else
      ldflags += " -X main.version=v#{version}"
    end

    system "go", "build", "-ldflags", ldflags, "./cmd/kubent"
    bin.install "kubent"
  end
end
