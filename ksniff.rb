class Ksniff < Formula
  desc "Kubectl plugin to ease sniffing on kubernetes pods using tcpdump and wireshark"
  homepage "https://github.com/eldadru/ksniff"
  license "Apache-2.0"
  url "https://github.com/eldadru/ksniff/releases/download/v1.6.2/ksniff.zip"

  def install
    on_linux do
      bin.install "kubectl-sniff"
    end

    on_macos do
      on_arm do
        bin.install "kubectl-sniff-darwin-arm64" => "kubectl-sniff"
      end
      on_intel do
        bin.install "kubectl-sniff-darwin" => "kubectl-sniff"
      end
    end

    bin.install "static-tcpdump"
  end
end
