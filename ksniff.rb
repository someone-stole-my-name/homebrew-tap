class Ksniff < Formula
  desc "Kubectl plugin to ease sniffing on kubernetes pods using tcpdump and wireshark"
  homepage "https://github.com/eldadru/ksniff"
  url "https://github.com/eldadru/ksniff/releases/download/v1.6.2/ksniff.zip"
  sha256 "c59b5c9ea84d6cb771096f1246c919b71389f9d4234e858f4929208957e561fd"
  license "Apache-2.0"

  def install
    if OS.linux?
      bin.install "kubectl-sniff"
    elsif OS.mac?
      if Hardware::CPU.arm?
        bin.install "kubectl-sniff-darwin-arm64" => "kubectl-sniff"
      elsif Hardware::CPU.intel?
        bin.install "kubectl-sniff-darwin" => "kubectl-sniff"
      end
    end

    bin.install "static-tcpdump"
    chmod 0755, "bin/static-tcpdump"
  end
end
