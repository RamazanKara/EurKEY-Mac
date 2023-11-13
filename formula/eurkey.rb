class Eurkey < Formula
    desc "Install EurKEY Keyboard Layout"
    homepage "https://github.com/RamazanKara/homebrew-eurkey"
    url "https://github.com/RamazanKara/homebrew-eurkey/raw/main/releases/1.3/EurKEY.zip"
    sha256 "3a583cb5f8ac4761fb05ce1a99bf15894d0918af2ff86639dea67960f16bebb7"
    version "1.3"
  
    def install
        # Define target directory
        keyboard_layouts_dir = "#{ENV['HOME']}/Library/Keyboard Layouts"
    
        # Create target directory if it doesn't exist
        mkdir_p keyboard_layouts_dir
    
        begin
          # Extract and install the keylayout and icns files
          system "unzip", "EurKEY.zip", "-d", keyboard_layouts_dir
        rescue => e
          onoe "Error installing EurKEY: #{e}"
        end
      end
    
      def caveats
        <<~EOS
          EurKEY Keyboard Layout has been installed to #{ENV['HOME']}/Library/Keyboard Layouts.
          Please log out and log back in for the changes to take effect.
        EOS
      end
    end