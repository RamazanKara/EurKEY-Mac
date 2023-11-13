class Eurkey < Formula
    desc "Install EurKEY Keyboard Layout for Mac"
    homepage "https://github.com/RamazanKara/homebrew-eurkey"
    url "https://github.com/RamazanKara/homebrew-eurkey/raw/main/releases/1.3/EurKEY.zip"
    sha256 "..." # Replace with the actual SHA-256 of EurKEY.zip
    version "1.3"
  
    def install
      eurkey_dir = prefix/"EurKEY"
      eurkey_dir.mkpath
  
      begin
        ohai "Unzipping EurKEY files to #{eurkey_dir}"
        system "unzip", "EurKEY.zip", "-d", eurkey_dir
      rescue => e
        onoe "Error unzipping EurKEY files: #{e}"
      end
  
      real_home = Dir.home
      keyboard_layouts_dir = "#{real_home}/Library/Keyboard Layouts"
      mkdir_p keyboard_layouts_dir
  
      begin
        ohai "Creating symlinks in #{keyboard_layouts_dir}"
        ln_s File.join(eurkey_dir, "EurKEY.keylayout"), File.join(keyboard_layouts_dir, "EurKEY.keylayout")
        ln_s File.join(eurkey_dir, "EurKEY.icns"), File.join(keyboard_layouts_dir, "EurKEY.icns")
      rescue => e
        onoe "Error creating symlinks for EurKEY: #{e}"
      end
    end
  
    def caveats
      <<~EOS
        EurKEY Keyboard Layout has been installed to #{Dir.home}/Library/Keyboard Layouts.
        Please log out and log back in for the changes to take effect.
      EOS
    end
  end