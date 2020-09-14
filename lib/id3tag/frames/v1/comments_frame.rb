module ID3Tag
  module Frames
    module V1
      class CommentsFrame < TextFrame
        def language
          'unknown'
        end

        def desciption
          'unknown'
        end

        def text
          content
        end

        def content
          EncodingUtil.encode(@content, source_encoding)
        end
      end
    end
  end
end

