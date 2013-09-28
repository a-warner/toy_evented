class Globals
  def initialize(run_loop)
    @run_loop = run_loop
  end

  def set_timeout(interval, repeats = nil, &block)
    @run_loop.schedule(interval, block, repeats)
  end

  def set_interval(time, &block)
    set_timeout(time, :repeats, &block)
  end
end
