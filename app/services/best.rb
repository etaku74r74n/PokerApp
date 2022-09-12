module Best
  def search_best(score_array, results)
    score_array.each_with_index do |_, i|
      score = results[i]["best"]
      true_or_false = (score == score_array.max)
      results[i]["best"] = true_or_false
    end
    results
  end
  module_function :search_best
end