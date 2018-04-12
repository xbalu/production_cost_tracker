class WorkOnOperationsController < ApiController
  def active
  end

  def identify
  end

  def start
  end

  def finish
  end

  private

  def active_attributes
    params.permit(:token)
  end

  def identify_attributes
    params.permit(:token, :key)
  end

  def start_attributes
    params.permit(:token, :key)
  end

  def finish_attributes
    params.permit(:token, :id)
  end
end
