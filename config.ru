#!/usr/bin/env rackup
# encoding: utf-8

# This file can be used to start Padrino,
# just execute it from the command line.

require File.expand_path("../config/boot.rb", __FILE__)

if Padrino.env == :development
  map '/assets' do
    run PhpSerializer::App.sprockets
  end
end

run Padrino.application
