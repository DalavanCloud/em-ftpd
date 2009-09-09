# !!!  WARNING  !!!
# this file is an example only!
# using it in production or on some real servers
# may reveal all your secret data to anyone!
#
class RealFSBackend
  def cwd dirname
    Dir.chdir dirname
    true
  rescue
    false
  end

  def list dirname
    Dir['*'].map{ |fname| [fname,File.stat(fname)] if File.readable?(fname) }.compact
  end

  def pwd
    Dir.pwd
  end

  def retr fname
    return false unless File.file?(fname)
    File.read(fname)
  end

  def size fname
    File.size(fname)
  end
end
