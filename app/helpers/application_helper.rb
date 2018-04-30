module ApplicationHelper
  class ActionView::Helpers::FormBuilder
    include AutocompleteHelper
  end

  include DatetimeHelper
  include DeviseHelper
end
