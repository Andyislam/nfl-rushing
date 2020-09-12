# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @source_json = source_json

    @source_json.map do |i|
      i.keys.each_with_index do |v, index|
        i[index] = i.delete(v)
      end
    end

    @col_headers = col_headers source_json[0]
  end

  def col_headers(record)
    record.keys
  end

  def source_json
    response = HTTParty.get('http://raw.githubusercontent.com/tsicareers/nfl-rushing/master/rushing.json')
    JSON.parse(response.body)
  end
end
