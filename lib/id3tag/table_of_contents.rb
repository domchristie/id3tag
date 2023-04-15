require "forwardable"

module ID3Tag
  class TableOfContents
    extend Forwardable
    attr_reader :frame, :tag

    def_delegators :frame,
      :id,
      :element_id,
      :top_level?,
      :ordered?,
      :entry_count

    def initialize(frame, tag:)
      @frame = frame
      @tag = tag
    end

    def element_frames
      return @element_frames if defined?(@element_frames)

      @element_frames = @frame.child_element_ids.map do |element_id|
        tag.get_table_of_contents_element_frame(element_id)
      end.compact
    end

    def elements
      return @elements if defined?(@elements)

      @elements = element_frames.map do |frame|
        create_element(frame)
      end.compact
    end

    private

    def create_element(frame)
      case frame.id
      when :CTOC
        TableOfContents.new(frame, tag: tag)
      when :CHAP
        Chapter.new(frame)
      end
    end
  end
end
