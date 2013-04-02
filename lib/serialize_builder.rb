require 'csv'
require 'php_serialization'

module SerializeBuilder
  extend self

  def build!(file_content)
    contentHash = CSV.parse(file_content, headers: true, converters: :numeric, header_converters: :symbol).map{ |row|
      row.to_hash
    }.group_by { |row|
      row[:category].to_sym
    }

    PhpSerialization.dump(contentHash)
  end
end
