require "spec_helper"

describe TestController do

  class PrawntoControllerWithInlineTrue < TestController
    prawnto :inline=>true, :prawn=>{:page_orientation=>:landscape}
  end

  it "Controller should start with the defaults" do
    @controller = TestController.new
    expect(@controller.send(:compute_prawnto_options)).to eq({:inline=>true, :prawn => {}})
  end

  describe ".prawnto" do
    it "should store prawn_hash" do
      expect(PrawntoControllerWithInlineTrue.prawn_hash).to eq({:page_orientation=>:landscape})
    end

    it "should store prawnto_hash" do
      expect(PrawntoControllerWithInlineTrue.prawnto_hash).to eq({:inline=>true})
    end
  end

  describe "#prawnto" do
    before do
      @controller = TestController.new
      @controller.send(:prawnto, {:inline=>false})
    end

    it "should affect that controller" do
      expect(@controller.send(:compute_prawnto_options)).to eq ({:inline=>false, :prawn => {}})
    end

    it "should not affect the controller class" do
      expect(PrawntoControllerWithInlineTrue.new.send(:compute_prawnto_options)).to eq({:inline=>true, :prawn=>{:page_orientation=>:landscape}})
    end
  end

  describe "#compute_prawnto_options" do
    it "should merge the class settings and the instance settings" do
      @controller = TestController.new
      @controller.send(:prawnto, {:inline=>false, :prawn=>{:page_orientation=>:landscape, :page_size=>'A4'}})
      expect(@controller.send(:compute_prawnto_options)).to eq({:inline=>false, :prawn=>{:page_orientation=>:landscape, :page_size=>'A4'}})
    end
  end

end

