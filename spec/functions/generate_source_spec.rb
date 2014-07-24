require 'spec_helper'

describe 'generate_source' do

  let(:scope) { PuppetlabsSpec::PuppetInternals.scope }

    context "With simple options" do
        let(:title) { 's_gsoc' }
        let(:type)  { 'file' }
        let(:options) {{ 'file' => "/var/log/apache.log",
                         'follow_freq' => 1
        }}
        let(:expected) {
'source s_gsoc {
    file(
        file("/var/log/apache.log"),
        follow_freq(1)
    );
};'     }
        it 'Should generate a simple file source' do
            result = scope.function_generate_source([title, type, options])
            expect(result).to be_a String
            expect(result).to eq expected
        end
    end

    context "With options" do
        let(:title) { 's_gsoc' }
        let(:type)  { 'file' }
        let(:options) {{ 'file' => "/var/log/apache.log",
                         'follow_freq' => 1,
                         'flags' => ['no_parse','validate_utf8']
        }}
        let(:expected) {
'source s_gsoc {
    file(
        file("/var/log/apache.log"),
        flags(no_parse, validate_utf8),
        follow_freq(1)
    );
};'     }

        it 'Should fill the options statement' do
          result = scope.function_generate_source([title, type, options])
          expect(result).to be_a String
          expect(result).to eq expected
        end
    end
end
