# require modules here
require "yaml"
def load_library(filename)
  raw_hash =  YAML.load(File.read(filename))
  hash = Hash.new
  raw_hash.each do |key, value|
    
    hash[key]= {'english': value[0], 'japanese': value[1]}
    
  end
  
  return hash
  # code goes here
  
end

def get_japanese_emoticon(filename, emoticon)
  # code goes here
  hash = load_library(filename)
  
  puts(hash)
    hash.each do |key, value|
    if value[:english] == emoticon
      return value[:japanese]
    end
  end
  return 'Sorry, that emoticon was not found'
end

def get_english_meaning(filename, emoticon)
  hash = load_library(filename)
 
  hash.each do |key, value|
    if value[:japanese] == emoticon
      return key
    end
  end
  return 'Sorry, that emoticon was not found'
  # code goes here
end