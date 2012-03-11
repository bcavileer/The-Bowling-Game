require_relative '../bowling_game'

describe BowlingGame do

  it "tracks the score" do
    subject.bowl(1)
    subject.bowl(2)
    subject.score.should == 3
  end

  it "scores spares according to rules" do
    subject.bowl(5)
    subject.bowl(5)
    subject.bowl(1)
    subject.bowl(1)
    subject.score.should == 13
  end

  it "scores strikes according to rules" do
    subject.bowl(10)
    subject.bowl(1)
    subject.bowl(1)
    subject.score.should == 14
  end

end
