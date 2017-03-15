require 'spec_helper'

module Pronto
  describe Haml do
    let(:haml) { Haml.new(patches) }
    let(:patches) { nil }

    describe '#run' do
      subject { haml.run }

      context 'patches are nil' do
        it { should == [] }
      end

      context 'patches are empty' do
        let(:patches) { [] }
        it { should == [] }
      end

      context 'patches with a one warning' do
        include_context 'test repo'

        let(:patches) { repo.diff('master') }

        its(:count) { should == 1 }
        its(:'first.msg') { should == 'Hash attribute should start with one space after the opening brace' }
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
