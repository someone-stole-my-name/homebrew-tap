class KubeLineage < Formula
  desc "Display all dependencies or dependents of objects in a Kubernetes cluster"
  homepage "https://github.com/tohjustin/kube-lineage"
  url "https://github.com/tohjustin/kube-lineage/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "a0517831170b48648aba3fcabfd553350dc75764597a5d7c02bad6253ddeaa90"
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
