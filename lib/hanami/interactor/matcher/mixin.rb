module Hanami
  module Interactor
    module Matcher
      module Mixin
        def match(result, &block)
          MatcherObject.(result, &block)
        end
      end
    end
  end
end
