# frozen_string_literal: true
module Stupidedi
  module Interchanges
    module FiveOhOne
      module SegmentDefs
        s = Schema
        e = ElementDefs
        r = ElementReqs

        # @todo
        ISE = s::SegmentDef.build(:ISE, "Deferred Delivery Request", "")
      end
    end
  end
end
