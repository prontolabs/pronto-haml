require 'spec_helper'

module Pronto
  describe Haml do
    let(:haml) { Haml.new }

    describe '#run' do
      subject { haml.run(patches, nil) }

      context 'patches are nil' do
        let(:patches) { nil }
        it { should == [] }
      end

      context 'no patches' do
        let(:patches) { [] }
        it { should == [] }
      end
    end
  end
end
