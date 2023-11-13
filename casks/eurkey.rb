cask "eurkey" do
  version "1.3"
  sha256 :no_check

  url "https://github.com/RamazanKara/EurKEY-Mac/main/archive/main.zip",
      verified: "github.com/RamazanKara/EurKEY-Mac/"
  name "EurKEY keyboard layout"
  desc "Keyboard Layout for Europeans, Coders and Translators"
  homepage "https://eurkey.steffen.bruentjen.eu/"

  livecheck do
    url "https://raw.githubusercontent.com/RamazanKara/homebrew-eurkey/main/EurKEY.keylayout"
    regex(/EurKEY\s+v?(\d+(?:\.\d+)+)/i)
  end

  keyboard_layout "EurKEY-Mac-main/EurKEY.keylayout"
  keyboard_layout "EurKEY-Mac-main/EurKEY.icns"

  caveats do
    <<~EOS
      Installation complete! You may need to log out and log back in for the keyboard layout to appear in your system settings.
    EOS
  end
end