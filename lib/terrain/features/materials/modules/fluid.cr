module Fluid

  DEEP_DEPTH = 4

  @depth : (Int32)?

  def depth(val = Random.rand(7))
    @depth = val
  end

  def depth
    @depth ||= Random.rand(7)
  end
end
