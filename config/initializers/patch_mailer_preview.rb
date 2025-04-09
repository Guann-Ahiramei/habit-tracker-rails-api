# config/initializers/patch_mailer_preview.rb

# Temporary patch to avoid `preview_path=` NoMethodError in ActionMailer for Rails 8
class << ActionMailer::Base
  def preview_path=(_)
    # noop: ignore preview_path setting
  end
end
