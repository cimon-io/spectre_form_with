module SpectreFormWith
  module Helper
    def spectre_form_with(**options, &block)
      form_with(**options.merge(builder: SpectreFormWith::FormBuilder), &block)
    end
  end
end
