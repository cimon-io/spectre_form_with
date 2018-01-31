module SpectreFormWith
  module Helper
    def spectre_form_with(options = {}, &block)
      temporarily_disable_field_error_proc do
        form_with(options.merge({ builder: SpectreFormWith::FormBuilder, id: dom_id(options[:model]) }), &block)
      end
    end

    def temporarily_disable_field_error_proc
      original_proc = ActionView::Base.field_error_proc
      ActionView::Base.field_error_proc = proc { |input, instance| input }
      yield
    ensure
      ActionView::Base.field_error_proc = original_proc
    end
  end
end
