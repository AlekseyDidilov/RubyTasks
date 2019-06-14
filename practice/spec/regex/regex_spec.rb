describe 'Regex pattern' do
  NOT_EXISTING_STRING = 'Can not be in book'.freeze
  ONE_OCCURRENCE = 'Hello'.freeze
  MORE_TEN_OCCURRENCES = '(\s|\A)(come)([\s.,:]|\z)'.freeze
  ALPHA_NUMERIC = '(\s|^)[A-Za-z0-9]{20}(\s|$)'.freeze
  before(:each) do
    @book_path = File.join(
        'C:', 'Users', 'odidi', 'RubyTasks', 'practice', 'lib', 'regex', 'test_data', 'Story.txt'
    )
    @file_path = File.join(
        'C:', 'Users', 'odidi', 'RubyTasks', 'practice', 'lib', 'regex', 'test_data', 'alphanumeric.txt'
    )
  end

  it 'should not found not existing string' do
    matches = RegexPatterns.count_occurrence(@book_path, NOT_EXISTING_STRING)
    expect(matches).to eq 0
  end

  it 'should found one occurrence of the string' do
    matches = RegexPatterns.count_occurrence(@book_path, ONE_OCCURRENCE)
    expect(matches).to eq 1
  end

  it 'should found more than ten occurrences of the string' do
    matches = RegexPatterns.count_occurrence(@book_path, MORE_TEN_OCCURRENCES)
    expect(matches).to be > 10
  end

  it 'should found all 20 alphanumeric values in string' do
    matches = RegexPatterns.count_occurrence(@file_path, ALPHA_NUMERIC)
    expect(matches).to eq 3
  end
end
