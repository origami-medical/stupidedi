# frozen_string_literal: true
module Stupidedi
  module Versions
    module ThirtyForty
      module SegmentDefs
        s = Schema
        e = ElementDefs
        r = ElementReqs

        PER = s::SegmentDef.build(:PER, "Administrative Communications Contact",
          "To identify a person or office to whom administrative communications
          should be directed",
          e::E366 .simple_use(r::Mandatory,  s::RepeatCount.bounded(1)),
          e::E93  .simple_use(r::Optional,   s::RepeatCount.bounded(1)),
          e::E365 .simple_use(r::Relational, s::RepeatCount.bounded(1)),
          e::E364 .simple_use(r::Relational, s::RepeatCount.bounded(1)))
      end
    end
  end
end
