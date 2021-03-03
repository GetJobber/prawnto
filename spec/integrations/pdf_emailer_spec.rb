require File.expand_path("../spec_helper.rb", File.dirname(__FILE__))

describe PdfEmailer do
  describe "email_with_attachment" do
    before(:all) do
      @email = PdfEmailer.email_with_attachment.deliver_now
    end

    it "should have the plain text on the body" do
      expect(@email.encoded).to include "text\/plain"
      expect(@email.encoded).to include "Please see attached PDF"
    end

    it "should have the PDF attached" do
      expect(@email.encoded).to include "application\/pdf"
      expect(@email.encoded).to include "Content-Disposition: attachment;"
      expect(@email.encoded).to include "filename=hello_world.pdf"
    end

  end
end
