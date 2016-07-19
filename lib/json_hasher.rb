require 'json_hasher/version'
require 'json'
require 'digest/sha2'

module JSONHasher
  class Parser
    def initialize(json_string)
      raise 'JSONHasher only takes a String' unless json_string.is_a?(String)
      @parsed_json = JSON.parse(json_string)
    end

    def to_sha2
      hash_parsed_json(@parsed_json)
    end

    private

    def hash_parsed_json(parsed_json)
      case parsed_json.class.name
      when 'Array'
        hash_array(parsed_json)
      when 'Hash'
        hash_object(parsed_json)
      else
        hash_other(parsed_json)
      end
    end

    def hash_array(array)
      mapped = array.map do |elm|
        hash_parsed_json(elm)
      end
      hash_other(mapped)
    end

    def hash_object(obj)
      pairs = obj.to_a.sort_by(&:first)
      hash_array(pairs)
    end

    def hash_other(value)
      value_type = value.class.to_s
      value_string = value.to_s
      hashed = Digest::SHA2.new << "#{value_type}\"\"#{value_string}"
      hashed.to_s
    end
  end
end
