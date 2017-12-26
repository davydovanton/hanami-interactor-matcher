require 'dry-matcher'
require 'hanami/interactor'
require 'hanami/interactor/matcher/mixin'
require 'hanami/interactor/matcher/version'

module Hanami
  module Interactor
    module Matcher
      # Your code goes here...
      #
      SUCCESS_CASE = Dry::Matcher::Case.new(
        match: -> result { result.successful? },
        resolve: -> result { result.value }
      )

      FAILURE_CASE = Dry::Matcher::Case.new(
        match: -> result { result.failure? },
        resolve: -> result { result.value }
      )

      MatcherObject = Dry::Matcher.new(success: SUCCESS_CASE, failure: FAILURE_CASE)

      def call(*args, **kwargs, &block)
        @__result = ::Hanami::Interactor::Result.new
        _call(*args, **kwargs) { super }

        if block
          MatcherObject.(@__result, &block)
        else
          @__result
        end
      end
    end
  end
end

module Hanami::Interactor::Interface
  include Hanami::Interactor::Matcher
end
