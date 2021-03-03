require "spec_helper"

describe TestController do
  render_views

  describe "simple" do
    it "returns correct PDF" do
      get :default_render, :format => :pdf
      expect(response).to be_successful

      asset_binary = File.open(asset_path("default_render")).read.bytes.to_a
      body_binary = response.body.bytes.to_a
      expect(body_binary).to eq(asset_binary)
    end


    it "shares values/changes of instance vars between view and helpers" do
      expect { get :instance_var_test, :format => :pdf }.to_not raise_error
    end

    it "should render items in a block passed to a helper" do
      get :yield_block_in_helper_test, :format => :pdf
      expect(response).to be_successful

      asset_binary = File.open(asset_path("yield_block_in_helper_test")).read.bytes.to_a
      body_binary = response.body.bytes.to_a
      expect(body_binary).to eq(asset_binary)
    end
  end


  describe "dsl" do
    it "returns correct PDF" do
      get :dsl_render, :format => :pdf
      expect(response).to be_successful

      asset_binary = File.open(asset_path("dsl_render")).read.bytes.to_a
      body_binary = response.body.bytes.to_a
      expect(body_binary).to eq(asset_binary)
    end
  end

  describe "partials" do
    it "renders partials" do
      get :partial_render, :format => :pdf
      expect(response).to be_successful

      asset_binary = File.open(asset_path("partial_render")).read.bytes.to_a
      body_binary = response.body.bytes.to_a
      expect(body_binary).to eq(asset_binary)
    end
  end

  describe "complex headers" do
    it "should return a file with a specified filename" do
      get :filename_test, :format => :pdf
      expect(response).to be_successful

      expect(response.header["Content-Disposition"]).to eq("attachment;filename=\"fancy_name.pdf\"")
    end

  end

end
