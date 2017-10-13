module SimpleForm
  module Inputs
    #
    # Class this class overrides the regular wrapper_options on simple_form configurations
    # extracted from: https://stackoverflow.com/questions/21559545/how-can-i-add-an-error-class-to-the-input-on-error-using-simple-form
    #
    # @author Johan Tique <johan.tique@analisistem.com>
    #
    class Base
      def merge_wrapper_options(options, wrapper_options)
        working_wrapper_options = wrapper_options.dup

        if working_wrapper_options
          if working_wrapper_options[:error_class] && has_errors?
            working_wrapper_options[:class] =
              [working_wrapper_options[:class]] + \
              [working_wrapper_options[:error_class]]
          end
          working_wrapper_options.delete(:error_class)

          working_wrapper_options.merge(options) do |key, oldval, newval|
            case key.to_s
            when "class"
              Array(oldval) + Array(newval)
            when "data", "aria"
              oldval.merge(newval)
            else
              newval
            end
          end
        else
          options.dup
        end
      end
    end
  end
end
