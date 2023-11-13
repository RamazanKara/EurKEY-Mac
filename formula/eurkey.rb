class Eurkey < Formula
    desc "Install EurKEY Keyboard Layout"
    homepage "https://github.com/RamazanKara/EurKEY"
    url "https://github.com/RamazanKara/homebrew-eurkey/raw/master/releases/1.3/EurKEY.zip"
    sha256 "..." # toDo
    version "1.3"
  
    def install
      require 'open-uri'
  
      # URLs for the EurKEY files within the same repository
      keylayout_url = "https://github.com/RamazanKara/homebrew-eurkey/raw/master/releases/1.3/EurKEY.keylayout"
      icns_url = "https://github.com/RamazanKara/homebrew-eurkey/raw/master/releases/1.3/EurKEY.icns"
  
      # Define target directory
      target_dir = "#{ENV['HOME']}/Library/Keyboard Layouts/"
      mkdir_p target_dir unless File.directory?(target_dir)
  
      # Download and write files to the target directory
      begin
        { "EurKEY.keylayout" => keylayout_url, "EurKEY.icns" => icns_url }.each do |filename, url|
          open("#{target_dir}/#{filename}", "wb") do |file|
            file.write URI.open(url).read
          end
        end
      rescue OpenURI::HTTPError => e
        odie "Download failed: #{e.message}"
      rescue IOError => e
        odie "Error writing to file: #{e.message}"
      end
    end
  
    def caveats
      <<~EOS
        EurKEY Keyboard Layout has been installed.
        Please log out and log back in for the changes to take effect.
      EOS
    end
  end