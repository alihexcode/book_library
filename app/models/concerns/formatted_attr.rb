module FormattedAttr
  extend ActiveSupport::Concern

  class_methods do
    def has_formatted_date(*attributes)
      attributes.each do |attribute|
        define_method "formatted_#{attribute.to_s}" do
          self.send(attribute).strftime('%d %B %Y')
        rescue NoMethodError
          return '-' if self.send(attribute).blank?

          self.send(attribute)
        end
      end
    end

    def has_shorten_text(*attributes)
      attributes.each do |attribute|
        define_method "shorten_#{attribute.to_s}" do
          return '-' if self.send(attribute).blank?

          self.send(attribute).to_s.truncate(225 , omission: '..')
        end
      end
    end
  end
end
