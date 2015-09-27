class GearListConstraint
  def matches?(request)
    params = request.path_parameters
    long_code(params)
  end

  private

    def long_code(params)
      !params[:list_uuid].match(/([a-zA-Z]|\d){4}-([a-zA-Z]|\d){4}-([a-zA-Z]|\d){4}-([a-zA-Z]|\d){4}/).nil?
    end
end
