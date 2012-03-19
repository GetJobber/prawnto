module Prawnto
  module TemplateHandlers
    module Partials

      # Can be called within a prawn template to render a partial below it.
      # :partial_name - Current has to be the entire path from the views folder. Doesn't recognize the folder of the
      #                 current template.
      # :prawn_object - The object to use for the pdf object in the partial.
      #                 Defaults to the pdf document, but can take a paramenter to render within a prawn object. This
      #                 is good for items like tables, text_blocks, etc.
      def partial!(partial_name, prawn_object = pdf)
        @pdf_stack ||= []
        @pdf_stack.push @pdf
        @pdf = prawn_object
        instance_eval partial_source(partial_name)
        @pdf = @pdf_stack.pop
      end

    private

      def partial_source(partial_name)
        #todo: implement some caching
        File.open( get_file_path(partial_name)).read
      end

      def get_file_path(partial_name)
        root_path = Rails.root
        view_path = File.join(root_path, "app/views/")
        partial_path = cleaned_path(partial_name)

        file_path = Dir[File.join(view_path, partial_path + ".{*.}prawn")].first
        file_path
      end

      def cleaned_path(provided_partial_path)
        if (RUBY_VERSION > "1.8.7")
          eval('*provided_path, file_name = provided_partial_path.split("/")')
        else
          splitted_provided_partial_path = provided_partial_path.split("/")
          provided_path = splitted_provided_partial_path[0..-2]
          file_name = splitted_provided_partial_path.last
        end

        file_name = "_"+file_name unless file_name[0] == "_"
        File.join(provided_path, file_name)
      end

    end
  end
end
