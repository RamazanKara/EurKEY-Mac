class Eurkey < Formula
    desc "Install EurKEY Keyboard Layout"
    homepage "https://github.com/RamazanKara/homebrew-eurkey"
    url "https://github.com/RamazanKara/homebrew-eurkey/raw/main/releases/1.3/EurKEY.zip"
    sha256 "3a583cb5f8ac4761fb05ce1a99bf15894d0918af2ff86639dea67960f16bebb7"
    version "1.3"
  
    def install
        # Unzip the files to the prefix directory
        begin
          system "unzip", "EurKEY.zip", "-d", prefix
        rescue => e
          onoe "Error unzipping EurKEY files: #{e}"
        end
    
        # Define target directory for keyboard layouts in the user's library
        keyboard_layouts_dir = "#{ENV['HOME']}/Library/Keyboard Layouts"
        mkdir_p keyboard_layouts_dir
    
        # Symlink the keylayout and icns files to the target directory
        begin
          ln_s "#{prefix}/EurKEY.keylayout", "#{keyboard_layouts_dir}/EurKEY.keylayout"
          ln_s "#{prefix}/EurKEY.icns", "#{keyboard_layouts_dir}/EurKEY.icns"
        rescue => e
          onoe "Error creating symlinks for EurKEY: #{e}"
        end
      end
    
      def caveats
        <<~EOS
          EurKEY Keyboard Layout has been installed to #{keyboard_layouts_dir}.
          Please log out and log back in for the changes to take effect.
        EOS
      end
    end