require 'support/interactors'

RSpec.describe Hanami::Interactor::Matcher::MatcherObject do
  let(:matcher_block) do
    -> (m) do
      m.success { |v| "Yay: #{v}" }
      m.failure { |v| "Boo: #{v}" }
    end
  end

  subject { described_class.(interactor.call, &matcher_block) }

  context 'when interactor successful' do
    let(:interactor) { Interactors::Success.new }

    it { expect(subject).to eq 'Yay: hello' }
  end

  context 'when interactor failed' do
    let(:interactor) { Interactors::Fail.new }

    it { expect(subject).to eq 'Boo: error' }
  end
end
