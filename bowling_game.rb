class BowlingGame

  def initialize
    @boxes = []
  end

  def bowl(pins)
    if pins == 10
      @boxes << pins
      @boxes << nil
    else
      @boxes << pins
    end
  end

  def score
    calculate_score
  end

  def calculate_score
    score = 0
    frames = self.frames
    frames.each_with_index do |frame, i|
      score +=
          if frame.first_box == 10
            frame.frame_score + frames[i+1].frame_score
          elsif frame.frame_score == 10
            frame.frame_score + frames[i+1].first_box
          else
            frame.frame_score
          end
    end
    score
  end

  def frames
    @boxes.each_slice(2).map do |boxes|
      Frame.new(boxes.first, boxes.last)
    end
  end

end


class Frame

  def initialize(first_box, second_box)
    @first_box = first_box
    @second_box = second_box
  end

  def frame_score
    if @second_box.nil?
      @first_box
    else
      @first_box + @second_box
    end
  end

  def first_box
    @first_box
  end

end
