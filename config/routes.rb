# frozen_string_literal: true

DiscourseDirectoryFirmaFilter::Engine.routes.draw do
  get "/examples" => "examples#index"
  # define routes here
end

Discourse::Application.routes.draw { mount ::DiscourseDirectoryFirmaFilter::Engine, at: "discourse-directory-firma-filter" }
