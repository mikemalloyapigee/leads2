class Mtworker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(test_result_id, num)
    debugger
    test_result = TestResult.find(test_result_id)
    test_result.number = num * 10
    test_result.save
  end

end