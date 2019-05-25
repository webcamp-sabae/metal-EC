module Admins::PurchasesHelper

  def search_term(beginning_term, end_term)
    return {
      created_at_gt: beginning_term,
      created_at_lt: end_term
      }
  end

end
