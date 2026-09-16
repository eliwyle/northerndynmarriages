# Compatibility patch: Liquid 4.0.3 (pinned by the github-pages gem) calls
# Object#tainted?, which was removed in newer Ruby versions. Tainting is a
# retired Ruby security feature, so disabling the check is safe.
module Liquid
  class Variable
    def taint_check(_context, _obj)
      # no-op: Ruby 3.2+ removed Object#tainted?
    end
  end
end