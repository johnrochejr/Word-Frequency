

class Wordfreq
  STOP_WORDS = ['a', 'an', 'and', 'are', 'as', 'at', 'be', 'by', 'for', 'from',
    'has', 'he', 'i', 'in', 'is', 'it', 'its', 'of', 'on', 'that', 'the', 'to',
    'were', 'will', 'with']

  def initialize(filename)
    # Step 1 - Lowercase and remove punctuation
    contents = File.read(filename).downcase.gsub(/[^a-z0-9\s]/i, "")
    # Step 2 - remove stop words -- words used so frequently they are
    # ignored



  end

  def frequency(word)

        # For each word in text
        #   If we've seen that word before
        #     Increase the frequency for that word by one
        #   else
        #     Set the frequency for that word to 1
        
    @freq = { }

    if @freq[word]
      @freq[word] += 1
    else
      @freq[word] = 1
    end
  end

  def frequencies
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
