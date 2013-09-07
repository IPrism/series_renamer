require "series_renamer/version"
DEBUG = false
VALID_EXTENTIONS = "{mpg,avi,srt,m4v,mkv,mp4}"
class SeriesRenamer
  ##
  # Rename a file with the convention Title - S[season]E[episode].[extention]
  # @param [String] file_to_rename The absolute path to the file
  # @author romain
  def self.rename_with_convention(file_to_rename)  
    newname = self.filename_with_convention file_to_rename
    unless newname.nil?
      File.rename(file_to_rename, newname) unless newname == file_to_rename
    end
  end
  private
  ##
  # Generate the new filename with the convention: Title - S[season]E[episode].[extention]
  # @param [String] file_to_rename The absolute path to the file
  # @returns [String] the new filename who respects the convention
  # @author romain
  def self.filename_with_convention(old_filename)
    episode = File.basename(old_filename).to_s[/(?:E|eP?|x|-)(\d+)/i, 1]
    unless episode.nil?
      episode = "0#{episode}" if episode.length == 1
      file_tab = old_filename.split "\/"
      season = file_tab[file_tab.length-2][/(\d+)/, 1] 
      season = "0#{season}" if season.length == 1
      title = file_tab[file_tab.length-3]
      newname = "#{File.dirname(old_filename)}/#{title} - S#{season}E#{episode}#{File.extname(old_filename)}" 
      if DEBUG
        print "Old name: #{old_filename}\n New name: #{newname}\n"
        puts "respecte la convention \n -------------------" if newname == old_filename 
      end
      return newname
    end
    return nil 
  end
end