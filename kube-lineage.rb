class KubeLineage < Formula
  desc "Display all dependencies or dependents of objects in a Kubernetes cluster"
  homepage "https://github.com/tohjustin/kube-lineage"
  url "https://github.com/tohjustin/kube-lineage/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "ae62cf88b0b8080c1abff50eb1f1f5c6a2ff51cb158eb5b17eb86310105254c3"
  license "Apache-2.0"
  head "https://github.com/tohjustin/kube-lineage.git", branch: "master"

  depends_on "git" => [:build]
  depends_on "go" => [:build]
  depends_on "make" => [:build]

  def install
    system "make", "build"
    bin.install "bin/kube-lineage" => "kubectl-lineage"
  end
end
