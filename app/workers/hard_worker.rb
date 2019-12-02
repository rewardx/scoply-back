class HardWorker
  include Sidekiq::Worker

  def perform
    puts 'WORKER !!!!'
  end
end
