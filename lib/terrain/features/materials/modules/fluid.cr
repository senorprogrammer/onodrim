module Fluid
  #property depth

  @depth : (Int32)?

  def depth(val = Random.rand(7))
    @depth = val
  end

  def depth
    @depth ||= Random.rand(7)
  end
end
