require "forwardable"

module ID3Tag
  class Chapter
    extend Forwardable
    attr_reader :frame

    def_delegators :frame,
      :id,
      :element_id,
      :start_time,
      :end_time,
      :start_offset,
      :end_offset,
      :title,
      :url,
      :picture

    def initialize(frame)
      @frame = frame
    end
  end
end
