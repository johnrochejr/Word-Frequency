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
    @words
  end

  def frequency(word)
    @words[word]
  end





  def frequencies
    # How can I get words to show: make a has to list out unique words
    # each time it
  #  puts @words.each_with_object(Hash.new(0))

  end

  def top_words(number)
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
