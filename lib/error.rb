module Pwinty
  class Error < StandardError; end

  class BadRequiest < Error; end

  class NotAuthorized < Error; end
end
