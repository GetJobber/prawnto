require "spec_helper"
require "prawnto/template_handlers/partials.rb"

class PartialTester
  attr_accessor :pdf
  include Prawnto::TemplateHandlers::Partials
end
describe "Prawnto::TemplateHandlers::Partials" do
  subject do
    PartialTester.new
  end

  describe "#get_file_path" do
    before { Rails.stubs(:root).returns("") }

    it "should find partial in the same folder" do
      Dir.expects("[]").with("/app/views/test/_p1.{*.}prawn").returns("some/path")
      path = subject.send :get_file_path, "test/p1"
    end

    it "won't insert underscore if provided" do
      Dir.expects("[]").with("/app/views/test/_p1.{*.}prawn").returns("some/path")
      path = subject.send :get_file_path, "test/_p1"
    end

    it "should look in the current folder first" do
      skip
    end
  end

  describe "#partial_source" do
  end

  describe "#render_partial" do
    let(:prawn_object) { mock("prawn_object") }
    let(:nested_prawn_object) { mock("nested_prawn_object") }
    let(:prawn_document) {mock("prawn_document") }
    before {
      subject.stubs(:partial_source).returns("pdf.prawn_method")
      subject.pdf = prawn_document
    }

    it "should default to rendering off the prawn document" do
      prawn_document.expects(:prawn_method)
      subject.partial! "some/path"
    end

    it "should default to rendering off the prawn document" do
      prawn_object.expects(:prawn_method)
      subject.partial! "some/path", prawn_object
    end

    it "should return to the original pdf object upon completion" do
      prawn_object.stubs(:prawn_method)
      subject.partial! "some/path", prawn_object
      expect(subject.pdf).to eq(prawn_document)
    end

    it "should handle nested partials" do
      subject.stubs(:nested_prawn_object).returns(nested_prawn_object)
      subject.stubs(:partial_source).with("partial1").returns("partial! 'partial2', nested_prawn_object")
      subject.stubs(:partial_source).with("partial2").returns("pdf.nested_prawn_method")

      nested_prawn_object.expects("nested_prawn_method")
      subject.partial! "partial1", prawn_object
      expect(subject.pdf).to eq(prawn_document)
    end

  end
end
