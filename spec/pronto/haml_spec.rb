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

      context 'patches are empty' do
        let(:patches) { [] }
        it { should == [] }
      end
    end

    context 'private instance methods' do
      describe '#haml_file?' do
        subject { haml.send(:haml_file?, path) }

        context 'with haml format' do
          let(:path) { 'bar/foo.html.haml' }
          it { should == true }
        end

        context 'with other file format' do
          let(:path) { 'bar/foo.erb' }
          it { should == false }
        end
      end
    end
  end
end
