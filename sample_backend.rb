require 'ostruct'

class SampleBackend
  FILES = {
    'one.txt' => "This is the first file available for download.\n\nBy James",
    'two.txt' => "This is the file number two.\n\n2009-03-21"
  }

  def cwd dirname
    true
  end

  def list dirname
    r = []
    FILES.each do |fname,content|
      r << [fname, OpenStruct.new(
        :size  => content.size,
        :atime => Time.now,
        :mtime => Time.now,
        :ctime => Time.now,
        :uid   => 0,
        :gid   => 0,
        :mode  => 0555
      )]
    end
    r
  end

  def pwd
    '.'
  end

  def retr fname
    fname = fname.sub(/^\/+/, '')
    FILES[fname]
  end

  def size fname
    fname = fname.sub(/^\/+/, '')
    FILES.key?(fname) ? FILES[fname].size : nil
  end
end
