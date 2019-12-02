crons_config_path = Rails.root.join 'config', 'sidekiq_crons.yml'

if File.exist?(crons_config_path) && Sidekiq.server?
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(crons_config_path)
elsif Sidekiq.server?
  Rails.logger.info 'NO Sidekiq crons'
end
