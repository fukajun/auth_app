Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identity, :fields => [:email], :model => Identity,
    on_failed_registration: UsersController.action(:new)
  OmniAuth.config.on_failure = Proc.new do |env|
    OmniAuth::FailureEndpoint.new(env).redirect_to_failure
  end
end
