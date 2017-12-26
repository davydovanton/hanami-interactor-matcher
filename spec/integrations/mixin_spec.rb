require 'support/interactors'

RSpec.describe Hanami::Interactor::Matcher::Mixin do
  let(:klass) do
    Class.new do
      include Hanami::Interactor::Matcher::Mixin
    end
  end

  subject do
    klass.new.match(interactor.call) do |m|
      m.success { |v| "Yay: #{v}" }
      m.failure { |v| "Boo: #{v}" }
    end
  end

  context 'when interactor successful' do
    let(:interactor) { Interactors::Success.new }

    it { expect(subject).to eq 'Yay: hello' }
  end

  context 'when interactor failed' do
    let(:interactor) { Interactors::Fail.new }

    it { expect(subject).to eq 'Boo: error' }
  end
end
