require 'test/unit'
require 'series_renamer'

class Class
  def publicize_methods
    saved_private_instance_methods = self.private_instance_methods
    self.class_eval { public *saved_private_instance_methods }
    yield
    self.class_eval { private *saved_private_instance_methods }
  end
end

class SeriesRenamerTest < Test::Unit::TestCase
  def test_filename_with_convention_default
    file_path = "/test_series/Serie\ 1/Season\ 1/ep1.avi"
    attended_file = "/test_series/Serie\ 1/Season\ 1/Serie\ 1\ -\ S01E01.avi"
    SeriesRenamer.publicize_methods do
      assert_equal(attended_file, SeriesRenamer.filename_with_convention(file_path))
    end
  end
  def test_filename_with_convention_with_regex
    file_path = "/test_series/Serie\ 1/Season\ 1/p1.avi"
    attended_file = "/test_series/Serie\ 1/Season\ 1/Serie\ 1\ -\ S01E01.avi"
    SeriesRenamer.publicize_methods do
      assert_equal(attended_file, SeriesRenamer.filename_with_convention(file_path, {:regex => /(?:p)(\d+)/i}))
    end
  end
end