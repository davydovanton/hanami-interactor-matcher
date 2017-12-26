require 'support/interactors'

RSpec.describe Hanami::Interactor do
  let(:matcher_block) do
    -> (m) do
      m.success { |v| puts "Yay: #{v}" }
      m.failure { |v| puts "Boo: #{v}" }
    end
  end

  subject { interactor.call(&matcher_block) }

  xcontext 'when interactor successful' do
    let(:interactor) { Interactors::Success.new }

    it { expect(subject).to eq 'Yay: hello' }
  end

  xcontext 'when interactor failed' do
    let(:interactor) { Interactors::Fail.new }

    it { expect(subject).to eq 'Boo: error' }
  end
end
