require_relative '../../bowling_game'

Given 'I have a lane' do
  @game = BowlingGame.new
end

When /^I bowl a one$/ do
  @game.bowl(1)
end

When /^I\ bowl\ (\d+|all)\ (zeroes|ones)$/ do |count, pin_count|

  case count
    when /\d+/
      times = count.to_i
    when 'all'
      times = 20
    else raise ArgumentError
  end

  case pin_count
    when 'zeroes'
      times.times { @game.bowl(0) }
    when 'ones'
      times.times { @game.bowl(1) }
    else raise ArgumentError
  end

end

When /^I bowl a spare$/ do
  2.times { @game.bowl(5) }
end

When /^I bowl a strike$/ do
  @game.bowl(10)
end

When "I bowl a perfect game" do
  12.times { @game.bowl(10) }
end

Then "my score should be $score" do |score|
  @game.score.should == score.to_i
end
