class Archivist
  def self.load
    begin
      file = File.new('./data/library.yml', 'r')
      library = YAML.load(file.read)
    rescue IOError => e
      puts "Exception: #{e}"
      e
    ensure
      file.close unless file.nil?
      puts 'The library was successfully load.'
    end
    library
  end

  def self.save(library)
    begin
      file = File.open('./data/library.yml', 'w')
      file.write(YAML.dump(library))
    rescue IOError => e
      puts "Exception: #{e}"
      e
    ensure
      file.close unless file.nil?
      puts 'The library was successfully saved.'
    end
  end
end