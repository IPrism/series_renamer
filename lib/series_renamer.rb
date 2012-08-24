require "series_renamer/version"
DEBUG = false
VALID_EXTENTIONS = "{mpg,avi,srt,m4v,mkv,mp4}"
class SerieRenamer
  ##
  # Rename a file with the convention Title - S[season]E[episode].[extention]
  # @param [String] file_to_rename The absolute path to the file
  # @author romain
  def self.rename_with_convention(file_to_rename)  
    episode = File.basename(file_to_rename).to_s[/(?:E|eP?|x|-)(\d+)/i, 1] 
    episode = "0#{episode}" if episode.length == 1
    file_tab = file_to_rename.split "\/"
    season = file_tab[file_tab.length-2][/(\d+)/, 1] 
    season = "0#{season}" if season.length == 1
    title = file_tab[file_tab.length-3]
    newname = "#{File.dirname(file_to_rename)}/#{title} - S#{season}E#{episode}#{File.extname(file_to_rename)}" 
    if DEBUG
      print "Old name: #{file_to_rename}\n New name: #{newname}\n"
      puts "respecte la convention \n -------------------" if newname == file_to_rename 
    end
    File.rename(file_to_rename, newname) unless newname == file_to_rename
  end
end