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
    frames.each_with_index do |current_frame, frame_number|
      next_frame = frames[frame_number+1]
      score +=  if next_frame
                  if current_frame.strike?
                    if frame_number < 9 # 10th frame, frame_number is zero indexed
                      if next_frame.strike?
                        30
                      else
                        10 + next_frame.frame_score
                      end
                    else
                      10
                    end
                  elsif current_frame.spare?
                    if frame_number < 9
                      10 + next_frame.first_box
                    else
                      10
                    end
                  else
                    current_frame.frame_score
                  end
                else
                  current_frame.frame_score
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

  def strike?
    @first_box == 10
  end

  def spare?
    @first_box + @second_box == 10
  end

end
