module Interactors
  class Success
    include Hanami::Interactor
    expose :value

    def call
      @value = 'hello'
    end
  end

  class Fail
    include Hanami::Interactor
    expose :value

    def call
      @value = 'error'
      fail!
    end
  end
end
