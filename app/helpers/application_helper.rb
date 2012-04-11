module ApplicationHelper
  def deferred(&block)
    @deferred_content ||= ""
    @deferred_content << capture(&block)
  end
end