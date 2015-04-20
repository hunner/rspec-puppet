require 'spec_helper'

describe 'split' do
  describe 'rspec group' do
    it 'should have a catalogue method' do
      expect(catalogue).to be_a(Puppet::Resource::Catalog)
    end

    it 'catalogue should not change after subject is called' do
      expect(catalogue).to be_a(Puppet::Resource::Catalog)
      pre_id = catalogue.object_id

      should run.with_params('aoeu', 'o').and_return(['a', 'eu'])

      post_id = catalogue.object_id

      expect(pre_id).to eq post_id
    end

    it 'should have a callable subject' do
      expect(subject).to respond_to(:call)
    end

    context 'without an explicit environment setting' do
      it 'should create a scope accessing "rp_env"' do
        expect(subject.receiver.environment.to_s).to eq('rp_env')
      end
    end
    context 'when specifying an explicit environment' do
      let(:environment) { 'test_env' }
      it 'should create a scope accessing the specified environment' do
          expect(subject.receiver.environment.to_s).to eq('test_env')
      end
    end
  end
end
