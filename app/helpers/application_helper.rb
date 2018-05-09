module ApplicationHelper
  class ActionView::Helpers::FormBuilder
    include AutocompleteHelper
  end

  include ActivityHelper
  include DatetimeHelper
  include DeviseHelper
end
