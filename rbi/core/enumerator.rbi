# typed: __STDLIB_INTERNAL

class Enumerator < Object
  include Enumerable

  extend T::Generic
  Elem = type_member(:out)

  sig do
    params(
        blk: T.proc.params(arg0: Elem).returns(BasicObject),
    )
    .returns(T.untyped)
  end
  sig {returns(T.self_type)}
  def each(&blk); end

  sig do
    params(
        blk: T.proc.params(arg0: Elem, arg1: Integer).returns(BasicObject),
    )
    .returns(T.untyped)
  end
  sig {returns(T::Enumerator[[Elem, Integer]])}
  def each_with_index(&blk); end

  sig do
    type_parameters(:U).params(
        arg0: T.type_parameter(:U),
        blk: T.proc.params(arg0: Elem, arg1: T.type_parameter(:U)).returns(BasicObject),
    )
    .returns(T.untyped)
  end
  sig do
    type_parameters(:U).params(
        arg0: T.type_parameter(:U),
    )
    .returns(T::Enumerator[[Elem, T.type_parameter(:U)]])
  end
  def each_with_object(arg0, &blk); end

  sig do
    params(
        arg0: Elem,
    )
    .returns(NilClass)
  end
  def feed(arg0); end

  sig do
    params(
        arg0: Integer,
        blk: T.proc.params(arg0: Enumerator::Yielder).void,
    )
    .void
  end
  def initialize(arg0=T.unsafe(nil), &blk); end

  sig {returns(String)}
  def inspect(); end

  sig {returns(Elem)}
  def next(); end

  sig {returns(T::Array[Elem])}
  def next_values(); end

  sig {returns(Elem)}
  def peek(); end

  sig {returns(T::Array[Elem])}
  def peek_values(); end

  sig {returns(T.self_type)}
  def rewind(); end

  sig {returns(T.nilable(T.any(Integer, Float)))}
  def size(); end

  sig do
    params(
        blk: T.proc.params(arg0: Elem, arg1: Integer).returns(BasicObject),
    )
    .returns(T.untyped)
  end
  sig {returns(T::Enumerator[[Elem, Integer]])}
  def with_index(&blk); end

  sig do
    type_parameters(:U).params(
        arg0: T.type_parameter(:U),
        blk: T.proc.params(arg0: Elem, arg1: T.type_parameter(:U)).returns(BasicObject),
    )
    .returns(T.untyped)
  end
  sig do
    type_parameters(:U).params(
        arg0: T.type_parameter(:U),
    )
    .returns(T::Enumerator[[Elem, T.type_parameter(:U)]])
  end
  def with_object(arg0, &blk); end
end

class Enumerator::Generator < Object
  include Enumerable

  extend T::Generic
  Elem = type_member(:out)
end

class Enumerator::Lazy < Enumerator
  extend T::Generic
  Elem = type_member(:out)
end

class Enumerator::Yielder < Object
  sig do
    params(
        arg0: BasicObject,
    )
    .void
  end
  def <<(*arg0); end

  sig do
    params(
        arg0: BasicObject,
    )
    .void
  end
  def yield(*arg0); end
end
