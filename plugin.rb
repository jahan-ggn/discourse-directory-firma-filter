# frozen_string_literal: true

# name: discourse-directory-firma-filter
# about: TODO
# meta_topic_id: TODO
# version: 0.0.1
# authors: Discourse
# url: TODO
# required_version: 2.7.0

enabled_site_setting :discourse_directory_firma_filter_enabled

module ::DiscourseDirectoryFirmaFilter
  PLUGIN_NAME = "discourse-directory-firma-filter"
end

require_relative "lib/discourse_directory_firma_filter/engine"

after_initialize do
  # Code which should run after Rails has finished booting
end
