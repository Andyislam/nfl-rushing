# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/cashed_json' => 'welcome#cashed_json'
end
