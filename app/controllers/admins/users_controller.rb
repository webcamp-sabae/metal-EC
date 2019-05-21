class Admins::UsersController < Admins::AdminsController
  before_action :set_user, only: [:show, :edit]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

end


# <%= form.text_field :email %>
# <%= form.submit %>
#
# <%= form_with(...) do |form| %>
#   <%= form.label(:genre) %>
#   <%= form.text_field(:genre, id: :title_genre) %>
# <% end %>
