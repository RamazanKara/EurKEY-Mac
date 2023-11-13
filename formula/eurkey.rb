class Eurkey < Formula
    desc "Install EurKEY Keyboard Layout"
    homepage "https://github.com/RamazanKara/homebrew-eurkey"
    url "https://github.com/RamazanKara/homebrew-eurkey/raw/main/releases/1.3/EurKEY.zip"
    sha256 "3a583cb5f8ac4761fb05ce1a99bf15894d0918af2ff86639dea67960f16bebb7"
    version "1.3"
    
    def install
        # Create a subdirectory in the prefix directory to store the actual files
        eurkey_dir = prefix/"EurKEY"
        eurkey_dir.mkpath
    
        begin
          system "unzip", "EurKEY.zip", "-d", eurkey_dir
        rescue => e
          onoe "Error unzipping EurKEY files: #{e}"
        end
    
        # Define target directory for keyboard layouts in the user's library
        keyboard_layouts_dir = "#{ENV['HOME']}/Library/Keyboard Layouts"
        mkdir_p keyboard_layouts_dir
    
        # Symlink the keylayout and icns files to the target directory
        begin
          ln_s File.join(eurkey_dir, "EurKEY.keylayout"), File.join(keyboard_layouts_dir, "EurKEY.keylayout")
          ln_s File.join(eurkey_dir, "EurKEY.icns"), File.join(keyboard_layouts_dir, "EurKEY.icns")
        rescue => e
          onoe "Error creating symlinks for EurKEY: #{e}"
        end
      end
    
      def caveats
        <<~EOS
          EurKEY Keyboard Layout has been installed to #{ENV['HOME']}/Library/Keyboard Layouts.
          Please log out and log back in for the changes to take effect.
        EOS
      end
    end