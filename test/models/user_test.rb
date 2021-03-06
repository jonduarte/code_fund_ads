# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  address_1              :string
#  address_2              :string
#  api_access             :boolean          default(FALSE), not null
#  api_key                :string
#  bio                    :text
#  city                   :string
#  company_name           :string
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  country                :string
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           not null
#  encrypted_password     :string           not null
#  failed_attempts        :integer          default(0), not null
#  first_name             :string           not null
#  github_username        :string
#  invitation_accepted_at :datetime
#  invitation_created_at  :datetime
#  invitation_limit       :integer
#  invitation_sent_at     :datetime
#  invitation_token       :string
#  invitations_count      :integer          default(0)
#  invited_by_type        :string
#  last_name              :string           not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  linkedin_username      :string
#  locked_at              :datetime
#  paypal_email           :string
#  postal_code            :string
#  record_inbound_emails  :boolean          default(FALSE)
#  referral_click_count   :integer          default(0)
#  referral_code          :string
#  region                 :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  roles                  :string           default([]), is an Array
#  sign_in_count          :integer          default(0), not null
#  skills                 :text             default([]), is an Array
#  status                 :string           default("active")
#  twitter_username       :string
#  unconfirmed_email      :string
#  unlock_token           :string
#  us_resident            :boolean          default(FALSE)
#  utm_campaign           :string
#  utm_content            :string
#  utm_medium             :string
#  utm_source             :string
#  utm_term               :string
#  website_url            :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  invited_by_id          :bigint
#  legacy_id              :uuid
#  organization_id        :bigint
#  referring_user_id      :bigint
#  stripe_customer_id     :string
#
# Indexes
#
#  index_users_on_confirmation_token                 (confirmation_token) UNIQUE
#  index_users_on_email                              (lower((email)::text)) UNIQUE
#  index_users_on_invitation_token                   (invitation_token) UNIQUE
#  index_users_on_invitations_count                  (invitations_count)
#  index_users_on_invited_by_id                      (invited_by_id)
#  index_users_on_invited_by_type_and_invited_by_id  (invited_by_type,invited_by_id)
#  index_users_on_organization_id                    (organization_id)
#  index_users_on_referral_code                      (referral_code) UNIQUE
#  index_users_on_referring_user_id                  (referring_user_id)
#  index_users_on_reset_password_token               (reset_password_token) UNIQUE
#  index_users_on_unlock_token                       (unlock_token) UNIQUE
#

require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "roles can be set" do
    subject = User.new
    subject.roles = ["admin"]
    assert_not subject.valid?
    puts subject.errors[:roles]
    # assert subject.errors[:roles].empty?
  end
end
