class Admins::PurchasesController < Admins::AdminsController
  def index
    @q = Purchase.ransack(params[:q])
    @purchases = @q.result

    # @term = Purchase.ransack(params[:q])
    # @purchases = @term.result
    # @purchases = Purchase.all
  end

end

# def index
#   unless params[:q].present?
#     @q = User.ransack
#   else
#     @q = User.ransack(
#       name_or_nationality_cont_any:
#       params[:q][:name_or_nationality_cont_any].split(/[\s|　]/)
#     )
#   end
#  @users = @q.result
#  @q_sql = @q.result.to_sql
# end
