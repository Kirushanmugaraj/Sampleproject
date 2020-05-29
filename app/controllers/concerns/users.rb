module Users
  extend ActiveSupport::Concern

  included do

    def user_params
      params.require(:user).permit(
        :username,
        :email,
        :password,
        personal_detail_attributes: [
          :contact_no,
          :address,
          :id,
        ],
        education_details_attributes: [
          :college_name,
          :degree,
          :_destroy,
          :id
        ],
        professional_details_attributes:[
          :prev_employer,
          :position,
          :_destroy,
          :id
        ]
      )
    end

  end
end
