module Pwinty
  class Error < StandardError; end

  class BadRequest < Error; end

  class NotFound < Error; end

  class NotAuthorized < Error; end
end
