module SpectreFormWith
  class FormBuilder < ActionView::Helpers::FormBuilder
    [
      :text_field, :text_area, :email_field, :password_field, :telephone_field,
      :url_field, :week_field, :time_field, :search_field, :range_field, 
      :month_field, :number_field, :datetime_field, :datetime_local_field,
      :color_field, :file_field
    ].each do |selector|
      define_method(selector) do |name, **options|
        options ||= {}
        input_class = ['form-input']
        input_class.push('is-error') if object && object.errors.has_key?(name)

        super(name, insert_class(options, input_class))
      end
    end

    def form_icon
      @template.content_tag(:i, '', class: 'form-icon')
    end

    def radio_button(name, tag_value, options = {})
      super(name, tag_value, options)
      input + form_icon
    end

    def check_box(name, options = {}, checked_value = '1', unchecked_value = '0')
      input = super(name, insert_class(options, ''), checked_value, unchecked_value)
      icon = @template.content_tag(:i, '', class: 'form-icon')
      input + icon
    end

    def select(name, choices = nil, options = {}, html_options = {}, &block)
      super(name, choices, options, insert_class(html_options, 'form-select', 'is-error': object && object.errors.has_key?(name)), &block)
    end

    def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
      super(method, collection, value_method, text_method, options, insert_class(html_options, 'form-select', 'is-error': object && object.errors.has_key?(method)))
    end
    
    alias default_label label
    def label(name, text = nil, options = {}, &block)
      default_label(name, text, insert_class(options, 'form-label'), &block)
    end
    
    def check_label(name, options = {}, &block)
      default_label(name, insert_class(options, 'form-checkbox'), &block)
    end
    
    def radio_label(name, options = {}, &block)
      default_label(name, insert_class(options, 'form-switch'), &block)
    end

    def error_notification(message = nil)
      return unless object && object.errors.any?
      message = message || 'Please review the problems below:'
      @template.content_tag(:div, message, class: 'toast toast-error')
    end

    def errors(name)
      return unless object && object.errors.has_key?(name)
      errors ||= object.errors.full_messages_for(name).join(', ').remove(' ' + name.to_s.capitalize) + '.'
      @template.content_tag(:div, errors, class: 'form-input-hint')
    end

    def hint(message, tag = :p)
      @template.content_tag(tag, message, class: 'form-input-hint')
    end

    def group(name, &block)
      group_class = ['form-group']
      # group_class.push('has-error') if object.errors.has_key?(name)

      content = @template.capture(&block)
      @template.content_tag(:div, content, class: group_class.join(' '))
    end

    private

    def insert_class(options, *class_names, **conditional_class_names)
      output = options.dup
      
      output[:class] = ((output[:class] || '') + ' ' + (class_names + conditional_class_names.map { |k, v| v ? k : nil }.compact).map(&:to_s).uniq.join(' ')
      output
    end
  end
end
