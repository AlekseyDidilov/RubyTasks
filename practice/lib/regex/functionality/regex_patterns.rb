module RegexPatterns

  # Method should return amount of occurrences of the sting
  def self.count_occurrence(file_path, regex_pattern)
    File.open(file_path).read.to_s.scan(/#{regex_pattern}/).length
  end
end
