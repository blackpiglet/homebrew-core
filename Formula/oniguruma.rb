class Oniguruma < Formula
  desc "Regular expressions library"
  homepage "https://github.com/kkos/oniguruma/"
  url "https://github.com/kkos/oniguruma/releases/download/v6.9.1/onig-6.9.1.tar.gz"
  sha256 "c7c3feb7be45a5cc9f2dec239b4a317a422e6ffea299cf91ffab1b926633ea12"

  bottle do
    cellar :any
    sha256 "1900fb3001309e4392a7bed63fa29d25329a6e8bc1a073a83c3a949378aa6af6" => :mojave
    sha256 "37e3e84d9f8d23f9f23b3c6694efd46c070b6e63ffb32c9449d5be3f52ffd355" => :high_sierra
    sha256 "b62eccf926d9a287225db42f8523b72e634f675742058f88fcae0e9fbca5820e" => :sierra
    sha256 "2ca4ffcd1bc50c7b442514e04443f59ce86a873013eb657df897e4ff3aee7edd" => :el_capitan
  end

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    assert_match /#{prefix}/, shell_output("#{bin}/onig-config --prefix")
  end
end
