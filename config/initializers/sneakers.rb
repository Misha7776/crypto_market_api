Sneakers.configure(
  amqp: RCreds.fetch(:rabbitmq_uri),
  exchange: :default,
  exchange_type: :direct,
  workers: 1,
  threads: 1,
  timeout_job_after: 30
)

Sneakers.configure after_fork: Proc.new { ActiveRecord::Base.establish_connection }
Sneakers.logger.level = Logger::INFO