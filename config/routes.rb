# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/source_json' => 'welcome#source_json'
end
