class Wordfreq
  STOP_WORDS = ['a', 'an', 'and', 'are', 'as', 'at', 'be', 'by', 'for', 'from',
    'has', 'he', 'i', 'in', 'is', 'it', 'its', 'of', 'on', 'that', 'the', 'to',
    'were', 'will', 'with']

  def initialize(filename)
    contents = File.read(filename).downcase.gsub("--", " ")
    contents = contents.gsub(/[^a-z0-9\s]/i, "")
    word_array = contents.split(" ") - STOP_WORDS

    @words = {}

    word_array.each do |word|
      if @words.include?(word)
        @words[word] += 1
      else
        @words[word] = 1
      end
    end
    top_words(5)
  end

  def frequency(word)
    if @words.has_key?(word)
      return frequencies[word]
    else
      0
    end
  end

  def frequencies
    @words
  end

  def top_words(number)
    @words.sort_by {|word, count| count}.reverse.take(5)
  end

  def print_report
  end
end

if __FILE__ == $0
  filename = ARGV[0]
  if filename
    full_filename = File.absolute_path(filename)
    if File.exists?(full_filename)
      wf = Wordfreq.new(full_filename)
      wf.print_report
    else
      puts "#{filename} does not exist!"
    end
  else
    puts "Please give a filename as an argument."
  end
end
