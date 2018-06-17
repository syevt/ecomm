module Ecomm
  module TranslationHelpers
    def attr_blank_error(model, attribute)
      t("activemodel.errors.models.#{model}.attributes.#{attribute}.blank")
    end

    def attr_invalid_error(model, attribute)
      t("activemodel.errors.models.#{model}.attributes.#{attribute}.invalid")
    end
  end
end
