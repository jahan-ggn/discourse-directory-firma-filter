# frozen_string_literal: true

# name: discourse-directory-firma-filter
# about: Adds a Firma dropdown to the User Directory and auto-fills the search field, allowing users to filter directory results by Firma.
# version: 0.0.1
# authors: Jahan Gagan
# url: https://github.com/jahan-ggn/discourse-directory-firma-filter

enabled_site_setting :discourse_directory_firma_filter_enabled

module ::DiscourseDirectoryFirmaFilter
  PLUGIN_NAME = "discourse-directory-firma-filter"
end

require_relative "lib/discourse_directory_firma_filter/engine"

after_initialize do
  module ::DiscourseDirectoryFirmaFilter
    NORMALIZE_PATTERN   = /[^\p{L}\p{N}]+/u.freeze
    MULTISPACE_PATTERN  = /\s+/.freeze

    def index
      normalize_search_param! if SiteSetting.discourse_directory_firma_filter_enabled
      super
    end

    private

    def normalize_search_param!
      raw = params[:name]
      return unless raw.present?

      normalized =
        raw
          .gsub(NORMALIZE_PATTERN, " ")
          .gsub(MULTISPACE_PATTERN, " ")
          .strip

      params[:name] = normalized
    end
  end
  ::DirectoryItemsController.prepend ::DiscourseDirectoryFirmaFilter
end
