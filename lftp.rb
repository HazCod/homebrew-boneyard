class Lftp < Formula
  desc "Sophisticated file transfer program"
  homepage "https://lftp.yar.ru/"
  # Can't get 4.7.x to build on OS X/macOS. Pull requests welcome!
  # https://github.com/Homebrew/homebrew-core/pull/1509
  url "https://lftp.yar.ru/ftp/lftp-4.7.5.tar.xz"
  sha256 "53b5c5eba2e38b418bcf451776f2df596050dff4db90ab4ea73d872f8b1fd0d8"

  depends_on "pkg-config" => :build
  depends_on "readline"
  depends_on "openssl"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-openssl=#{Formula["openssl"].opt_prefix}"
    system "make", "install"
  end

  test do
    system bin/"lftp", "-c", "open ftp://mirrors.kernel.org; ls"
  end
end
