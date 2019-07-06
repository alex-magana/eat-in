module Response
  # See the links below for possible status code symbols
  # https://www.rubydoc.info/gems/rack/Rack/Utils#SYMBOL_TO_STATUS_CODE-constant
  # https://www.rubydoc.info/gems/rack/Rack/Utils#HTTP_STATUS_CODES-constant
  def json_response(object, status_code = :ok)
    render json: object, status: status_code
  end
end