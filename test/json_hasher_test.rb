require 'test_helper'

class JSONHasherTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::JSONHasher::VERSION
  end

  def test_it_stable_hashes_the_same_json_data_root_array
    test_json_one = '[{ "foo": "bar", "ping": "pong" }]'
    test_json_two = '[{ "ping": "pong", "foo": "bar" }]'

    hashed_one = ::JSONHasher::Parser.new(test_json_one).to_sha2
    hashed_two = ::JSONHasher::Parser.new(test_json_two).to_sha2

    assert_equal hashed_one, hashed_two
  end

  def test_it_stable_hashes_the_same_json_data_root_object
    test_json_one = '{ "foo": "bar", "ping": "pong" }'
    test_json_two = '{ "ping": "pong", "foo": "bar" }'

    hashed_one = ::JSONHasher::Parser.new(test_json_one).to_sha2
    hashed_two = ::JSONHasher::Parser.new(test_json_two).to_sha2

    assert_equal hashed_one, hashed_two
  end

  def test_it_stable_hashes_the_same_json_data_root_object_complex
    test_json_one = '[{ "foo": "bar", "ping": { "foo": ["bar", { "cat": "dog" }] } }]'
    test_json_two = '[{ "ping": { "foo": ["bar", { "cat": "dog" }] }, "foo": "bar" }]'

    hashed_one = ::JSONHasher::Parser.new(test_json_one).to_sha2
    hashed_two = ::JSONHasher::Parser.new(test_json_two).to_sha2

    assert_equal hashed_one, hashed_two
  end

  def test_it_stable_hashes_different_objects
    test_json_one = '[{ "foo": "pong", "ping": "bar" }]'
    test_json_two = '[{ "ping": "pong", "foo": "bar" }]'

    hashed_one = ::JSONHasher::Parser.new(test_json_one).to_sha2
    hashed_two = ::JSONHasher::Parser.new(test_json_two).to_sha2

    assert hashed_one != hashed_two
  end
end
