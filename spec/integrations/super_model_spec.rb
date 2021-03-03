require File.expand_path("../spec_helper.rb", File.dirname(__FILE__))

describe SuperModel do
  
  describe "#to_pdf" do
    before do
      @model = SuperModel.new
    end
    
    it do
      asset_binary = File.open(asset_path('default_render')).read.bytes.to_a
      expect(@model.to_pdf.bytes.to_a).to eq(asset_binary)
    end
  end
  
end
