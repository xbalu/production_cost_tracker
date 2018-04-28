module ApplicationUserHelper
  def signed_in?(application_user)
    if application_user.last_sign_in_at.to_i > application_user.last_sign_out_at.to_i
      'glyphicon glyphicon-ok-circle text-success'
    else
      'glyphicon glyphicon-remove-circle text-danger'
    end
  end
end
