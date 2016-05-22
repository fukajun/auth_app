Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identity, :fields => [:email], :model => Identity, on_failed_registration: IdentitiesController.action(:new)
  OmniAuth.config.on_failure = Proc.new { |env|
    OmniAuth::FailureEndpoint.new(env).redirect_to_failure
  }
end
